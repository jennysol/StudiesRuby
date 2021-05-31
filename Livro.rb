class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    attr_accessor :preco

    def initialize(titulo, preco, ano_lancamento)
        @titulo = titulo
        @preco = preco
        @ano_lancamento = ano_lancamento
    end
end

def livro_para_newsletter(livro)
    if livro.ano_lancamento < 1999
        puts "Newsletter/Liquidacao"
        puts livro.titulo
        puts livro.preco
    end
end
algoritmos = Livro.new("Algoritmos", 100, 1998)


def aplica_promocoes(livro)
    if livro.ano_lancamento < 2000
        livro.preco *= 0.7
    end
end
aplica_promocoes(algoritmos)
livro_para_newsletter(algoritmos)
