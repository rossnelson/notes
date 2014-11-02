# Reload the browser automatically whenever files change
activate :livereload

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
end

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "ross"
  deploy.host = "simiancreative.com"
  deploy.path = "/var/www/notes"
  deploy.clean = true
  deploy.after_build = true
end

