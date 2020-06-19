def welcome
    puts "Bem-vindo ao jogo da adivinhacao"
    puts "Qual eh o seu nome?"
    nome = gets.strip
    puts "O jogo será iniciado para você, #{nome}"
end

def sorteiaNumero(dificuldade)
    case dificuldade 
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 90
    when 4
        maximo = 150
    else 
        maximo = 200
    end
    puts "Escolhendo um número secreto entre 1 e #{maximo}..."
    sorteado = rand(maximo) + 1 
    sorteado   
end

def pedeDificuldade
    puts "Deseja qual nivel de dificuldade? (Digite um numero entre 1 e 5 para escolher a dificuldade)"
    dificuldade = gets.to_i
end

def pedeNumero(chutes, tentativa, limiteDeTentativas)
    puts "Tentativa #{tentativa} de #{limiteDeTentativas} "
    puts "Chutes ate agora: #{chutes}"    
    puts "Entre com o numero:\n"  
    chute = gets 
    puts "Será que acertou? Seu chute foi #{chute}"
    chute.to_i
end

def verificaAcerto(numeroSecreto, chute)
    acertou = chute == numeroSecreto       
    if acertou        
        puts "Acertou"
        return true
    end
    maior = numeroSecreto > chute 
    if maior
        puts "O numero secreto eh maior que o digitado"            
    else
        puts "O numero secreto eh menor que o digitado"                   
    end
    return false
end

def game(nome, dificuldade)
    numeroSecreto = sorteiaNumero dificuldade
    limiteDeTentativas = 5
    chutes = []
    score = 1000
    for tentativa in 1..limiteDeTentativas    
    chute = pedeNumero chutes, tentativa, limiteDeTentativas 
    chutes << chute
    loseScore = (chute - numeroSecreto).abs / 2.0
    score -= loseScore
    if verificaAcerto numeroSecreto, chute        
        break
    end    
end
puts "Você ganhou #{score} pontos. O numero secreto era #{numeroSecreto}"
end

def wannaPlay
    puts "Deseja jogar novamente?(S/N)"
    wannaPlay = gets.strip
    wannaPlay.upcase == "S"

end

nome = welcome
dificuldade = pedeDificuldade
loop do
    game nome, dificuldade
    if !wannaPlay
        break
    end
end