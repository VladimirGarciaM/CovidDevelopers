require File.join(Rails.root, "app", "models", "estacionamientos.rb")
class RegistroController < ApplicationController
  def alquileres
  end

  def cliente
  end
  def jefe_post
  @nombre = params[:nombre]
  @apellidoPaterno = params[:apellidoPaterno]

  #Condicional para el genero
  genero = params[:sexo]
     bdgenero = "Femenino"  # valor por defecto, si no se cumple la condicional quedará con esto
  if genero == 'm'
     bdgenero = 'Masculino' # si el valor de lo elegido es 'm', se cambiará el genero a masculino
  end


  tdoc = params[:tipoDeDocumento]
     bdtdoc = "RUC" # valor por defecto, si no se cumple la condicional quedará con esto
  if tdoc == '1'
     bdtdoc = 'DNI' # si el valor de lo elegido es '1', se cambiará DNI
  end


  tusuario = params[:tipoUsuario]
     bdtusu = "Cliente" # valor por defecto, si no se cumple la condicional quedará con esto
  if tdoc == '1'
     bdtusu = 'Dueño'   # si el valor de lo elegido es '1', se cambiará a Dueño
  end


  @dueno = Dueno.create(:nombre => params[:nombre],
                        :apellidoPaterno => params[:apellidoPaterno],
                        :apellidoMaterno => params[:apellidoMaterno],
                        :sexo => bdgenero,
                        :tipoDeDocumento => bdtdoc,
                        :tusuario => bdtusu,
                        :numDocumento => params[:numDocumento],
                        :correo => params[:correo],
                        :confirmarCorreo => params[:confirmarCorreo],
                        :contrasena => params[:contraseña],
                        :confContrasena => params[:confirmarContraseña],
                        :fecNacimiento => params[:birthday],
                        :NuCelular => params[:celular],
                        :foto => params[:foto]
                        ) #aquí ingresas todos los campos de tu tabla sacados de tu formulario




    @dueno.save

    render "jefe"
  end

  def estacionamientos
  end
  def estacionamientos_post
  @nombre = params[:nombre]
  @direccion = params[:direccion]
  @distrito = params[:distrito]
  @telefono = params[:telefono]
  @costo = params[:costo]
  @dimensiones = params[:dimensiones]
  @tipo = params[:tipo]
  @ubicacion = params[:ubicacion]

  Rails.logger.debug("--------------> " + @nombre)
  Rails.logger.debug("--------------> " + @direccion)
  Rails.logger.debug("--------------> " + @distrito)
  Rails.logger.debug("--------------> " + @telefono)
  Rails.logger.debug("--------------> " + @costo)
  Rails.logger.debug("--------------> " + @dimensiones)
  Rails.logger.debug("--------------> " + @tipo)
  Rails.logger.debug("--------------> " + @ubicacion)

  park = Estacionamientos.new(:nombre => @nombre, :direccion => @direccion, :distrito => @distrito, :telefono => @telefono, :costo => @costo, :dimensiones => @dimensiones, :tipo => @tipo, :ubicacion => @ubicacion )
  park.save

      Rails.logger.debug("--------------> " + park.nombre)
  render "listar/estacionamientos"
  end

  def jefe
  end

  def publicidad
  end

  def servicios
  end
end
