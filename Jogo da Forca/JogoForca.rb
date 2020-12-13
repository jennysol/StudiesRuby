require_relative 'ui'

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta
    
    erros =  0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        chute = pede_um_chute chutes, erros
        if chutes.include? chute
            avisa_chute_efetuado chute
            next # Vai para a próxima interação e executa tudo novamente
        end
        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            total_encontrado = palavra_secreta.count letra_procurada # count > Contador

            if total_encontrado == 0
                avisa_letra_nao_encontrada
                erros += 1
            else
                avisa_letra_encontrada total_encontrado
            end
        else
            acertou = chute == palavra_secreta
            if acertou
                avisa_acertou_palavra
                pontos_ate_agora += 100
                break
            else
                avisa_errou_palavra
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end
    avisa_pontos pontos_ate_agora
end

nome = da_boas_vindas

loop do
    joga nome
    if nao_quer_jogar?
        break
    end
end