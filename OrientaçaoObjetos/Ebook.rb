require_relative "Produto"
class Ebook
    attr_reader :titulo, :preco, :ano_lancamento, :editora

    include Produto
  
    def initialize(titulo, preco, ano_lancamento, editora)
      # @ Variável global main 
      @titulo = titulo
      @preco = preco
      @ano_lancamento = ano_lancamento
      @preco = calcula_preco(preco)
      @editora = editora
     
    end

    def matches?(query)
      ["ebook", "digital"].include?(query)
    end
  end
  