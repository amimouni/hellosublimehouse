###
# Compass
###


# Change Compass configuration


# Auto-prefixing of CSS code with vendor prefix
activate :autoprefixer

# Clean adresses
activate :directory_indexes

activate :protect_emails

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end



#NEED TO ACTIVATE THIS FOR GOOGLE ANALYTICS
# activate :google_analytics do |ga|
#     ga.tracking_id = data.settings.google_analytics.tracking_code
#     ga.anonymize_ip = true
#     ga.debug = false
#     ga.development = false
#     ga.minify = true
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  activate :minify_html

  # activate :minify_html, remove_input_attributes: false

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  ignore '/**/less/*.css'

  activate :relative_assets
  set :relative_links, true

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  activate :favicon_maker do |f|
      f.template_dir  = File.join(root, 'source')
      f.output_dir    = File.join(root, 'build')
      f.icons = {
        "_favicon_template.png" => [
          { icon: "apple-touch-icon-152x152-precomposed.png" },
          { icon: "apple-touch-icon-144x144-precomposed.png" },
          { icon: "apple-touch-icon-120x120-precomposed.png" },
          { icon: "apple-touch-icon-114x114-precomposed.png" },
          { icon: "apple-touch-icon-76x76-precomposed.png" },
          { icon: "apple-touch-icon-72x72-precomposed.png" },
          { icon: "apple-touch-icon-60x60-precomposed.png" },
          { icon: "apple-touch-icon-57x57-precomposed.png" },
          { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
          { icon: "apple-touch-icon.png", size: "57x57" },
          { icon: "favicon-196x196.png" },
          { icon: "favicon-160x160.png" },
          { icon: "favicon-96x96.png" },
          { icon: "favicon-32x32.png" },
          { icon: "favicon-16x16.png" },
          { icon: "favicon.png", size: "16x16" },
          { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
          { icon: "mstile-144x144", format: "png" },
        ]
      }
  end

  # Site map
  # activate :sitemap, hostname: data.settings.site.url

end

# Gzip compression
 activate :gzip

#sitemap ping
 activate :sitemap_ping do |config|
   config.host         = 'http://www.hellosublimehouse.com' # (required)                       Host of your website
   config.sitemap_file = 'custom-sitemap-file.xml'  # (optional, default: sitemap.xml) Name of your sitemap file
   config.ping_google  = false                      # (optional, default: true)        Ping Google?
   config.ping_bing    = false                      # (optional, default: true)        Ping Bing?
   config.after_build  = false                      # (optional, default: true)        Run automatically after build?
 end


# Deployment

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true

  # Optional Settings
  # deploy.remote = 'custom-remote' # remote name or git url, default: origin
  # deploy.branch = 'custom-branch' # default: gh-pages
  # deploy.strategy = :submodule # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message' # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end
