module Ops
  class QuestionsController < BaseController
    before_action :set_question, only: %i[show edit update destroy]

    def index
      @questions = Question.page(params[:page])
    end

    def show; end

    def new
      @question = Question.new
    end

    def edit; end

    def create
      @question = Question.new(question_params)

      if @question.save
        redirect_to @question, notice: t('flashes.created')
      else
        flash[:error] = @question.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @question.update(question_params)
        redirect_to @question, notice: t('flashes.updated')
      else
        flash[:error] = @question.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @question.destroy
      redirect_to questions_path, notice: t('flashes.deleted')
    end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:category_id, :content)
    end
  end
end
