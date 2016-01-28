class SessionsController < ApplicationController
  def create
    usuario = Usuario.from_omniauth(env["omniauth.auth"])
    var = Registro.exists?(:email => usuario.email)
   	if var == false
   		session[:usuario_id] = nil
   		flash[:notice] = "ERROR - Cuenta no existente."
    	redirect_to root_path
   	else
    session[:usuario_id] = usuario.id
    redirect_to root_path
    end
    
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_path
  end
end
