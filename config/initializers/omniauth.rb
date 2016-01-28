OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '363487111361-8e5bad0v9q37o8j1sh9uk8phoclk12al.apps.googleusercontent.com', 'aTNFQoXgrjlc_ek4V_cM4aFI', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end