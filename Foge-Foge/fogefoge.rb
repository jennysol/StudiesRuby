require_relative 'ui'

def le_mapa(numero) 
  arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"
end

def encontra_jogador(mapa)
  caractere_do_heroi = "H"
  mapa.each_with_index do |linha_atual, linha| # Passae por cada elemento da minha linha atual
    coluna_do_heroi = linha_atual.index caractere_do_heroi
    if coluna_do_heroi 

    end
  end
end

def joga(nome)
  mapa = le_mapa 1

  while true
      desenha mapa
      direcao = pede_movimento
  end
end

def inicia_fogefoge
  nome = da_boas_vindas
  joga nome
end