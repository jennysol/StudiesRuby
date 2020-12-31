class Heroi
    attr_accessor :linha, :coluna #Atributos e acesso

    def calcula_nova_posicao(direcao)
        heroi = self.dup #Duplicando eu mesmo
        movimentos = {
          "W" => [-1, 0],
          "S" => [+1, 0],
          "A" => [0, -1],
          "D" => [0, +1],
        }
        movimento = movimentos[direcao]
        heroi.linha += movimento[0]
        heroi.coluna += movimento[1]
        heroi
      end
end

