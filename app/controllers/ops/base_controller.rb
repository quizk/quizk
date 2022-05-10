# frozen_string_literal: true

module Ops
  class BaseController < ApplicationController
    layout 'ops/application'
    include Ops::ErrorHandler

    before_action :authenticate_operator!
    before_action :set_operator_id

    rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

    def set_operator_id
      response.headers['X-User-Id'] = current_operator.id
      response.headers['X-Account-Name'] = current_operator.username
    end
  end
end
