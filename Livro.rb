class Livro
  attr_reader :titulo, :preco, :ano_lancamento

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
    # @ Variável global main 
    @titulo = titulo
    @preco = preco
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao
    @preco = calcula_preco(preco)
  end

  def to_csv
    "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  private

  def calcula_preco(base)
    if @ano_lancamento < 2006 
      if @possui_reimpressao 
        base * 0.9
      else 
        base *0.95
      end
    elsif @ano_lancamento <= 2010 
      base * 0.96
    else 
      base
    end
  end
end

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
      puts "Newsletter/Liquidacao"
      puts livro.titulo
      puts livro.preco
      puts livro.possui_reimpressao?
  end
end

module Contador 
  def <<(livro)
    push(livro)
    if @maximo_necessario.nil? || @maximo_necessario < size
      @maximo_necessario = size
    end
    self
  end
  attr_reader :maximo_necessario
end

class Estoque 
  attr_reader :livros

  def initialize
    @livros = []
    @livros.extend Contador
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
  def adiciona(livro)
    @livros << livro if livro
  end
end


algoritmos = Livro.new("Algoritmos", 100, 1998, true)
arquitetura = Livro.new("Introdução a Arquitetura e Design de Software", 70, 2011, true)
programmer = Livro.new("The Progmatic Programmer", 100, 1999, true)
ruby = Livro.new("Programming Ruby", 100, 2004, true)

estoque = Estoque.new
estoque.livros <<  algoritmos
puts estoque.livros.maximo_necessario
estoque.livros <<  arquitetura
puts estoque.livros.maximo_necessario
estoque.livros <<  programmer 
puts estoque.livros.maximo_necessario
estoque.livros <<  ruby
puts estoque.livros.maximo_necessario
estoque.livros.delete algoritmos
puts estoque.livros.maximo_necessario

