module Ops
  class AnswersController < BaseController
    before_action :set_answer, only: %i[show edit update destroy]
    before_action :set_question, only: %i[new edit create update]

    def index
      @answers = Answer.page(params[:page])
    end

    def show; end

    def new
      @answer = Answer.new
    end

    def edit; end

    def create
      @answer = @question.answers.create(answer_params)

      if @answer.save
        respond_to do |format|
          format.turbo_stream { flash.now[:notice] = t('flashes.created') }
        end
      else
        respond_to do |format|
          format.turbo_stream { flash.now[:error] = @answer.errors.full_messages.join(', ') }
        end
      end
    end

    def update
      if @answer.update(answer_params)
        respond_to do |format|
          format.turbo_stream { flash.now.notice = t('flashes.updated') }
        end
      else
        respond_to do |format|
          format.turbo_stream { flash.now[:error] = @answer.errors.full_messages.join(', ') }
        end
      end
    end

    def destroy
      @answer.destroy
      respond_to do |format|
        format.turbo_stream { flash.now.notice = t('flashes.deleted') }
      end
    end

  private

    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(params[:question_id])
    end

    def answer_params
      params.require(:answer).permit(:content, :status)
    end
  end
end
