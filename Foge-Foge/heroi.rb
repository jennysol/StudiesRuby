class Heroi
    attr_accessor :linha, :coluna #Atributos e acesso

    def calcula_nova_posicao(direcao)
        novo_heroi = dup #Duplicando eu mesmo
        movimentos = {
          "W" => [-1, 0],
          "S" => [+1, 0],
          "A" => [0, -1],
          "D" => [0, +1],
        }
        movimento = movimentos[direcao]
        novo_heroi.linha += movimento[0]
        novo_heroi.coluna += movimento[1]
        novo_heroi
    end

    def to_array
        [linha, coluna]
    end
end

