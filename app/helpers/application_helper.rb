module ApplicationHelper
	def alerta(n)
		if n.include?('elimin') == true
	    	"<div class='alert alert-dismissible alert-success ocultar'>
				  <button type='button' class='close' data-dismiss='alert'><i class='fa fa-times'></i></button>
				  Codigo: ELI001 - #{n}
			</div>".html_safe
		elsif n.include?('reclama') == true
			"<div class='alert alert-dismissible alert-success ocultar'>
				  <button type='button' class='close' data-dismiss='alert'><i class='fa fa-times'></i></button>
				  Codigo: REC002 - #{n}
			</div>".html_safe
		elsif n.include?('acept') == true
			"<div class='alert alert-dismissible alert-success ocultar'>
				  <button type='button' class='close' data-dismiss='alert'><i class='fa fa-times'></i></button>
				  Codigo: ACE003 - #{n}
			</div>".html_safe
		elsif n.include?('recha') == true
			"<div class='alert alert-dismissible alert-success ocultar'>
				  <button type='button' class='close' data-dismiss='alert'><i class='fa fa-times'></i></button>
				  Codigo: REH004 - #{n}
			</div>".html_safe
		elsif n.include?('rror') == true
			"<div class='alert alert-dismissible alert-danger ocultar'>
				  <button type='button' class='close' data-dismiss='alert'><i class='fa fa-times'></i></button>
				  #{n}
			</div>".html_safe
		elsif n.include?('ERR') == true
			"<div class='alert alert-dismissible alert-danger ocultar'>
				  <button type='button' class='close' data-dismiss='alert'><i class='fa fa-times'></i></button>
				  #{n}
			</div>".html_safe
		elsif n.include?('ERR') == false
			"<div class='alert alert-dismissible alert-success ocultar'>
				  <button type='button' class='close' data-dismiss='alert'><i class='fa fa-times'></i></button>
				  #{n}
			</div>".html_safe
			
			
	    end
	end
end
