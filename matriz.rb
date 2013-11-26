require 'matrix'

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


        def +(other)         
                   suma = @m
                    for i in 0...@f do
                           for j in 0...@c do
                                   suma[i][j]=@m[i][j]+other.m[i][j]
                           end
                    end
                    return suma
            end

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
	
	 def -(other)

		resta = @m
                    for i in 0...@f do
                           for j in 0...@c do
                                   resta[i][j] = @m[i][j] - other.m[i][j]
                           end
                    end	

             return resta
      end

	 def /(other)
		
		

		div = @m * other
		
		puts "Division"

		div.each do |@f|
        puts @f.join(" ")
		end
		
	end

	def to_s

  		aux = ""
      i = 0
      while (i < @f)
      	j = 0
         while (j < @c)
         	aux += "#{@m[i][j]}\t"
            j += 1
         end
         aux += "\n"
         i += 1
      end
      aux


	end

end

