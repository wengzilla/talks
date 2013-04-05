class TalksController < ApplicationController
  before_filter :require_login, :only => [:new, :create, :edit, :update]

  protect_from_forgery

  def index
    @talks = Talk.all
  end

  def show
    @talk = Talk.find(params[:id])
  end

  def new
    @talk = Talk.initialize_with_nested_models
  end

  def create
    if @talk = current_user.create_talk(params[:talk])
      redirect_to talks_path, :success => "Your talk was successfully created!"
    else
      render 'new', :flash => @talk.errors
    end
  end

  def edit
    @talk = current_user.talks.find(params[:id])
  end

  def update
    @talk = current_user.talks.find(params[:id])
    @talk.update_attributes(params[:talk])
  end
end
