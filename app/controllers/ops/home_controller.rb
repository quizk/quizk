# frozen_string_literal: true

class Ops::HomeController < Ops::BaseController
  NOTIFICATION = '2021.10.10 22:00 - 24:00 の時間帯について、サービスがご利用頂けなくなります。'

  def index
    @notification = NOTIFICATION
  end
end
