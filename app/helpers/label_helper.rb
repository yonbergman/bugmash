module LabelHelper
  def repo_label(issue)
    color = issue.repo == 'rails' ? 'label-info' : 'label-success'
    content_tag(:span, issue.repo, class: [:label, color])
  end

  def linked_label_tag(label)
      link_to labels_issues_path(label: label.id) do
        label_tag(label)
      end
    end

  def label_tag(label)
    content_tag(:span, label.name, class: [:label, :'colored-label'], style: "background: ##{label.color};")
  end


end