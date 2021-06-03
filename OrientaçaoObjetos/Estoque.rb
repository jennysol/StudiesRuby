require_relative "contador"

class Estoque 
  attr_reader :livros

  def initialize
    @livros = []
    @vendas = []
    @livros.extend Contador
  end

  def method_missing(name)
    mather = name.to_s.match "(.+)_que_mais_vendeu_por_(.+)"
    if mather
      tipo = mather[1]
      campo = mather[2].to_sym
      que_mais_vendeu_por(tipo, &campo)
    else
      super
    end
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

  private

  def quantidade_de_vendas_por(produto, &campo)
    @vendas.count { |venda| campo.call(venda) == campo.call(produto) }
  end

  def que_mais_vendeu_por(tipo, &campo)
    @vendas.select {|l| l.tipo == tipo }.sort {|v1, v2| 
      quantidade_de_vendas_por(v1, &campo) <=> 
      quantidade_de_vendas_por(v2, &campo)
    }.last
  end
end