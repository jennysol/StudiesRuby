class Livro
    attr_reader :titulo, :preco, :ano_lancamento, :editora
  
    def initialize(titulo, preco, ano_lancamento, possui_reimpressao, numero, editora)
      # @ Variável global main 
      @titulo = titulo
      @preco = preco
      @ano_lancamento = ano_lancamento
      @possui_reimpressao = possui_reimpressao
      @numero = numero
      @preco = calcula_preco(preco)
      @editora = editora
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
  