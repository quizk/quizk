module Ops
  class CategoriesController < BaseController
    before_action :set_category, only: %i[show edit update destroy]

    def index
      @categories = Category.page(params[:page])
    end

    def show; end

    def new
      @category = Category.new
    end

    def edit; end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to @category, notice: t('flashes.created')
      else
        flash[:error] = @category.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @category.update(category_params)
        redirect_to @category, notice: t('flashes.updated')
      else
        flash[:error] = @category.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @category.discard
      redirect_to categories_path, notice: t('flashes.disabled')
    end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
