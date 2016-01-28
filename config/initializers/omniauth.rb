OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '543834416900-vge6ol6h567rq28gfbmv7i5tqob6fqq0.apps.googleusercontent.com', 'O1NsUZ7laT2bUGFhv1cxgQdz', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
