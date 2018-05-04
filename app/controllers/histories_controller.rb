class HistoriesController < ApplicationController

  def new
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.new
  end

  def edit
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.find(params[:id])
  end

  def create
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.new(history_params)
    if @history.save
      redirect_to new_technology_history_path(@technology)
    else
      render :new
    end

  end

  def update
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.find(params[:id])
    if @history.update(history_params)
      redirect_to edit_technology_history_path(@technology, @history)
    else
      render :edit
    end

  end

  def destroy
    @technology = Technology.find(params[:technology_id])
    @history = @technology.histories.find(params[:id])
    @history.destroy
    redirect_to technology_path(@technology)
  end

  private
  def history_params
    params.require(:history).permit(:title, :description, :year, :month, :day)
  end
end
