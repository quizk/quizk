module ApplicationHelper
  TRUNCATE_LENGTH = 50
  COLORS = %w[primary success info warning danger dark]

  def render_turbo_stream_flash
    turbo_stream.append 'flash', partial: 'layouts/ops/flash'
  end

  def truncate_actiontext(text, length = TRUNCATE_LENGTH)
    text.to_plain_text.truncate(length)
  end

  def color_by_id(id)
    COLORS[id % COLORS.length]
  end
end
