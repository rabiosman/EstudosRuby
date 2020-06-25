require_relative 'ui'
require_relative 'heroi'

def somaVetor(vetor1, vetor2)
    [vetor1[0] + vetor2[0], vetor1[1] + vetor2[1]]
end

def posicoesValidasAPartirDe (mapa, novoMapa, posicao)
    posicoes = []
    movimentos = [[+1, 0], [0, +1], [-1, 0], [0, -1]]
    movimentos.each do |movimento|
        novaPosicao = somaVetor(movimento, posicao)
        if posicaoValida?(mapa, novaPosicao) && posicaoValida?(novoMapa, novaPosicao)
            posicoes << novaPosicao
        end
    end
    posicoes
end
def moveFantasma(mapa, novoMapa, linha, coluna)
    posicoes = posicoesValidasAPartirDe mapa, novoMapa, [linha, coluna]
    return if posicoes.empty?
    aleatoria = rand posicoes.size
    posicao = posicoes[aleatoria]
    mapa[linha][coluna] = " "
    novoMapa[posicao[0]][posicao[1]] = "F"
end

def moveFantasmas(mapa)
    caractereDoFantasma = "F"
    novoMapa = copiaMapa mapa
    mapa.each_with_index do |linhaAtual, linha|
        linhaAtual.chars.each_with_index do |caractereAtual, coluna|
            ehFantasma = caractereAtual == caractereDoFantasma
            if ehFantasma
                moveFantasma mapa, novoMapa, linha, coluna
            end
        end
    end
    novoMapa
end

def jogadorPerdeu?(mapa)
     perdeu = !encontraJogador(mapa)
end

def executaRemocao(mapa, posicao, quantidade)
    if mapa[posicao.linha][posicao.coluna] == "X"
        return
    end
    posicao.removeDo mapa
    remove mapa, posicao, quantidade - 1
end

def remove(mapa, posicao, quantidade)
    if quantidade == 0
        return
    end
    executaRemocao mapa, posicao.direita, quantidade
end

def joga(nome)
    mapa = leMapa(1)
    while true
        desenha mapa
        direcao = pedeMovimento
        heroi = encontraJogador mapa
        novaPosicao = heroi.calculaNovaPosicao direcao
        if !posicaoValida? mapa, novaPosicao.toArray
            next
        end
        heroi.removeDo mapa
        forUmaBomba = mapa[novaPosicao.linha][novaPosicao.coluna] == "*"
        if forUmaBomba
            remove mapa, novaPosicao, 4
        end
        novaPosicao.colocaNo mapa
        mapa = moveFantasmas mapa
        if jogadorPerdeu? mapa
            gameOver
            break
        end
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
    valorAtual = mapa[posicao[0]][posicao[1]]
    if valorAtual == "X" ||  valorAtual == "F"
        return false
    end
    true
end



def iniciaFogeFoge
    nome = boasVindas
    joga nome
end
def copiaMapa(mapa)
    novoMapa = mapa.join("\n").tr("F", " ").split "\n"
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
            jogador = Heroi.new
            jogador.linha = linha
            jogador.coluna = colunaDoHeroi
            return jogador
        end
    end
    nil
end
