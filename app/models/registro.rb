class Registro < ActiveRecord::Base
	validates :email, presence: {message: "Email, esta vacio. Por favor comprueba los campos del formulario."}
end
