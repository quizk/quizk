module Ops
  class UsersController < BaseController
    before_action :set_user, only: :show

    def index
      @q = User.ransack(search_params)
      @users = @q.result(distinct: true).page(params[:page]).per(params[:limit])
    end

    def show; end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def search_params
      return unless params[:q]

      params.require(:q).permit(:university_id_eq, :email_cont, :username_cont, :code_cont)
    end
  end
end
