require 'lib/Fraccion.rb'
require 'lib/matriz_dispersa.rb'
require 'lib/matriz_densa.rb'


h3 = Matriz_densa.new(2,2,[[4,5],[2,3]])
h4 = Matriz_Dispersa.new 1 => {1 => 0, 2 => 0}, 2 => {1 => 0, 2 => Fraccion.new(1,2)}

puts "Suma de matriz densa con dispersa"
h3 + h4
puts "Suma de matriz dispersas con matriz densa"
h4 + h3

puts "Resta de matriz densa con dispersa"
h3 - h4
puts "Resta de matriz dispersas con matriz densa"
h4 - h3

puts "Multiplicacion de matriz densa con dispersa"
h3 * h4
puts "Multiplicacion de matriz dispersas con matriz densa"
h4 * h3



=begin
puts "Resta de matrices dispersas"
h4 + h4
puts "Resta de matriz dispersas con matriz densa"
h4 + h3
puts "Multiplicacion de matrices dispersas"
h4 + h4
puts "Multiplicacion de matriz dispersas con matriz densa"
h4 + h3
=end
=begin
#Se especifican los hash a usar en las pruebas
h = SparseMatrix.new 1 => {1 => 33, 2 => 44}, 2 => {1 => 66, 2 => 77}
h2 = SparseMatrix.new 1 => {1 => 1, 2 => 2}, 2 => {1 => 1, 2 => 2}

#Se inician las pruebas de los metodos con enteros
puts "Muestra el hash h con enteros: "
puts h.mostrar
print "Comprobacion hash 1 con enteros: "
puts h.comprobar
puts "Suma de enteros: "
h+h2
puts "Resta de enteros: "
h-h2
puts "Multiplicacion de enteros: "
h*h2
puts "Maximo de matriz de enteros: "
h.max
puts "Minimo de matriz de enteros: "
h.min
=end
=begin
#Se especifican los hash a usar en las pruebas con fracciones
h3 = SparseMatrix.new 1 => {1 => Fraccion.new(33,2), 2 => Fraccion.new(44,3)}, 2 => {1 => Fraccion.new(66,5), 2 => Fraccion.new(77,12)}
h4 = SparseMatrix.new 1 => {1 => 1, 2 => 2}, 2 => {1 => 1, 2 => 2}
h5 = SparseMatrix.new 1 => {1 => Fraccion.new(1,1), 2 => Fraccion.new(2,1)}, 2 => {1 => Fraccion.new(1,1), 2 => Fraccion.new(2,1)}

#Se inician las pruebas de los metodos con los hash fracciones
puts "Muestra el hash h con fracciones: "
puts h3.mostrar
print "Comprobacion hash 1 con fracciones: "
puts h3.comprobar
puts "Suma de fracciones: "
h3+h4
puts "Resta de fracciones: "
h3-h4
puts "Multiplicacion de fracciones ambas: "
h3*h5
puts "Multiplicacion de fracciones con enteros: "
h3*h4
puts "Maximo de matriz de Fracciones: "
h3.max
puts "Minimo de matriz de Fracciones: "
h3.min

#Se especifican los hash a usar en las pruebas con fracciones y enteros
h6= SparseMatrix.new 1 => {1 => Fraccion.new(33,2), 2 => 44}, 2 => {1 => 66, 2 => Fraccion.new(77,12)}
h7 = SparseMatrix.new 1 => {1 => 1, 2 => 2}, 2 => {1 => 1, 2 => 2}

puts "Multiplicar de matriz de Fracciones-Enteros con enteros: "
h6*h7
#puts "Maximo de matriz de Fracciones y enteros: "
#h6.max
#puts "Minimo de matriz de Fracciones y enteros: "
#h6.min
=end

