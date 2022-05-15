# frozen_string_literal: true

module Ops::ErrorHandler
  extend ActiveSupport::Concern

  def not_found
    render file: Rails.root.join('public', '404.html'), layout: false, status: 404
  end
end
