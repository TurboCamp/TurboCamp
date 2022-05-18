# frozen_string_literal: true

module ApplicationHelper
  def sidebar_link_with_icon(url, method = nil, name)
    link_to url,
            method:,
            class: 'flex items-center text-sm py-4 px-6 h-12
             overflow-hidden text-gray-700 text-ellipsis whitespace-nowrap
             hover:text-gray-900 hover:bg-gray-100  transition
             duration-300 ease-in-out' do
      name
    end
  end

  def icons(icon_name, type, size, icon_css, text = nil)
    icon = fa_icon icon_name, type:, size:, class: icon_css
    title = content_tag :p, text, class: 'text-lg font-medium'
    icon + title
  end

  def link_with_icon(url, method, name)
    link_to url,
            method: method do
      name
    end
  end

  def project_name(string = nil)
    if @project.present?
      @project.title
    else
      string
    end
  end
end
