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

  def theme_button(url, method = nil, string)
    link_to url,
            method:,
            class: 'bg-theo hover:bg-orange-500 text-white font-bold py-3 px-5 rounded-md' do
      string
    end
  end
end
