class TalksController < ApplicationController
  protect_from_forgery

  def index
    @talks = Talk.all
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def new
    @talk = Talk.initialize_with_nested_models
    redirect_to talks_path
  end

  def create
    if @talk = Talk.create(params[:talk])
      redirect_to talks_path, :success => "Your talk was successfully created!"
    else
      render 'new', :flash => @talk.errors
    end
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def update
    @talk = Talk.find(params[:id])
    @talk.update_attributes(params[:talk])
  end
end
