require_relative "contador"

class Estoque 
  attr_reader :livros

  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  def quantidade_de_vendas_por(produto, &campo)
      @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
  end

  def livro_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("livro",&:titulo)
  end

  def livro_que_mais_vendeu_por_ano
    que_mais_vendeu_por("livro",&:ano)
  end

  def livro_que_mais_vendeu_por_editora
   que_mais_vendeu_por("livro", &:editora)
  end

  def revista_que_mais_vendeu_por_titulo
    que_mais_vendeu_por("revista", &:titulo)
  end

  def revista_que_mais_vendeu_por_ano
    que_mais_vendeu_por("revista", &:ano)
  end

  def revista_que_mais_vendeu_por_editora
  que_mais_vendeu_por("revista", &:editora)
  end

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select {|l| l.tipo == tipo }.sort {|v1, v2| 
      quantidade_de_vendas_por(v1, &campo) <=> 
      quantidade_de_vendas_por(v2, &campo)
    }.last
  end

  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end
  def mais_baratos_que(valor)
    @livros.select do |livro|
      livro.preco <= valor
    end
  end
  def total 
    @livros.size
  end
  def <<(livro)
    @livros << livro if livro
    self
  end
  def vende(livro)
    @livros.delete livro
    @vendas << livro
  end
  def maximo_necessario
    @livros.maximo_necessario
  end
end