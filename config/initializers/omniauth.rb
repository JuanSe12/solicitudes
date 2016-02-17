OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '609006043288-tphv2nuc5602tlpsj7d0o3sr0m5fujqb.apps.googleusercontent.com', 'UHYhOhBB77Od1Y27no_S78xr', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
