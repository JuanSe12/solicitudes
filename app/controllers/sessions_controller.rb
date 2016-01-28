class SessionsController < ApplicationController
  def create
    usuario = Usuario.from_omniauth(env["omniauth.auth"])
    session[:usuario_id] = usuario.id
    redirect_to root_path
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_path
  end
end
