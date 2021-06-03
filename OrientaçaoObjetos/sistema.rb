  require_relative "Livro"
  require_relative "Estoque"
  
  class Conversor
    def string_para_alfanumerico(nome)
        nome.gsub /[^\w\s]/,''
    end
  end
  
  class Float
    def para_dinheiro
      valor = "R$" << self.to_s.tr('.', ',')
      valor << "0" unless valor.match /(.*)(\d{2})$/
      valor
    end
  end
  
  algoritmos = Livro.new("Algoritmos", 100, 1998, true)
  arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)
  programmer = Livro.new("The Progmatic Programmer", 100, 1999, true)
  ruby = Livro.new("Programming Ruby", 100, 2004, true)
  
  estoque = Estoque.new
  estoque <<  algoritmos
  puts estoque.livros.maximo_necessario
  estoque <<  arquitetura
  puts estoque.maximo_necessario
  estoque <<  programmer 
  puts estoque.maximo_necessario
  estoque <<  ruby
  puts estoque.maximo_necessario
  estoque.remove algoritmos
  puts estoque.maximo_necessario
  
  puts precos = [30.00, 40.00, 70.00, 59.00]
  precos_string = []
  precos.each do |preco|
    puts preco.class
    precos_string << preco.para_dinheiro
  end
  puts precos_string.to_s