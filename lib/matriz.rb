
require 'matrix'
require 'Fraccion.rb'
require 'gcd'

#Clase padre Matriz
class Matriz
        attr_reader :m, :f, :c
        
        def initialize(m)
                @m=m
                @f=m.size
                @c=m[1].size
        end

		  def initialize(f,c,m)
			
				@m=m
         	@f=c
            @c=c

		  end

	#Suma entre dos matrices
        def +(other)         
                   suma = @m
                    for i in 0...@f do
                           for j in 0...@c do
                                   suma[i][j]=@m[i][j]+other.m[i][j]
                           end
                    end
                    return suma
            end

	#Multiplicacion entre dos matrices.
        def *(other)

						z = Array.new
		

					for i in 0...@f do
        				z[i] = Array.new
        				for j in 0...@c do
          		      z[i][j] = 0
       			 end
					end

            for i in 0...@f do
                            for j in 0...@c do
                                        for k in 0...@f do
                                           z[i][j] += @m[i][k] * other.m[k][j]
                                        end
                            end
                    end        
            return z
    end
	#Resta entre dos matrices
	def -(other)

		resta = @m
                    for i in 0...@f do
                           for j in 0...@c do
                                   resta[i][j] = @m[i][j] - other.m[i][j]
                           end
                    end	

             return resta
      end


end


