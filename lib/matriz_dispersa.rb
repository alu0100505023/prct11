require 'Fraccion.rb'
require 'matriz.rb'
require "matrix"

class SparseVector
    attr_reader :vector

    def initialize(h = {})
        @vector = Hash.new(0)
        @vector = @vector.merge!(h)
    end

    def [](i)
        @vector[i]
    end

    def to_s
        @vector.to_s
    end
end

class SparseMatrix < Matriz

    attr_reader :matrix

    def initialize(h = {})
        @matrix = Hash.new({})
        for k in h.keys do
            @matrix[k] = if h[k].is_a? SparseVector 
                                h[k]
                        else
                              @matrix[k] = SparseVector.new(h[k])
                            end
        end
    end

    def [](i)
        @matrix[i]
    end

    def col(j)
        c = {}
        for r in @matrix.keys do
            c[r] = @matrix[r].vector[j] if @matrix[r].vector.keys.include? j
        end
        SparseVector.new c
    end

        def comprobar
                contar = 0
                contartotal = 0
                result = 0
           for r in @matrix.keys do
                         for j in @matrix[r].vector.keys do
                                contartotal = contartotal + 1
                                if @matrix[r].vector[j] == 0 
                                        contar = contar + 1
                                end
                        end
      end
                result = (contar * 100) / contartotal
                if result < 60 
                         "La matriz no es dispersa"
                end
        end

        def mostrar
        for r in @matrix.keys do
                                  for j in @matrix[r].vector.keys do
                                        print "#{@matrix[r].vector[j]}  "  
                                end
                                puts
        end
        end
        
        def +(other)
			  case other
			  when Matriz_Dispersa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.matrix.size && @matrix[1].vector.size == other.matrix[1].vector.size
					resul = Array.new
		     		for r in @matrix.keys do
						resul_f = Array.new
					  	for j in @matrix[r].vector.keys do        
					  		#print "  #{@matrix[r].vector[j] + other.matrix[r].vector[j]}  "
							resul_f << @matrix[r].vector[j] + other.matrix[r].vector[j]
					  	end
					  		#puts
						resul << resul_f
					end
					return resul
			  when Matriz_densa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.f && @matrix[1].vector.size == other.c
					resul = Array.new
					for r in 1..other.f do
						resul_f = Array.new
               	for j in 1..other.c do
               		#print "  #{@matrix[r].vector[j] + other.m[r - 1][j - 1]}"
							resul_f << @matrix[r].vector[j] + other.m[r - 1][j - 1]
               	end
               	#puts
						resul << resul_f
        			end
					return resul
			  else
					raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end
        end
        def -(other)
			  case other
			  when Matriz_Dispersa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.matrix.size && @matrix[1].vector.size == other.matrix[1].vector.size
					resul = Array.new
		     		for r in @matrix.keys do
						resul_f = Array.new
					  	for j in @matrix[r].vector.keys do        
					  		#print "  #{@matrix[r].vector[j] - other.matrix[r].vector[j]}  "
							resul_f << @matrix[r].vector[j] - other.matrix[r].vector[j]
					  	end
					  		#puts
						resul << resul_f
					end
					return resul
			  when Matriz_densa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @matrix.size == other.f && @matrix[1].vector.size == other.c
					resul = Array.new
					for r in 1..other.f do
						resul_f = Array.new
               	for j in 1..other.c do
               		#print "  #{@matrix[r].vector[j] - other.m[r - 1][j - 1]}"
							resul_f << @matrix[r].vector[j] - other.m[r - 1][j - 1]
               	end
               	#puts
						resul << resul_f
        			end
					return resul
			  else
					raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end

        end

        def *(other) 
        
				case other
				when Matriz_Dispersa
					 raise ArgumentError, "Las columnas de una matriz no coinciden con las filas de la otra." unless @matrix[1].vector.size == other.matrix.size
                sumatotal = 0
                mul = Array.new                

                for i in @matrix.keys do
                        mul_f = Array.new
                     for j in @matrix[i].vector.keys do
                                for k in @matrix[i].vector.keys do
                                    suma = @matrix[i].vector[k] * other.matrix[k].vector[j]
                                    sumatotal = sumatotal + suma;
                                end
                                mul_f << sumatotal
                                sumatotal = 0
                    end
							mul << mul_f
                end
=begin        
                for r in @matrix.keys do
                   for j in @matrix[r].vector.keys do
                      print "  #{mul[r][j]}  "
                   end
                   puts
        			end
=end
					return mul
			  when Matriz_densa
					raise ArgumentError, "Las columnas de una matriz no coinciden con las filas de la otra." unless @matrix[1].vector.size == other.f
					sumatotal = 0
                mul = Array.new                

                for i in @matrix.keys do
                        mul_f = Array.new
                     for j in @matrix[i].vector.keys do
                           for k in @matrix[i].vector.keys do
                              suma = @matrix[i].vector[k] * other.m[k - 1][j - 1]
                              sumatotal = sumatotal + suma;
                           end
                           mul_f << sumatotal
                           sumatotal = 0
                    end
							mul << mul_f
                end 
=begin       
                for r in @matrix.keys do
                   for j in @matrix[r].vector.keys do
                      print "  #{mul[r][j]}  "
                   end
                   puts
        			end
=end
					return mul
			  else
				  raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end
        end

        def max
                   
                maximo = @matrix[1].vector[1]
           
                for i in @matrix.keys do
                        for j in @matrix[i].vector.keys do
                           if @matrix[i].vector[j] > maximo
                              maximo = @matrix[i].vector[j]
                      end
                   end
                end
					 return maximo
        end

		  def [](i,j)
			
				return @matrix[i].vector[j]
			
		  end

        def min

           minimo = @matrix[1].vector[1]
                
                for i in @matrix.keys do
                        for j in @matrix[i].vector.keys do
                           if @matrix[i].vector[j] < minimo
                              minimo = @matrix[i].vector[j]
                      end
                   end
                end
					return minimo

        end

        def coerce(other)
                [other,self]
        end
end

class Matriz_Dispersa < SparseMatrix

end
