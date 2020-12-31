class Heroi
    attr_accessor :linha, :coluna #Atributos e acesso
end

Jennifer = Heroi.new 
Jennifer.linha = 15
Jennifer.coluna = 3

puts "A Jennifer está em #{Jennifer.linha}"
puts Jennifer