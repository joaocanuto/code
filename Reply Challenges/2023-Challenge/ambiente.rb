arquivo = File.open("00-example.txt", "r")
conteudo = arquivo.read
arquivo.close

entrada = []

conteudo.each_line.with_index do |linha,index|
  linha = linha.gsub("\n", "")
  teste = linha.split(" ")
  array = []
  teste.each do |item|
    if index < 2
      array << item.to_i
    else
      array << item
    end
  end
  entrada << array
end

puts entrada.inspect

# tratando a primeira parte
C = entrada[0][0]
L = entrada[0][1]
S = entrada[0][2]

# tratando a segunda parte
lengths_of_snake = entrada[1]

# tratando a terceira parte
matriz = []



visited = Array.new(C) { Array.new(L, false) }
(2..(entrada.length - 1)).each do |i|
  matriz << entrada[i]
end



# Solucao:

moves = [[0, 1], [1, 0], [0, -1], [-1, 0]]
moves_sym = ["R", "D", "L", "U"]

resultado = []

def return_biggest_point(matriz, visited)
  cord = []
  maior = - 10001
  matriz.each_with_index do |linha, j|
    linha.each_with_index do |item, i|
      if item == "*"
        next
      end
      item = item.to_i
      if item > maior && visited[i][j] == false
        maior = item
        cord = [i, j]
      end

    end
  end
  cord
end

maior_ponto = return_biggest_point(matriz,visited)

print "MAIOR PONTO: #{maior_ponto.inspect}"


def get_big_point_around_hole(matriz,visited,moves)
  cord = []
  maior = -10001
  matriz.each_with_index do |linha, j|
    linha.each_with_index do |item, i|
      if item == "*"
        ###
        moves.each do |move|
          x = i + move[0]
          y = j + move[1]
          if x < 0
            x = L - 1
          elsif x > L - 1
            x = 0
          end
          if y < 0
            y = C - 1
          elsif
            y > C - 1
          end
          if matriz[x][y] == "*"
            next
          end

          value = matriz[x][y].to_i
          if value > maior && visited[x][y] == false
            maior = value
            cord = [x, y]
          end
        end
        ###
      end
    end
  end
  cord
end

#fazer uma dp para encontrar o maior caminho

# Iterar sobre cada ponto e encontrar a maior pontuacao

$dp = {}

def move(cord, visited, length, matriz)

  if cord[0] < 0
    cord[0] = L - 1
  elsif cord[0] > L - 1
    cord[0] = 0
  end
  if cord[1] < 0
    cord[1] = C - 1
  elsif cord[1] > C - 1
    cord[1] = 0
  end
  puts "Cord: #{cord.inspect}"
  puts "Length: #{length}"
  puts "Visited: #{visited[cord[0]][cord[1]].inspect}"
  puts "DP: #{$dp.inspect}"
  puts "Matriz: #{matriz[cord[0]][cord[1]].inspect}"
  if length == 0 || visited[cord[0]][cord[1]] == true
    return matriz[cord[0]][cord[1]].to_i
  end

  visited[cord[0]][cord[1]] = true

  move_up = [cord[0] + 1, cord[1]]
  move_down = [cord[0] - 1, cord[1]]
  move_left = [cord[0], cord[1] - 1]
  move_right = [cord[0], cord[1] + 1]

  if $dp[cord] == nil
    $dp[cord] = 0
  end

  puts "DP cord: #{$dp[cord].inspect}"
  return $dp[cord] = $dp[cord] + [
    move(move_up, visited.dup, length - 1, matriz),
    move(move_down, visited.dup, length - 1, matriz),
    move(move_left, visited.dup, length - 1, matriz),
    move(move_right, visited.dup, length - 1, matriz)
    ].max
end

matriz.each_with_index do |linha, j|
  linha.each_with_index do |item, i|
    $dp[i,j] = move([i,j], visited.dup, 4, matriz)
  end
end

puts $dp.inspect

arquiv = File.open("output1.txt", "a")
resultado.each_with_index do |item,i|
  item.each do |i|
    if i.is_a? Array
      arquiv.write("#{i[1]} #{i[0]} ")
    else
      arquiv.write("#{i} ")
    end
  end
  if i < resultado.length - 1
    arquiv.write("\n")
  end
end
