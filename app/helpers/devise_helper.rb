module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div data-controller="notification"
         data-notification-delay-value="3500"
         class="fixed top-24 right-14 z-50 transform duration-1000 hidden"
         data-transition-enter-from="opacity-0 -translate-y-6"
         data-transition-enter-to="opacity-100 translate-y-0"
         data-transition-leave-from="opacity-100 -translate-y-0"
         data-transition-leave-to="opacity-0 translate-y-6"
         role="alert">
      <div class="flash-alert">
        <div class="flex flex-wrap px-4 py-2 font-medium">
          #{messages}
        </div>
        <button data-action="notification#hide">
          <i class="fa-regular fa-circle-xmark pr-3"></i>
        </button>
      </div>
    </div>
    HTML

    html.html_safe
  end
end
