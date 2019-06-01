class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy, :follow, :unfollow]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to topics_url, notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def follow
    # @topic = Topic.find(params[:topic_id])
    user = helpers.current_user
    follow = TopicUser.new(topic_id: @topic.id, user_id: user.id)
    if follow.save
      flash[:success] = "Topic followed successfully"
    else
      flash[:danger] = "Failed to follow topic"
    end
    redirect_to @topic
  end

  def unfollow
    # @topic = Topic.find(params[:topic_id])
    user = helpers.current_user
    follows = TopicUser.where(topic_id: @topic.id, user_id: user.id)
    unless follows.empty?
      follows.delete_all
      flash[:success] = "Topic unfollowed successfully"
    else
      flash[:danger] = "Failed to unfollow topic"
    end
    redirect_to @topic
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:name)
    end
end
