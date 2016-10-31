class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  respond_to :json, :html

  # GET /questions
  # GET /questions.json
  def index
    respond_with(@questions = Question.all)
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    respond_with(@question = Question.new)
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    respond_with(@question)
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
      @question.update(question_params)
      respond_with(@question)
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_with(@question)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:body)
    end
end
