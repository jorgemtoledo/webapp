module ApplicationHelper
    # toast
    def toastr_flash
        flash.each_with_object([]) do |(type, message), flash_messages|
        type = 'success' if type == 'notice'
        type = 'error' if type == 'alert'
        text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
        flash_messages << text.html_safe if message
        end.join("\n").html_safe
    end

    def link_back
        return link_to t('back'), 'javascript:history.back()',  class: 'btn btn-secondary'
    end
end
