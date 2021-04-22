module ApplicationHelper
  def flash_msg(opts = {})
    ignore_types = ['order_completed'].concat(Array(opts[:ignore_types]).map(&:to_s) || [])
    flash_messages, type_modal, modal_title = [], "", ""
    flash.each_with_object([]) do |(type, message)|
      unless ignore_types.include?(type)
        type_modal, modal_title = 'success', 'Success' if type == 'notice'
        type_modal, modal_title = 'danger', 'Error' if type == 'alert'
        text = "<p><div class='alert alert-#{type_modal}' role='alert'>#{message}</div></p>"
        flash_messages << text if message
      end
    end
    if flash_messages.size > 0
        modal = '<button id="modalFlashBtn" style="display: none;" type="button" data-toggle="modal" data-target="#modalFlash">+</button>'
        modal+= '<div class="modal fade" id="modalFlash" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'
        modal+=     '<div class="modal-dialog" role="document">'
        modal+=         '<div class="modal-content">'
        modal+=             '<div class="modal-header">'
        modal+=                 "<h5 class='modal-title'>#{modal_title}</h5>"
        modal+=                 '<button type="button" class="close" data-dismiss="modal" aria-label="Close">'
        modal+=                 '<span aria-hidden="true">&times;</span>'
        modal+=                 '</button>'
        modal+=             '</div>'
        modal+=             '<div class="modal-body">'
        modal+=                 "#{flash_messages.join("</br>")}"
        modal+=             '</div>'
        modal+=             '<div class="modal-footer">'
        modal+=                 '<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="document.getElementById(&apos;modalFlash&apos;).remove(); document.getElementById(&apos;modalFlashBtn&apos;).remove();">Close</button>'
        modal+=             '</div>'
        modal+=         '</div>'
        modal+=     '</div>'
        modal+= '</div>'
        modal+= '<script>document.getElementById("modalFlashBtn").click()</script>'
    end
  end
end
