class IndexController < ApplicationController
  #before_action :authenticate_user!
  def index
if current_user == nil
    redirect_to new_user_session_url
end    
  end
  def tablerocomando
    
  end
  def organigrama
    
  end
  def misrequests
    @requests = Request.where(:estado => 1, :idus => current_user.id ).paginate(:page => params[:page], :per_page => 7)
  end
  def aceptados
    @requests = Request.where(:estado => 2, :idus => current_user.id ).paginate(:page => params[:page], :per_page => 7)
  end
  def rechazados
    @requests = Request.where(:estado => 3, :idus => current_user.id ).paginate(:page => params[:page], :per_page => 7)
  end
end
