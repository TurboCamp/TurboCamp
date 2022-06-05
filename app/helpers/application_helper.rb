# frozen_string_literal: true

module ApplicationHelper
  def sidebar_link_with_icon(url, method = nil, name)
    link_to url, method:, class: 'sidebar-link', data: { no_turbolink: true } do
      name
    end
  end

  def icons(icon_name, type, size, icon_css, text = nil)
    icon = fa_icon icon_name, type:, size:, class: icon_css
    title = content_tag :p, text, class: 'text-lg font-medium'
    icon + title
  end

  def icon_tag(icon_string, text = nil)
    icon = content_tag :i, '', class: icon_string
    content_tag :p, class: 'text-lg font-medium' do
      icon + text
    end
  end

  def theme_button(url, method = nil, string)
    link_to url, method:, class: 'theme-fill-btn' do
      string
    end
  end
end
