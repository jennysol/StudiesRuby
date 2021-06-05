require_relative "Livro"
require_relative "Revista"
require_relative "Ebook"
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

algoritmos = Livro.new("Algoritmos", 100, 1998, true, "", true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true, "", false)
programmer = Livro.new("The Progmatic Programmer", 100, 1999, true, "", false)
ruby = Livro.new("Programming Ruby", 100, 2004, true, "", true)

revistona = Revista.new("Revista de Ruby", 10, 2012, true, "Revistas", 3)
online_arquitetura = Ebook.new("Introdução a Arquitetura e Design de Software", 50, 2012,"")

estoque = Estoque.new
estoque << algoritmos << algoritmos << ruby << programmer << arquitetura << ruby << ruby << revistona << online_arquitetura

estoque.vende ruby
estoque.vende algoritmos
estoque.vende algoritmos
estoque.vende revistona
estoque.vende online_arquitetura

puts estoque.livro_que_mais_vendeu_por_titulo.titulo
puts estoque.revista_que_mais_vendeu_por_titulo.titulo
puts estoque.ebook_que_mais_vendeu_por_titulo.titulo
puts estoque.respond_to?(:ebook_que_mais_vendeu_por_titulo)



