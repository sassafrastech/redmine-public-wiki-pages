require_dependency 'wiki_menu_listener'
require 'wiki_controller_patch'
require 'wiki_menu_listener'

ActionDispatch::Callbacks.to_prepare do
  unless WikiController.included_modules.include? WikiControllerPatch
    WikiController.send(:include, WikiControllerPatch)
  end
end

Redmine::Plugin.register :public_wiki_pages do
  name 'Public Wiki Pages plugin'
  author 'Tom Smyth'
  description 'Allows marking individual wiki pages to be publicly accessible via URL'
  version '0.0.1'
  url 'https://github.com/sassafrastech/public-wiki-pages'
  author_url 'http://sassafras.coop'
end
