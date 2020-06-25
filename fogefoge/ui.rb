def boasVindas
    puts "Bem vindo ao Foge-Foge"
    puts "Qual eh o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "O jogo sera iniciado para voce #{nome}"
    nome
end

def pedeMovimento
    puts "Para onde deseja ir?"
    movimento = gets.strip
end

def desenha(mapa)
    puts mapa
end
