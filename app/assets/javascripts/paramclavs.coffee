# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'page:change', ->  #cuando cargue de pagina cargue todo lo que hay en el documento
    
    traer_maxlongitud_minlongitud = (id) -> #nos trae la cantidad y valor del producto ,,con el id se sabe cual
        $.ajax   #llamada a ajax
            url: "/paramclavs/traer_paramcla"   #traer_producto  seria el metod en el controlador
            dataType: 'json'           #tipo de dato es un json   
            type: 'post'               #atravez del metodo post
            data: id: id      #creamos una vble que va hacer igual al id (parametro que se recibe id de productos)
            success: (data) -> #si tiene exito lo que me traiga se guarda en data
                $('#maxlongitud').val(data.maxlongitud)    #lo que esta entre las etiquetas con #cantidad levamos atraer cantidad del producto
                $('#minlongitud').val(data.minlongitud)
                $('#muestra').val(data.id)
                $('#maxcaracteres').val(data.maxcaracteres)
                $('#mincaracteres').val(data.mincaracteres)
                $('#maxalfanumerico').val(data.maxalfanumerico)
                $('#minalfanumerico').val(data.minalfanumerico)
                $('#maxnumerico').val(data.maxnumerico)
                $('#minnumerico').val(data.minnumerico)
                $('#maxcapital').val(data.maxcapital)
                $('#mincapital').val(data.mincapital)
                $('#numeroreintentos').val(data.numeroreintentos)
                $('#diascambios').val(data.diascambios)


    
    $('#paramclav_tipoclave').change ->              #cuando cambie de opcion en el select se ejecuta este evento
        if @value
            traer_maxlongitud_minlongitud(@value) 
            
            
        else
            calcular_total()
            $('.clean').text(0) #si el valor esta nill la clase .clean quedara en 0

    
    
    
    
    
    