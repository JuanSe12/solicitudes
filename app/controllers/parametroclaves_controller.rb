class ParametroclavesController < ApplicationController
  before_action :set_parametroclafe, only: [:show, :edit, :update, :destroy]

  # GET /parametroclaves
  # GET /parametroclaves.json
  def index
    @parametroclaves = Parametroclave.all
  end

  # GET /parametroclaves/1
  # GET /parametroclaves/1.json
  def show
  end

  # GET /parametroclaves/new
  def new
    @parametroclafe = Parametroclave.new
  end

  # GET /parametroclaves/1/edit
  def edit
  end

  def traer_parametroclaves
    paramclav = Parametroclave.find(params[:parametroclafe_id]) # manda el id desde coffee y los recibe 
    respond_to do |format|   #se devuelve valor en formato json y lo envía a coffe
      format.json { render json: paramclav }
    end  
  end

  # POST /parametroclaves
  # POST /parametroclaves.json
  def create
    @parametroclafe = Parametroclave.new(parametroclafe_params)

    respond_to do |format|
      if @parametroclafe.save
        format.html { redirect_to @parametroclafe, notice: 'Parametroclave was successfully created.' }
        format.json { render :show, status: :created, location: @parametroclafe }
      else
        format.html { render :new }
        format.json { render json: @parametroclafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parametroclaves/1
  # PATCH/PUT /parametroclaves/1.json
  def update
    respond_to do |format|
      if @parametroclafe.update(parametroclafe_params)
        format.html { redirect_to @parametroclafe, notice: 'Parametroclave was successfully updated.' }
        format.json { render :show, status: :ok, location: @parametroclafe }
      else
        format.html { render :edit }
        format.json { render json: @parametroclafe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parametroclaves/1
  # DELETE /parametroclaves/1.json
  def destroy
    @parametroclafe.destroy
    respond_to do |format|
      format.html { redirect_to parametroclaves_url, notice: 'Parametroclave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parametroclafe
      @parametroclafe = Parametroclave.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parametroclafe_params
      params.require(:parametroclafe).permit(:tipoclave, :maxlongitud, :minlongitud, :maxcaracteres, :mincaracteres, :maxalfanumerico, :minalfanumerico, :maxnumerico, :minnumerico, :maxcapital, :mincapital, :numeroreintentos, :diascambios)
    end
end
