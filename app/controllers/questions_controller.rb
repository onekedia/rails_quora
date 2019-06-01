class QuestionsController < ApplicationController
  # before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def search_topic
    @question = Question.find(params[:id])
    @results = Topic.search_by_name(params[:q]).where.not(id: @question.topics.pluck(:id))
    respond_to do |format|
      format.js {}
    end
  end

  def add_topic
    @question = Question.find(params[:id])
    topic = Topic.find(params[:topic_id])
    question_topic = QuestionTopic.new(question_id: @question.id, topic_id: topic.id)
    if question_topic.save
      flash[:success] = "Topic added successfully"
    else
      flash[:danger] = "Failed to add topic"
    end
    redirect_to @question
  end

  def remove_topic
    @question = Question.find(params[:id])
    topic = Topic.find(params[:topic_id])
    question_topic = QuestionTopic.where(question_id: @question.id, topic_id: topic.id)
    unless question_topic.empty?
      question_topic.delete_all
      flash[:success] = "Topic removed successfully"
    else
      flash[:danger] = "Failed to remove topic"
    end
    redirect_to @question
  end

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.includes(:user, :topics, answers: [:user]).all
    @questions = @questions.topic(params[:topic_id]) if params[:topic_id]
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user = helpers.current_user
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    respond_to do |format|
      if @question.user == helpers.current_user && @question.destroy!
        format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to questions_url, notice: 'Question was not destroyed.' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:user_id, :title, :description, :topics)
  end
end