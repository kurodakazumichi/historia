class HistoriesController < ApplicationController
  def create
    @technology = Technology.find(params[:technology_id])

    @technology.histories.create(history_params)
    redirect_to technology_path(@technology)
  end

  def destroy
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.find(params[:id])
    @history.destroy
    redirect_to technology_path(@technology)
  end

  private
  def history_params
    params.require(:history).permit(:title)
  end
end
