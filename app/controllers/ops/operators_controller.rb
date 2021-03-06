module Ops
  class OperatorsController < BaseController
    before_action :set_operator, only: %i[show edit update]

    def index
      @operators = Operator.page(params[:page])
    end

    def show; end

    def new
      @operator = Operator.new
    end

    def create
      @operator = Operator.new(create_params)

      if @operator.save
        redirect_to @operator, notice: t('flashes.created')
      else
        flash[:error] = @operator.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @operator.update(update_params)
        redirect_to @operator, notice: t('flashes.updated')
      else
        flash[:error] = @operator.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

  private

    def set_operator
      @operator = Operator.find(params[:id])
    end

    def create_params
      params.require(:operator).permit(:username, :password, :password_confirmation)
    end

    def update_params
      params.require(:operator)
        .permit(
          :username,
          :password,
          :password_confirmation,
        ).reject! { |k, v| v.blank? && %w[password password_confirmation].any?(k) }
    end
  end
end
