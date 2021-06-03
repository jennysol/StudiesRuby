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

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "")
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "")
programmer = Livro.new("The Progmatic Programmer", 100, 1999, true, "")
ruby = Livro.new("Programming Ruby", 100, 2004, true, "")

estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby

estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos

puts estoque.livro_que_mais_vendeu_por_titulo.titulo


