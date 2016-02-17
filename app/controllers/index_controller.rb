class IndexController < ApplicationController

  #before_action :authenticate_user!
  def index
    @usuarios = Usuario.all
  end
  def tablerocomando
    @requests = Request.all
  end
  def organigrama
  end
  def misrequests
    if session[:usuario_id] == nil
      redirect_to root_path
    else
    @requests = Request.where(:estado => 1, :idus => current_user.id ).paginate(:page => params[:page], :per_page => 7)
    end
  end
  def aceptados
     if session[:usuario_id] == nil
      redirect_to root_path
    else
    @requests = Request.where(:estado => 2, :idus => current_user.id).paginate(:page => params[:page], :per_page => 7)
    end
  end
  def rechazados
     if session[:usuario_id] == nil
      redirect_to root_path
    else
    @requests = Request.where(:estado => 3, :idus => current_user.id).paginate(:page => params[:page], :per_page => 7)
    end
  end
  def parametros
    
  end
end
