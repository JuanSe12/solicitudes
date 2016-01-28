class IndexController < ApplicationController
  #before_action :authenticate_user!
  def index
   
  end
  def tablerocomando
    
  end
  def organigrama
    
  end
  def misrequests
    @requests = Request.where(:estado => 1).paginate(:page => params[:page], :per_page => 7)
  end
  def aceptados
    @requests = Request.where(:estado => 2).paginate(:page => params[:page], :per_page => 7)
  end
  def rechazados
    @requests = Request.where(:estado => 3).paginate(:page => params[:page], :per_page => 7)
  end
end
