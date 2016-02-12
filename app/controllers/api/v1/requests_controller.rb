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
        if params[:usuario] != nil || params[:nombre] != nil || params[:telefono] != nil || params[:movil] != nil  || params[:email] != nil
          tiposo = params[:tiposoli]
          if tiposo == "1"
            @request.cuentadestino = nil
            @request.clientedestino = nil
            @request.entidaddestino = nil
            @request.usuario = params[:usuario]
            @request.nombre = params[:nombre]
            @request.telefono = params[:telefono]
            @request.movil = params[:movil]
            @request.producto = params[:producto]
            @request.email = params[:email]
            @request.npro = params[:npro].to_i
            @request.direccion = params[:direccion]
            @request.estado = params[:estado].to_i
            @request.idus = params[:idus].to_i
            @request.tiposoli = tiposo.to_i
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
            redirect_to :back
        else
            flash[:notice] = "Codigo: EXI002 - Procesado con éxito"
            redirect_to request_path(@request)
        end
          elsif tiposo == "2"
            @request.producto = nil
            @request.npro = nil
            @request.direccion = nil
            @request.cuentadestino = params[:cuentadestino]
            @request.clientedestino = params[:clientedestino]
            @request.entidaddestino = params[:entidaddestino]
            @request.usuario = params[:usuario]
            @request.nombre = params[:nombre]
            @request.telefono = params[:telefono]
            @request.email = params[:email]
            @request.movil = params[:movil]
            @request.estado = params[:estado].to_i
            @request.idus = params[:idus].to_i
            @request.tiposoli = tiposo.to_i
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
              redirect_to requests_path
            else
              flash[:notice] = "Codigo: EXI002 - Procesado con éxito"
              redirect_to request_path(@request)
            end
          elsif tiposo == "3"
            @request.producto = nil
            @request.npro = nil
            @request.direccion = nil
            @request.cuentadestino = nil
            @request.clientedestino = nil
            @request.entidaddestino = nil
            @request.usuariodesde = params[:usuariodesde]
            @request.producto = params[:prod]
            @request.npro = params[:np]
            @request.direccion = params[:dir]
            @request.usuario = params[:usuario]
            @request.nombre = params[:nombre]
            @request.telefono = params[:telefono]
            @request.email = params[:email]
            @request.movil = params[:movil]
            @request.estado = params[:estado].to_i
            @request.idus = params[:idus].to_i
            @request.tiposoli = tiposo.to_i
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
              redirect_to requests_path
            else
              flash[:notice] = "Codigo: EXI002 - Procesado con éxito"
              redirect_to request_path(@request)
            end
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
