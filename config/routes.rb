# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

patch 'projects/:project_id/wiki/:id/toggle-public', to: 'wiki#toggle_public'
