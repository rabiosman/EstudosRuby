class Heroi
    attr_accessor :linha, :coluna
    def calculaNovaPosicao(direcao)
        novoHeroi = dup
        movimentos = {
            "W" => [-1, 0],
            "A" => [0, -1],
            "S" => [+1, 0],
            "D" => [0, +1]
        }
        movimento = movimentos[direcao]
        novoHeroi.linha += movimento[0]
        novoHeroi.coluna += movimento[1]
        novoHeroi
    end
    def direita
        calculaNovaPosicao "D"
    end
    def toArray
        [linha, coluna]
    end

    def removeDo(mapa)
        mapa[linha][coluna] = " "
    end
    def colocaNo(mapa)
        mapa[linha][coluna] = "H"
    end
end
