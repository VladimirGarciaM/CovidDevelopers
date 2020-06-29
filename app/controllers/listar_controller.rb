require File.join(Rails.root, "app", "models", "estacionamientos.rb")
require File.join(Rails.root, "app", "models", "Producto.rb")
class ListarController < ApplicationController
  def alquileres
  end
  def alquileres_get
@start_date = params[:start].try(:to_date) || Date.current
@end_date = params[:end].try(:to_date) || Date.current
@txt_nombre_producto = params[:txt_nombre_producto]
if @start_date > @end_date
  @resultado = "  RANGO DE FECHAS INVÁLIDO!"
  else
 ######### 3 ############
  @productos = Producto.find_by_sql("select * from productos where nombre like '%"+@txt_nombre_producto+"%'")
 #@productos = Producto.where(['nombre LIKE ?', "%#{@txt_nombre_producto}%"])
  if @productos.nil?
  Rails.logger.debug("--------------> esta vacio!... ")
  else
  @productos.each do |p|
  	Rails.logger.debug("--------------> " + p.ubicacion.to_s)
  	end
 end

 render "alquileres"
 end
  end
  def cliente
  end

  def estacionamientos
    @estacionamientos = Estacionamientos.all
  end
  def estacionamientos_get
    @nombre = params[:nombre]
          ######### 3 ############
          @estacionamientos = Estacionamientos.find_by_sql("select * from estacionamientos where nombre like '%" + @nombre + "%'")
          #@productos = Producto.where(['nombre LIKE ?', "%#{@txt_nombre_producto}%"])
          if @estacionamientos.nil?
            Rails.logger.debug("--------------> esta vacio!... ")
          else
            @estacionamientos.each do |p|
              Rails.logger.debug("--------------> " + p.nombre)
            end
          end
          render "estacionamientos"
  end
  def jefe
  end

  def publicidad
  end

  def servicios
  end
end
