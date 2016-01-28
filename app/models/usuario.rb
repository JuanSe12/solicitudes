class Usuario < ActiveRecord::Base
	def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |usuario|
      usuario.provider = auth.provider 
      usuario.uid      = auth.uid
      usuario.name     = auth.info.name
    #   usuario.image_url = auth_hash['info']['image']
      #usuario.image = auth.info.image
      usuario.email = auth.info.email
      usuario.save
    end
  end
end
