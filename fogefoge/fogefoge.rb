require_relative 'ui'


def moveFantasma(mapa, linha, coluna)
    posicao = [linha, coluna+1]
    if posicaoValida? mapa, posicao
        mapa[linha][coluna] = " "
        mapa[posicao[0]][posicao[1]] = "F"
    end
end

def moveFantasmas(mapa)
    caractereDoFantasma = "F"
    mapa.each_with_index do |linhaAtual, linha|
        linhaAtual.chars.each_with_index do |caractereAtual, coluna|
            ehFantasma = caractereAtual == caractereDoFantasma
            if ehFantasma
                moveFantasma mapa, linha, coluna
            end
        end
    end
end

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
        moveFantasmas mapa
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
    if mapa[posicao[0]][posicao[1]] == "F"
        return false
    end
    true
end

def calculaNovaPosicao(heroi, direcao)
    heroi = heroi.dup
    movimentos = {
        "W" => [-1, 0],
        "A" => [0, -1],
        "S" => [+1, 0],
        "D" => [0, +1]
    }
    movimento = movimentos[direcao]
    heroi[0] += movimento[0]
    heroi[1] += movimento[1]
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
