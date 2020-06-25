require_relative 'ui'
def joga(nome)
    mapa = leMapa(1)
    while true
        desenha mapa
        direcao = pedeMovimento
        heroi = encontraJogador mapa
        mapa[heroi[0]][heroi[1]] = " "
        novaPosicao = calculaNovaPosicao heroi, direcao
        mapa[heroi[0]][heroi[1]] = "H"
    end
end

def calculaNovaPosicao(heroi, direcao)
    #heroi = heroi.dup
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
