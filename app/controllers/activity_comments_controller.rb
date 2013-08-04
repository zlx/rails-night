class ActivityCommentsController < ApplicationController
  before_action :set_activity_comment, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:create]

  # GET /activity_comments
  # GET /activity_comments.json
  def index
    @activity_comments = ActivityComment.all
  end

  # GET /activity_comments/1
  # GET /activity_comments/1.json
  def show
  end

  # GET /activity_comments/new
  def new
    @activity_comment = ActivityComment.new
  end

  # GET /activity_comments/1/edit
  def edit
  end

  # POST /activity_comments
  # POST /activity_comments.json
  def create
    @activity_comment = ActivityComment.new(activity_comment_params.merge(author_id: current_user.id))
    @activity_comment.save
    redirect_to activity_path(activity_comment_params[:activity_id])
  end

  # PATCH/PUT /activity_comments/1
  # PATCH/PUT /activity_comments/1.json
  def update
    respond_to do |format|
      if @activity_comment.update(activity_comment_params)
        format.html { redirect_to @activity_comment, notice: 'Activity comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @activity_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_comments/1
  # DELETE /activity_comments/1.json
  def destroy
    @activity_comment.destroy
    respond_to do |format|
      format.html { redirect_to activity_comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_comment
      @activity_comment = ActivityComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_comment_params
      params.require(:activity_comment).permit(:author_id, :subject, :activity_id)
    end
end
