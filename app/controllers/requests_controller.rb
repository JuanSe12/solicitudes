class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]
   before_action :validar, except: [:show]
  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.where(:estado => 0 ).paginate(:page => params[:page], :per_page => 8)
    @request = Request.new
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  # :nombre, :telefono, :movil, :producto, :npro, :direccion, :email, :tiposoli, :estado, :idus
  def new
    
  end



  # GET /requests/1/edit
  def edit
  end
  
  def validar
    if session[:usuario_id] == nil
      redirect_to root_path
    end
  end
      

  # POST /requests
  # POST /requests.json
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Solicitud creada.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Solicitud actualizada.' }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end
  

  
  def reclamar
   # redirect_to requests_path(request_id)
   @request = Request.find(params[:request_id])
    @request.idus = current_user.id
    @request.estado = 1
    respond_to do |format|
      if @request.save
        format.html { redirect_to requests_path, notice: 'Solicitud reclamada, por favor revisa tu lista de solicitudes.' }
        format.json { render :show, status: :created, location: @persona }
        format.js
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end



  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'La solicitud se ha eliminado.' }
      format.json { head :no_content }
      format.js
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:nombre, :telefono, :movil, :producto, :npro, :direccion, :email, :tiposoli, :estado, :idus, :observacion, :cuentadestino, :clientedestino, :entidaddestino, :usuario, :usuariodesde)
    end
end
