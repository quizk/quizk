module Ops
  class QuestionSetsController < BaseController
    before_action :set_question_set, only: %i[show edit update destroy]
    before_action :set_exam, only: %i[new edit create update]

    def index
      @question_set = QuestionSet.page(params[:page])
    end

    def show; end

    def new
      @question_set = QuestionSet.new
    end

    def edit; end

    def create
      @question_set = @exam.question_sets.create(question_set_params)

      if @question_set.save
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash.now[:error] = @question_set.errors.full_messages.join(', ') }
        end
      end
    end

    def update
      if @question_set.update(question_set_params)
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash.now[:error] = @question_set.errors.full_messages.join(', ') }
        end
      end
    end

    def destroy
      @question_set.destroy
      respond_to do |format|
        format.turbo_stream
      end
    end

  private

    def set_question_set
      @question_set = QuestionSet.find(params[:id])
    end

    def set_exam
      @exam = Exam.find(params[:exam_id])
    end

    def question_set_params
      params.require(:question_set).permit(:topic_id, :amount)
    end
  end
end
