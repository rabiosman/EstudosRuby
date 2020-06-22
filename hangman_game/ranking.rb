def saveRanking(name, totalScore)
    content = "#{name}\n#{totalScore}"
    File.write "ranking.txt", content
end

def readRanking
    content = File.read "ranking.txt"
    content.split "\n"
end
