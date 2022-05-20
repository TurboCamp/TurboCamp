# frozen_string_literal: true

module ApplicationHelper
  def sidebar_link_with_icon(url, method = nil, name)
    link_to url, method:, class: 'sidebar-link' do
      name
    end
  end

  def icons(icon_name, type, size, icon_css, text = nil)
    icon = fa_icon icon_name, type:, size:, class: icon_css
    title = content_tag :p, text, class: 'text-lg font-medium'
    icon + title
  end

  def link_with_icon(url, method, name)
    link_to url, method: method do
      name
    end
  end

  def theme_button(url, method = nil, string)
    link_to url, method:, class: 'theme-fill-btn' do
      string
    end
  end
end
