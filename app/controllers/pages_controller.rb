class PagesController < ApplicationController

  def index

    year_min = History.minimum(:year)
    year_max   = History.maximum(:year)
    @years = [*year_min..year_max]

    @filter = {
      from: year_min,
      to: year_max,
      query: ""
    }

    unless params[:search].nil?
      search = params.require(:search).permit(:from, :to, :query)
      @filter[:from]  = search[:from].to_i
      @filter[:to]    = search[:to].to_i
      @filter[:query] = search[:query]
      @filter[:from]  = year_min if @filter[:from] < year_min
      @filter[:to]    = year_max if @filter[:to] < year_max
    end

    # 検索ワードを分割(全角スペース、または, or ;)
    words = @filter[:query].gsub(/(,|;|　)/, " ")
    words = words.split(" ")

    # 検索ワードに該当するタグを取得
    tags = Tag
    words.each_with_index do |word, index|
      tags = tags.where("name like ?", "%#{word}%") if (index == 0)
      tags = tags.or(Tag.where("name like ?", "%#{word}%")) if index != 0
    end
    tags = tags.group(:id)

    # タグに紐ずくテクノロジーを取得
    technology_ids = TechnologyTag
      .where(tag_id: tags.pluck(:id))
      .group(:technology_id)
    technology_ids = technology_ids.pluck(:technology_id)

    # タグ、もしくは検索ワードに該当するテクノロジーを取得
    @technologies = Technology.all.where(id: technology_ids)
    words.each do |word|
      @technologies = @technologies.or(Technology.where("name like ?", "%#{word}%"))
    end
    @technologies = @technologies.order(:year, :month, :day)

    # テクノロジーの歴史を取得
    @histories = History
      .where(technology_id: @technologies.pluck(:id))
      .where('year >= ?', @filter[:from])
      .where('year <= ?', @filter[:to])
      .order(:year, :month, :day)

  end
end
