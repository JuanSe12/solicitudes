module RequestsHelper
    def estados(esta)
        if esta == 0
            "<span class='btn-xl'>Registrada </span>".html_safe
        elsif esta == 1
            "<span class='btn-xl'>Asignada</span>".html_safe
        elsif esta == 2
            "<span class='btn-xl'>Aceptada</span>".html_safe
        elsif esta == 3
            "<span class='btn-xl'>Rechazada</span>".html_safe
        end
            
    end
    def tipo(t)
        if t == 1
            "<p>Crear cuenta</p>".html_safe
        elsif t == 2
            "<p>Cambiar contraseña</p>".html_safe
        end
    
    end
    

    
   
end
