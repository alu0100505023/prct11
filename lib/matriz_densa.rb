require "matriz.rb"

class Matriz_densa < Matriz

        def +(other)
           
			  
			  case other
			  when Matriz_densa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @f == other.f && @c == other.c
		           r =@m
		     
		          for i in 0...@f do
		                   for j in 0...@c do
		                         r[i][j]=@m[i][j]+other.m[i][j]
		                   end
		          end
		          return r
			  when Matriz_Dispersa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @f == other.matrix.size && @c == other.matrix[1].vector.size
					other + self
				
			  else
					raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end
        end


        def -(other)
          
           case other
			  when Matriz_densa
					  raise ArgumentError, "Las matrices no son iguales en longitud." unless @f == other.f && @c == other.c
		           rs =@m
		     
		          for i in 0...@f do
		                   for j in 0...@c do
		                         rs[i][j]=@m[i][j]+other.m[i][j]
		                   end
		          end
		          return rs
			  when Matriz_Dispersa
					raise ArgumentError, "Las matrices no son iguales en longitud." unless @f == other.matrix.size && @c == other.matrix[1].vector.size
					other - self
				
			  else
					raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
			  end
        end


        def *(other)				
		  		case other
				when Matriz_densa
					raise ArgumentError, "Las columnas de una matriz no coinciden con las filas de la otra." unless @c == other.f
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
				when Matriz_Dispersa
					raise ArgumentError, "Las columnas de una matriz no coinciden con las filas de la otra." unless @c == other.matrix.size
					other * self
				else
					raise TypeError.new("No se puede pasar #{other.inspect} a Matriz")
				end
        end

        
        def to_s
                for i in 0...@f do
                        for j in 0...@c do
                                print @m[i][j]        
                        end
                        puts
                end
                
        end

        def /(other)
        
                w = Array.new
                for i in 0...@f do
                   w[i] = Array.new
                   for j in 0...@c do
                        w[i][j] = 0
                   end
                end

                for i in 0...@f do
                        for j in 0...@c do
                                    for k in 0...@f - 1 do
                                        w[i][j] += @m[i][k] * other.m[i][j]
                                    end
                        end
                    end
                return w       
        end
        

        def max
                
                maximo = @m[0][0].to_f
                for i in 0...@f do
                        for j in 0...@c do
                                if @m[i][j].to_f > maximo.to_f
                                        maximo = @m[i][j]
                                end
                        end
                end
                maximo

        end


        def min

                minimo = @m[0][0].to_f
                for i in 0...@f do
                        for j in 0...@c do
                                if @m[i][j].to_f < minimo.to_f
                                        minimo = @m[i][j]
                                end
                        end
                end
                minimo

        end

end
