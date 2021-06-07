require_relative "Produto"
class Revista
    attr_reader :titulo, :preco, :ano_lancamento, :editora

    include Produto
  
    def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, numero)
      # @ Variável global main 
      @titulo = titulo
      @ano_lancamento = ano_lancamento
      @possui_reimpressao = possui_reimpressao
      @numero = numero
      @preco = calcula_preco(preco)
      @editora = editora
    end

    def matches?(query)
      ["revista", "impresso"].include?(query)
    end
  
    def possui_reimpressao?
      @possui_reimpressao
    end
  end
  