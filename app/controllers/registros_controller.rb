class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  before_action :validar
  skip_before_filter :verify_authenticity_token  
  # GET /registros
  # GET /registros.json
  def index
    @registros = Registro.all
    @registro = Registro.new
  end

  # GET /registros/1
  # GET /registros/1.json
  def show
  end

  # GET /registros/new
  def new
    @registro = Registro.new
  end

  # GET /registros/1/edit
  def edit
  end

  def validar
    if session[:usuario_id] == nil
      redirect_to root_path
    end
  end

  # POST /registros
  # POST /registros.json
  def create
    @registro = Registro.new(registro_params)

    respond_to do |format|
      if @registro.save
        format.html { redirect_to registros_path, notice: 'Codigo: CRE004 - El usuario ha sido creado' }
        format.json { render :show, status: :created, location: @registro }
        format.js
      else
        format.html { redirect_to registros_path, notice: 'Codigo: ERR006 - Email esta vacio. Por favor comprueba los campos del formulario.'  }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /registros/1
  # PATCH/PUT /registros/1.json
  def update
    respond_to do |format|
      if @registro.update(registro_params)
        format.html { redirect_to registros_path, notice: 'Codigo: UPD005 - Informacion del usuario actualizada.' }
        format.json { render :show, status: :ok, location: @registro }
        format.js
      else
        format.html { redirect_to registros_path, notice: 'Codigo: ERR006 - Email esta vacio. Por favor comprueba los campos del formulario.'  }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /registros/1
  # DELETE /registros/1.json
  def destroy
    @registro.destroy
    respond_to do |format|
      format.html { redirect_to registros_url, notice: 'El usuario ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro
      @registro = Registro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_params
      params.require(:registro).permit(:email)
    end
end
