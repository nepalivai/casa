module SidebarHelper
  def menu_item(label:, path:, visible: true)
    link_to label, path, class: "list-group-item #{active_class(path)}" if visible
  end

  def active_class(link_path)
    controller_name = link_path.split("/").second
    current_page?({controller: controller_name, action: action_name}) ? "active" : ""
  rescue ActionController::UrlGenerationError
    ""
  end

  def cases_index_title
    return "My Cases" if current_user.volunteer?

    "Cases"
  end

  def inbox_label
    unread_count = current_user.notifications.unread.count
    return "Inbox" if unread_count == 0
    "Inbox <span class='badge badge-danger'>#{unread_count}</span>".html_safe
  end
end
