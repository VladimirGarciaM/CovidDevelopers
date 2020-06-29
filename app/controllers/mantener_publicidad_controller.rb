require File.join(Rails.root, "app", "models", "Mantenerpublicidad.rb")
require File.join(Rails.root, "app", "models", "Pagina.rb")

class MantenerPublicidadController < ApplicationController

  def index

        @publicidades = Mantenerpublicidad.find_by_sql("select * from publicidad order by id DESC")

        if @publicidades.nil?

          Rails.logger.debug("--------------> esta vacio!... ")

        else

          @publicidades.each do |p|

            Rails.logger.debug("--------------> " + p.contenido)

          end

        end


        @paginas = Pagina.find_by_sql("select * from paginas order by id DESC")

        if @paginas.nil?

          Rails.logger.debug("--------------> esta vacio!... ")

        else

          @paginas.each do |p|

            Rails.logger.debug("--------------> " + p.titulo)

          end

        end

        render "index"

  end

  def validar_datos

  end

  def nuevo

  end




  def editar_post
  end

  def eliminarpublicidad_get
    @valor = params[:valor]
    Mantenerpublicidad.connection.execute("delete from publicidad where id like '%"+@valor+"%' ")
    redirect_to action: :index
  end

  def listarpublicidades_get
    @valor = params[:valor]
    Mantenerpublicidad.connection.execute("delete from publicidad where id = '92'")
    render "index"
  end



def listarpaginas_get

  @paginas = Pagina.find_by_sql("select * from paginas order by id DESC")

  if @paginas.nil?

    Rails.logger.debug("--------------> esta vacio!... ")

  else

    @paginas.each do |p|

      Rails.logger.debug("--------------> " + p.titulo)

    end

  end

  render "index"

end



  def nuevo_post

    @titulo = params[:titulo]
    @tarifa = params[:tarifa]
    @fechainicio = params[:fechainicio]
    @fechafin = params[:fechafin]
    @contenido = params[:contenido]



    Rails.logger.debug("--------------> " + @titulo)

    Rails.logger.debug("--------------> " + @tarifa)

    Rails.logger.debug("--------------> " + @fechainicio)

    Rails.logger.debug("--------------> " + @fechafin)

    Rails.logger.debug("--------------> " + @contenido)



    prod =  Mantenerpublicidad.new(:titulo => @titulo,
                                    :tarifa => @tarifa,
                                    :fechainicio => @fechainicio,
                                    :fechafin => @fechafin,
                                    :contenido => @contenido)
    prod.save

    Rails.logger.debug("--------------> " + prod.titulo)

     redirect_to action: :index

  end


  def editar_post

    @id = params[:id_edit]
    @titulo = params[:titulo_edit]
    @tarifa = params[:tarifa_edit]
    @fechainicio = params[:fechainicio_edit]
    @fechafin = params[:fechafin_edit]
    @contenido = params[:contenido_edit]


    Rails.logger.debug("--------------> " + @id)

    Rails.logger.debug("--------------> " + @titulo)

    Rails.logger.debug("--------------> " + @tarifa)

    Rails.logger.debug("--------------> " + @fechainicio)

    Rails.logger.debug("--------------> " + @fechafin)

    Rails.logger.debug("--------------> " + @contenido)


    Mantenerpublicidad.connection.execute("UPDATE publicidad SET titulo='%"+@titulo+"%' ")
    redirect_to action: :index





  end

  def guardar_publicidad

    @opeA = params[:opeA]

    @opeB = params[:opeB]

    @operador = params[:operador]



    Rails.logger.debug("--------------> " + @opeA)

    Rails.logger.debug("--------------> " + @opeB)

    Rails.logger.debug("--------------> " + @operador)



    @resultado = 0



    if @operador == "x"

      @resultado = @opeA.to_i * @opeB.to_i

    elsif @operador == "+"

     @resultado = @opeA.to_i + @opeB.to_i

    elsif @operador == "=xor"

      @resultado = @opeA.to_i - @opeB.to_i

    end



    render 'index'

  end





end
