class UserTopicsController < ApplicationController
  before_action :set_user_topic, only: [:show, :edit, :update, :destroy]

  # GET /user_topics
  # GET /user_topics.json
  def index
    @user_topics = UserTopic.all
  end

  # GET /user_topics/1
  # GET /user_topics/1.json
  def show
  end

  # GET /user_topics/new
  def new
    @user_topic = UserTopic.new
  end

  # GET /user_topics/1/edit
  def edit
  end

  # POST /user_topics
  # POST /user_topics.json
  def create
    @user_topic = UserTopic.new(user_topic_params)

    respond_to do |format|
      if @user_topic.save
        format.html { redirect_to @user_topic, notice: 'User topic was successfully created.' }
        format.json { render :show, status: :created, location: @user_topic }
      else
        format.html { render :new }
        format.json { render json: @user_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_topics/1
  # PATCH/PUT /user_topics/1.json
  def update
    respond_to do |format|
      if @user_topic.update(user_topic_params)
        format.html { redirect_to @user_topic, notice: 'User topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_topic }
      else
        format.html { render :edit }
        format.json { render json: @user_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_topics/1
  # DELETE /user_topics/1.json
  def destroy
    @user_topic.destroy
    respond_to do |format|
      format.html { redirect_to user_topics_url, notice: 'User topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_topic
      @user_topic = UserTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_topic_params
      params.require(:user_topic).permit(:user_id, :topic_id)
    end
end
