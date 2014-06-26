helpers do

end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

ready do
    sprockets.append_path 'vendor'
end

activate :livereload

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
  activate :relative_assets
  # activate :favicon_maker,
  # :favicon_maker_base_image => "favicon_base.svg"
end

activate :deploy do |deploy|
  deploy.method = :sftp
  deploy.host   = "sftp.dc1.gpaas.net"
  deploy.user   = "78679"
  deploy.path   = "/vhosts/tiredofcancerapp.com/htdocs"
  # Optional Settings
  deploy.port  = 22
  deploy.clean = true
  deploy.build_before = true
end
