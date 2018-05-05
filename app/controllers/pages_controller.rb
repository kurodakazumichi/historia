class PagesController < ApplicationController
  def index
    @technologies = Technology.all.order(:year, :month, :day)
    @histories = History.all.order(:year, :month, :day)
  end
end
