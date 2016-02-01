module Api
    module V1
        class RequestsController < ApplicationController
            class Request < ::Request
              def mensaje
                "Codigo: EXI002 - Procesado con éxito"
              end
            end
       skip_before_action :verify_authenticity_token
      respond_to :json 

      def index
        respond_with Request.all
      end
      

      def show
         request = Request.find(params[:id])
         #if request.errors.messages == true
         # respond_with request.to_json(:methods => :mensajeerror)
        #else
          respond_with request.to_json(:methods => :mensaje)
        #end
        
      end

      def actualiza
        request = Request.find(params[:id])
        request.observacion = params[:observacion]
        request.estado =  params[:estado]
        request.save
        flash[:notice] = "Codigo: EXI002 - Procesado con éxito"
        redirect_to request_path(request)
      end

      def create
        @request = Request.new
        if params[:nombre] != nil || params[:telefono] != nil || params[:movil] != nil || params[:producto] != nil || params[:npro] != nil || params[:direccion] != nil || params[:email] != nil || params[:tiposoli] != nil
          @request.nombre = params[:nombre]
          @request.telefono = params[:telefono]
          @request.movil = params[:movil]
          @request.producto = params[:producto]
          @request.npro = params[:npro].to_i
          @request.direccion = params[:direccion]
          @request.email = params[:email]
          @request.estado = params[:estado].to_i
          @request.idus = params[:idus].to_i
          @request.tiposoli = params[:tiposoli].to_i
          @request.save
          if @request.valid? == false
            arr = Hash.new
           a = @request.errors.values[0]
            b = a.to_s
            c = b.tr('[]','')
            d = c[1..-2]
            men = ""
            if d.include?('no es un numero') == true
            codigo = "ERR001"
            men = "#{codigo} - #{d}"
            flash[:notice] = "#{men}"
            elsif d.include?('formato no valido') == true
            codigo = "ERR002"
            men = "#{codigo} - #{d}"
            flash[:notice] = "#{men}"
            elsif d.include?('esta vacio') == true
            codigo = "ERR003"
            men = "#{codigo} - #{d}"
            flash[:notice] = "#{}"
            end
           # arr={"codigo" => codigo,"mensaje" => d, "detalle" => "Error al guardar los datos"}
           # z = arr.keys
           # respond_with arr.to_json
            
            redirect_to requests_path
          else
            flash[:notice] = "Codigo: EXI002 - Procesado con éxito"
            redirect_to request_path(@request)
          end 
        end
        #respond_with Request.create(params[:request])
      end

      def update
        request = Request.find(params[:id])
        if params[:request] != nil
          request.update(params[:request])
          if request.valid? == false
            arr = Hash.new
           a = request.errors.values[0]
            b = a.to_s
            c = b.tr('[]','')
            d = c[1..-2]
            if d.include?('no es un numero') == true
            codigo = "1001"
            elsif d.include?('formato no valido') == true
            codigo = "1002"
            elsif d.include?('esta vacio') == true
            codigo = "1003"
            end
            arr={"codigo" => codigo,"mensaje" => d, "detalle" => "Error al guardar los datos"}
            respond_with arr.to_json
           
          else
            redirect_to api_v1_request_path(request)
          end 
        end
        #espond_with Request.update(params[:id], params[:request])
      end

      def destroy
        respond_with Request.destroy(params[:id])
      end
      
      def crear
        respond_with Request.where("tiposoli = 1").order("created_at ASC")
      end
      
      def contra
        respond_with Request.where("tiposoli = 2").order("created_at ASC")
      end
      
      def registrado
        respond_with Request.where("estado = 0").order("created_at ASC")
      end     
      
      def mirequest
        us = current_user.id
        respond_with Request.where("idus = #{us}").order("created_at ASC")
      end
        end
    end
end
