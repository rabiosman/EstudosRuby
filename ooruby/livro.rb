class Livro
    attr_reader :titulo, :preco, :anoLancamento
    def initialize(titulo, preco, anoLancamento, possuiReimpressao)
        @titulo = titulo
        @anoLancamento = anoLancamento
        @preco = calculaPreco(preco)
        @possuiReimpressao = possuiReimpressao
    end

    def possuiReimpressao?
        @possuiReimpressao
    end

    def calculaPreco(base)
        if @anoLancamento < 2006
            if @possuiReimpressao
                base * 0.9
            else
                base * 0.95
            end
        elsif @anoLancamento <= 2010
            base * 0.96
        else
            base
        end
    end

    def toCSV
        "#{@titulo}, #{@anoLancamento}, #{@preco}"
    end
end

class Estoque
    def initialize
        @livros = []
    end

    def exportaCSV(estoque)
        @livros.each do |livro|
            puts livro.toCSV
        end
    end

    def maisBaratoQue(valor)
        @livros.select do |livro|
            livro.preco <= valor
        end
    end

    def total
        @livros.size
    end

    def adiciona(livro)
        @livros << livro if livro
    end
end




estoque = Estoque.new
estoque.adiciona Livro.new("Agile Web Development with Rails", 70, 2011, true)
estoque.adiciona Livro.new("LivroVelho", 100, 1999, true)
estoque.adiciona Livro.new("Introducao a Arquitetura e Design de Software", 70, 2011, false)
estoque.adiciona Livro.new("The Pragmatic Programmer", 100, 1999, true)
estoque.adiciona Livro.new("Programming Ruby", 100, 2004, true)
def livroNewsLetter(livro)
    if livro.anoLancamento < 2000
        puts "Newsletter"
        puts livro.titulo
        puts livro.preco
    end
end
baratos = estoque.maisBaratoQue 80
baratos.each do |livro|
    puts livro.titulo
end
puts estoque.total
estoque.exportaCSV(estoque)
