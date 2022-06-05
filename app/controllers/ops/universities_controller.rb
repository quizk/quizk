module Ops
  class UniversitiesController < BaseController
    before_action :set_university, only: %i[show edit update destroy restore]

    def index
      @universities = University.page(params[:page])
    end

    def show; end

    def new
      @university = University.new
    end

    def edit; end

    def create
      @university = University.new(university_params)

      if @university.save
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash[:error] = @university.errors.full_messages.join(', ') }
        end
      end
    end

    def update
      if @university.update(university_params)
        respond_to do |format|
          format.turbo_stream
        end
      else
        respond_to do |format|
          format.turbo_stream { flash[:error] = @university.errors.full_messages.join(', ') }
        end
      end
    end

    def destroy
      @university.discard
      respond_to do |format|
        format.turbo_stream
      end
    end

    def restore
      @university.undiscard
      respond_to do |format|
        format.turbo_stream
      end
    end

  private

    def set_university
      @university = University.find(params[:id])
    end

    def university_params
      params.require(:university).permit(:name)
    end
  end
end
