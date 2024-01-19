# Paste some code here and execute it. When finished, erase it.

def winning_lines(brd_size)
  rows = []
  columns = []
  diagonals = []

  row = 1
  column = 1
  diagonal = 1

  case brd_size
  when 3
    3.times do 
      rows << [row, row += 1, row += 1]
      row += 1

      columns << [column, column += 3, column += 3]
      column -= 5
    end

    diagonals << [diagonal, 5, diagonal + 8]
    diagonals << [diagonal + 2, 5, diagonal +6]
  when 5
    5.times do
      rows << [row, row += 1, row += 1]
      2.times {rows << [row -= 1, row += 1, row += 1]}
      row += 1

      columns << [column, column += 5, column += 5]
      2.times {columns << [column -= 5, column += 5, column += 5]}
      column -= 19
    end

    3.times do 
      diagonals << [diagonal, diagonal += 6, diagonal += 6]
      2.times {diagonals << [diagonal -= 11, diagonal += 6, diagonal += 6]}

      diagonals << [diagonal -= 12, diagonal += 4, diagonal += 4]
      2.times {diagonals << [diagonal -= 7, diagonal += 4, diagonal += 4]}

      diagonal -= 7
    end
  when 9
    9.times do
      rows << [row, row += 1, row += 1]
      6.times {rows << [row -= 1, row += 1, row += 1]}
      row += 1
    end

    7.times do 
      columns << [column, column += 9, column += 9]
      8.times {columns << [column -= 17, column += 9, column += 9 ]}
      column -= 17
    end

    7.times do
      diagonals << [diagonal, diagonal += 10, diagonal += 10]
      6.times {diagonals << [diagonal -= 19, diagonal += 10, diagonal += 10]}
      diagonal -= 17
    end

    diagonal = 3

    7.times do
      diagonals << [diagonal, diagonal += 8, diagonal += 8]
      6.times {diagonals << [diagonal -= 15, diagonal += 8, diagonal += 8]}
      diagonal -= 13
    end

  end

  rows + columns + diagonals
end

WINNING_LINES_3x3 = winning_lines(3)
WINNING_LINES_5x5 = winning_lines(5)
WINNING_LINES_9x9 = winning_lines(9)

def detect_winner(brd, size, player_num) # if 'size > 3x3', it's broken? (jan 18 @ 16:43)
  case size
  when 3
    WINNING_LINES_3x3.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        return 'Player'
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return 'Computer'
      end
    end
  when 5
    WINNING_LINES_5x5.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        player_num == 1 ? 'Player' : 'Player 1'
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        player_num == 1 ? 'Computer' : 'Computer 1'
      elsif brd.values_at(*line).count(OTHER_MARKER) == 3
        player_num == 1 ? 'Computer 2' : 'Player 2'
      end
    end
  when 9
    WINNING_LINES_9x9.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        player_num == 1 ? 'Player' : 'Player 1'
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        player_num == 1 ? 'Computer' : 'Computer 1'
      elsif brd.values_at(*line).count(OTHER_MARKER) == 3
        player_num == 1 ? 'Computer 2' : 'Player 2'
      end
    end
  end
  nil
end


