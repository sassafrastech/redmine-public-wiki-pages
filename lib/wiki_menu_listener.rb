class WikiMenuListener < Redmine::Hook::ViewListener
  def view_wiki_context_menu(context = {})
    page = context[:page]
    view = context[:hook_caller]
    link_text = view.l(page.public? ? :make_private : :make_public, scope: "public_wiki_pages")
    link_icon = page.public? ? "lock" : "unlock"

    view.link_to_if_authorized(link_text, {action: 'edit', id: page.title},
      class: "icon icon-#{link_icon} public-link")
  end
end
