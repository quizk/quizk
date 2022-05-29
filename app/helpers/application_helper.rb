module ApplicationHelper
  def render_turbo_stream_flash
    turbo_stream.prepend 'flash', partial: 'layouts/ops/flash'
  end
end
