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
    color_int = label.color.to_i(16)
    r = (color_int >> 16) % 256
    g = (color_int >> 8) % 256
    b = (color_int >> 0) % 256
    lumniancy = (0.299*r + 0.587*g + 0.114*b)
    darkness_class = lumniancy > 160 ? 'dark-text' : 'light-text'
    content_tag(:span, label.name, class: [:label, :'colored-label', darkness_class], style: "background: ##{label.color};")
  end


end