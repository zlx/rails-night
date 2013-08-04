class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy, :join]
  before_action :require_login, only: [:join]

  def index
    @activities = Activity.uncompleted.order(status: :desc).decorate
  end

  def past
    @activities = Activity.completed.decorate
  end

  def show
    @activity = Activity.find(params[:id]).decorate
  end

  def new
    @activity = Activity.new
  end

  def edit
  end

  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  def join
    @activity.users << current_user
    ActivityMailer.delay.welcome_email(@activity.decorate, current_user)
    #ActivityMailer.upcoming_email(@activity.decorate).deliver
    redirect_to @activity, notice: "欢迎参加活动"
  end

  private
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:title, :description, :author_id, 
                                       :start_at, :status, :summary)
    end
end
