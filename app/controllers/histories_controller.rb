class HistoriesController < ApplicationController

  def new
    @technology = Technology.find(params[:technology_id])
  end

  def edit
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.find(params[:id])
  end

  def create
    @technology = Technology.find(params[:technology_id])

    @technology.histories.create(history_params)
    redirect_to technology_path(@technology)
  end

  def update
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.find(params[:id])
    @history.update(history_params)
    redirect_to edit_technology_history_path(@technology, @history)
  end

  def destroy
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.find(params[:id])
    @history.destroy
    redirect_to technology_path(@technology)
  end

  private
  def history_params
    params.require(:history).permit(:title, :description)
  end
end
