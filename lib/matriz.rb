require 'matrix'
require 'Fraccion.rb'
require 'gcd'

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
=begin

	def inverse
			
		c = Array.new
		

		for i in 0...@f do
        	c[i] = Array.new
        	for j in 0...@c do
                c[i][j] = 0
       	 end
		end
	
	
		for i in 0...@c do 
     
	      for j in 0...@f do 
				c[i][j] = @m[j][i]
				#c[i][j] = @m[j][i]

			end

		end

		puts "Traspuesta de G en inverse"

		c.each do |@f|
        puts @f.join(" ")
		end
		

		@di = Matriz.new([[c[0][0],c[0][1],c[0][2]], [c[1][0],c[1][1],c[1][2]], [c[2][0],c[2][1],c[2][2]]])

		

	end
=end

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
=begin
a = Matriz.new([[1,2,3], [3,2,1], [1,2,3]]) 
b = Matriz.new([[3,2,1], [1,2,3], [3,2,1]])

ci = Matriz.new([[1,2,3], [3,2,1], [1,2,3]]) 
d = Matriz.new([[3,2,1], [1,2,3], [3,2,1]])

e = Matriz.new([[1,2,3], [3,2,1], [1,2,3]]) 
fi = Matriz.new([[3,2,1], [1,2,3], [3,2,1]])

g = Matriz.new([[1,2,3], [3,2,1], [1,2,3]]) 
#h = Matriz.new([[4, 5, 8], [3, 7, 9], [-5, 6, 14]])
#h = Matrix[[4, 5, 8], [3, 7, 9], [-5, 6, 14]].inverse
#h = Matrix[[-1, -1], [0, -1]].inverse


puts "Suma"
numero = a
sum = a + b

#sum.each do |x|
#        puts x.join(" ")
#end
puts sum	

puts "Resta"
numero = ci
res = ci - d

res.each do |y|
        puts y.join(" ")
end	

puts "Multiplicacion"
numero = e
multi = e * fi

multi.each do |w|
        puts w.join(" ")
end	

g / h
=end

