# frozen_string_literal: true

module ApplicationHelper
  def link_to_with_icon(url, method, num, string)
    link_to url,
            method: method,
            class: 'flex items-center text-sm py-4 px-6 h-12
             overflow-hidden text-gray-700 text-ellipsis whitespace-nowrap
             hover:text-gray-900 hover:bg-gray-100  transition
             duration-300 ease-in-out' do
      num
      string
    end
  end

  def icons(icon_name, type, size)
    fa_icon icon_name, type:, size:, class: 'pr-3'
  end
end
