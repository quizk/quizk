module AnswerDecorator
  def status_with_icon
    if right?
      content_tag(:span, class: 'text-success fst-italic fw-light') do
        content_tag(:i, nil, class: 'fa-solid fa-check me-2') + status_i18n
      end
    else
      content_tag(:span, class: 'text-danger fst-italic fw-light') do
        content_tag(:i, nil, class: 'fa-solid fa-xmark me-2') + status_i18n
      end
    end
  end
end
