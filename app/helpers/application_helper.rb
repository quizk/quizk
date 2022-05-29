module ApplicationHelper
  TRUNCATE_LENGTH = 50

  def render_turbo_stream_flash
    turbo_stream.prepend 'flash', partial: 'layouts/ops/flash'
  end

  def truncate_actiontext(text, length = TRUNCATE_LENGTH)
    text.to_plain_text.truncate(length)
  end
end
