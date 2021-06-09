require_relative "Produto"
require_relative "Impresso"

class Livro < Produto
  attr_reader :editora
  
  include Impresso

  def initialize(titulo, preco, ano_lancamento, possui_reimpressao, possui_sobrecapa, editora)
    # @ Variável global main 
    super(titulo, preco, ano_lancamento, editora)
    @possui_reimpressao = possui_reimpressao
    @possui_sobrecapa = possui_sobrecapa
  end

  def matches?(query)
    ["livro", "impresso"].include?(query)
  end

  private
end
