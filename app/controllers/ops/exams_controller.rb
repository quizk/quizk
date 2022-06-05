module Ops
  class ExamsController < BaseController
    before_action :set_exam, only: %i[show edit update destroy]

    def index
      @exams = Exam.page(params[:page])
    end

    def show; end

    def new
      @exam = Exam.new
    end

    def edit; end

    def create
      @exam = Exam.new(exam_params)

      if @exam.save
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash[:error] = @exam.errors.full_messages.join(', ') }
        end
      end
    end

    def update
      Exam.update_all(status: Exam::Status::INACTIVE) if exam_params.has_key?(:status) && exam_params[:status] == Exam::Status::ACTIVE.to_s

      if @exam.update(exam_params)
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash[:error] = @exam.errors.full_messages.join(', ') }
        end
      end
    end

    def destroy
      @exam.destroy
      respond_to do |format|
        format.turbo_stream
      end
    end

  private

    def set_exam
      @exam = Exam.includes(:question_sets).find(params[:id])
    end

    def exam_params
      params.require(:exam).permit(:title, :status, :time_limit)
    end
  end
end
