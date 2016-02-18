class ParamclavsController < ApplicationController
  before_action :set_paramclav, only: [:show, :edit, :update, :destroy]

  # GET /paramclavs
  # GET /paramclavs.json
  def index
    @paramclavs = Paramclav.all
  end

  # GET /paramclavs/1
  # GET /paramclavs/1.json
  def show
  end

  # GET /paramclavs/new
  def new
    @paramclav = Paramclav.new
  end

  # GET /paramclavs/1/edit
  def edit
  end

  # POST /paramclavs
  # POST /paramclavs.json
  def create
    @paramclav = Paramclav.new(paramclav_params)

    respond_to do |format|
      if @paramclav.save
        format.html { redirect_to @paramclav, notice: 'Paramclav was successfully created.' }
        format.json { render :show, status: :created, location: @paramclav }
      else
        format.html { render :new }
        format.json { render json: @paramclav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paramclavs/1
  # PATCH/PUT /paramclavs/1.json
  def update
    respond_to do |format|
      if @paramclav.update(paramclav_params)
        format.html { redirect_to @paramclav, notice: 'Paramclav was successfully updated.' }
        format.json { render :show, status: :ok, location: @paramclav }
      else
        format.html { render :edit }
        format.json { render json: @paramclav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paramclavs/1
  # DELETE /paramclavs/1.json
  def destroy
    @paramclav.destroy
    respond_to do |format|
      format.html { redirect_to paramclavs_url, notice: 'Paramclav was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def traer_paramcla
    paramcla = Paramclav.find(params[:id]) # manda el id desde coffee y los recibe 
    respond_to do |format|   #se devuelve valor en formato json y lo envía a coffe
      format.json { render json: paramcla }
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paramclav
      @paramclav = Paramclav.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paramclav_params
      params.require(:paramclav).permit(:tipoclave, :maxlongitud, :minlongitud, :maxcaracteres, :mincaracteres, :maxalfanumerico, :minalfanumerico, :maxnumerico, :minnumerico, :maxcapital, :mincapital, :numeroreintentos, :diascambios)
    end
end
