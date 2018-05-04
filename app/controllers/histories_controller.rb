class HistoriesController < ApplicationController
  def create
    @technology = Technology.find(params[:technology_id])

    @technology.histories.create(history_params)
    redirect_to technology_path(@technology)
  end

  private
  def history_params
    params.require(:history).permit(:title)
  end
end
