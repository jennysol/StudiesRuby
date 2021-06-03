require_relative "contador"

  class Estoque 
    attr_reader :livros
  
    def initialize
      @livros = []
      @vendas = []
      @livros.extend Contador
    end

    def quantidade_de_vendas_de_titulo(produto)
        @vendas.count { |venda| venda.titulo == produto.titulo }
    end

    def livro_que_mais_vendeu_por_titulo
        @vendas.sort {|v1, v2| 
            quantidade_de_vendas_de_titulo(v1) <=> quantidade_de_vendas_de_titulo(v2)
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