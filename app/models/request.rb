class Request < ActiveRecord::Base
	#validacion numero
	validates :telefono , numericality: {message: "Telefono, no es un numero.  Por favor comprueba los campos del formulario."}
	validates :movil , numericality: {message: "Movil, no es un numero.  Por favor comprueba los campos del formulario."}
	#validacion formato mail
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
message: 'Email, formato no valido. Por favor comprueba los campos del formulario.' }
	#validacion campo vacio
	validates :nombre, presence: {message: "Nombre, esta vacio. Por favor comprueba los campos del formulario."}
	validates :telefono, presence: {message: "Telefono, esta vacio. Por favor comprueba los campos del formulario."}
	validates :movil, presence: {message: "Movil, esta vacio. Por favor comprueba los campos del formulario."}
	validates :email, presence: {message: "Email, esta vacio. Por favor comprueba los campos del formulario."}
	validates :usuario, presence: {message: "Usuario, esta vacio. Por favor comprueba los campos del formulario."}

end
