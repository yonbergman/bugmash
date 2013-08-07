module LabelHelper
  def repo_label(issue)
    color = issue.repo == 'rails' ? 'label-info' : 'label-success'
    content_tag(:span, issue.repo, class: [:label, color])
  end

  def label_tag(label)
    content_tag(:span, label.name, class: [:label, :'colored-label'], style: "background: ##{label.color};")
  end
end