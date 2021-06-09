require_relative "Produto"
require_relative "Impresso"

class Revista < Produto
    attr_reader :editora

    include Impresso

    def initialize(titulo, preco, ano_lancamento, possui_reimpressao, editora, numero)
      super(titulo, preco, ano_lancamento, editora)
      @possui_reimpressao = possui_reimpressao
      @numero = numero
    end

    def matches?(query)
      ["revista", "impresso"].include?(query)
    end
  
    def possui_reimpressao?
      @possui_reimpressao
    end
  end
  