require_relative 'ui'
def joga(nome)
    mapa = leMapa(1)
    while true
        desenha mapa
        direcao = pedeMovimento
        heroi = encontraJogador mapa
        novaPosicao = calculaNovaPosicao heroi, direcao
        if !posicaoValida? mapa, novaPosicao
            next
        end
        mapa[heroi[0]][heroi[1]] = " "
        mapa[novaPosicao[0]][novaPosicao[1]] = "H"

    end
end

def posicaoValida?(mapa, posicao)
    linhas = mapa.size
    colunas = mapa[0].size

    estourouLinha = posicao[0] < 0 || posicao[0] >= linhas
    estourouColuna = posicao[1] < 0 || posicao[1] >= colunas

    if estourouLinha || estourouColuna
        return false
    end
    if mapa[posicao[0]][posicao[1]] == "X"
        return false
    end
    true
end

def calculaNovaPosicao(heroi, direcao)
    heroi = heroi.dup
    case direcao
        when "W"
            heroi[0] -= 1
        when "S"
            heroi[0] += 1
        when "A"
            heroi[1] -= 1
        when "D"
            heroi[1] += 1
    end
    heroi
end

def iniciaFogeFoge
    nome = boasVindas
    joga nome
end

def leMapa(numero)
    arquivo = "mapa#{numero}.txt"
    texto = File.read(arquivo)
    mapa = texto.split("\n")
end

def encontraJogador(mapa)
    caracterHeroi = "H"
    mapa.each_with_index do |linhaAtual, linha|
        colunaDoHeroi = linhaAtual.index caracterHeroi
        if colunaDoHeroi
            return [linha, colunaDoHeroi]
        end
    end
end
