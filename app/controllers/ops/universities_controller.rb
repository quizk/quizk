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
        redirect_to @university, notice: t('flashes.created')
      else
        flash[:error] = @university.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @university.update(university_params)
        redirect_to @university, notice: t('flashes.updated')
      else
        flash[:error] = @university.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @university.discard
      redirect_to universities_path, notice: t('flashes.disabled')
    end

    def restore
      @university.undiscard
      redirect_to universities_path, notice: t('flashes.enabled')
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
