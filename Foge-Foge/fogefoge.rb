require_relative 'ui'

def le_mapa(numero) 
  arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"
end

def encontra_jogador(mapa)
  caractere_do_heroi = "H"
  for linha = 0..(mapa.size-1)
    linha_atual = map.a[linha]
    for coluna = 0..(linha_atual.size-1)
      heroi_esta_aqui = linha_atual[coluna] == caractere_do_heroi
      if heroi_esta_aqui 
      end
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