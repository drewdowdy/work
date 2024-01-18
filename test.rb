# Paste some code here and execute it. When finished, erase it.

# INITIAL_MARKER = ' '
# PLAYER_MARKER = 'X'
# COMPUTER_MARKER = 'O'

# def display_board(brd, size)
#   system 'clear'
#   puts '=' * 60
#   puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.".center(60)
#   puts "Best of 5 wins".center(60)
#   puts '=' * 60
#   puts ''

#   row = 1
#   sqr_num = 0

#   case size
#   when 3
#     loop do 
#       puts '|     |'.center(60)
#       puts "#{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}".center(60)
#       puts '|     |'.center(60)
#       row += 1
#       puts '-----+-----+-----'.center(60) if row <= 3
#       puts '' if row > 3

#       break if row > 3
#     end
#   when 5
#     loop do 
#       puts '|     |     |     |'.center(60)
#       puts "#{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}".center(60)
#       puts '|     |     |     |'.center(60)
#       row += 1
#       puts '-----+-----+-----+-----+-----'.center(60) if row <= 5
#       puts '' if row > 5

#       break if row > 5
#     end
#   when 9
#     loop do
#       puts '|     |     |     |     |     |     |     |'.center(60)
#       puts "#{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[9]}".center(60)
#       puts '|     |     |     |     |     |     |     |'.center(60)
#       row += 1
#       puts '   -----+-----+-----+-----+-----+-----+-----+-----+-----' if row <= 9
#       puts '' if row > 9

#       break if row > 9
#     end
#   end
# end

# def initialize_board(board_size)
#   new_board = {}
#   case board_size
#   when 3
#     (1..9).each { |num| new_board[num] = INITIAL_MARKER }
#     new_board
#   when 5
#     (1..25).each{ |num| new_board[num] = INITIAL_MARKER}
#     new_board
#   when 9
#     (1..81).each{ |num| new_board[num] = INITIAL_MARKER}
#     new_board
#   end
# end

# puts "What's the board size? 3x3, 5x5, or 9x9? (3/5/9)"
# board_size = gets.chomp.to_i

# board = initialize_board(board_size)

# display_board(board, board_size)


# WINNING_LINES_3x3 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
#                     [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
#                     [[1, 5, 9], [3, 5, 7]]              # diagonals

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

# p winning_lines(3)
# p winning_lines(5)
p winning_lines(9)


# WINNING_LINES_5x5 = [[1, 2, 3], [2, 3, 4], [3, 4, 5]] +          # rows
#                     [[6, 7, 8], [7, 8, 9], [8, 9, 10]] +
#                     [[11, 12, 13], [12, 13, 14], [13, 14, 15]] +
#                     [[16, 17, 18], [17, 18, 19], [18, 19, 20]] +
#                     [[21, 22, 23], [22, 23, 24], [23, 24, 25]] +
#                     [[1, 6, 11], [6, 11, 16], [11, 16, 21]] +    # columns
#                     [[2, 7, 12], [7, 12, 17], [12, 17, 22]] +
#                     [[3, 8, 13], [8, 13, 18], [13, 18, 23]] +
#                     [[4, 9, 14], [9, 14, 19], [14, 19, 24]] +
#                     [[5, 10, 15], [10, 15, 20], [15, 20, 25]] +
#                     [[1, 7, 13], [2, 8, 14], [3, 9, 15]] +       # diagonals
#                     [[3, 7, 11], [4, 8, 12], [5, 9, 13]] +
#                     [[6, 12, 18], [7, 13, 19], [8, 14, 20]] +
#                     [[8, 12, 16], [9, 13, 17], [10, 14, 18]] +
#                     [[11, 17, 23], [12, 18, 24], [13, 19, 25]] +
#                     [[13, 17, 21], [14, 18, 22], [15, 19, 23]]

# WINNING_LINES_9x9 = 
# [
#   [1, 2, 3], [2, 3, 4], [3, 4, 5], [4, 5, 6], [5, 6, 7], [6, 7, 8], [7, 8, 9],                     # row: 7 lines / row
#   [10, 11, 12], [11, 12, 13], [12, 13, 14], [13, 14, 15], [14, 15, 16], [15, 16, 17], [16, 17, 18], 
#   [19, 20, 21], [20, 21, 22], [21, 22, 23], [22, 23, 24], [23, 24, 25], [24, 25, 26], [25, 26, 27], 
#   [28, 29, 30], [29, 30, 31], [30, 31, 32], [31, 32, 33], [32, 33, 34], [33, 34, 35], [34, 35, 36], 
#   [37, 38, 39], [38, 39, 40], [39, 40, 41], [40, 41, 42], [41, 42, 43], [42, 43, 44], [43, 44, 45], 
#   [46, 47, 48], [47, 48, 49], [48, 49, 50], [49, 50, 51], [50, 51, 52], [51, 52, 53], [52, 53, 54], 
#   [55, 56, 57], [56, 57, 58], [57, 58, 59], [58, 59, 60], [59, 60, 61], [60, 61, 62], [61, 62, 63], 
#   [64, 65, 66], [65, 66, 67], [66, 67, 68], [67, 68, 69], [68, 69, 70], [69, 70, 71], [70, 71, 72], 
#   [73, 74, 75], [74, 75, 76], [75, 76, 77], [76, 77, 78], [77, 78, 79], [78, 79, 80], [79, 80, 81], 
#   [1, 10, 19], [2, 11, 20], [3, 12, 21], [4, 13, 22], [5, 14, 13], [6, 15, 24], [7, 16, 25], [8, 17, 16], [9, 18, 27],    # columns
#   [10, 19, 28], [11, 20, 29], [12, 21, 30], [13, 22, 31], [14, 23, 32], [15, 24, 33], [16, 25, 34], [17, 26, 35], [18, 27, 36], 
#   [19, 28, 37], [20, 29, 38], [21, 30, 39], [22, 31, 40], [23, 32, 41], [24, 33, 42], [25, 34, 43], [26, 35, 44], [27, 36, 45],
#   [28, 37, 46], [29, 38, 47], [30, 39, 48], [31, 40, 49], [32, 41, 50], [33, 42, 51], [34, 43, 52], [35, 44, 53], [36, 45, 54], 
#   [37, 46, 55], [38, 47, 56], [39, 48, 57], [40, 49, 58], [41, 50, 59], [42, 51, 60], [43, 52, 61], [44, 53, 62], [45, 54, 63], 
#   [46, 55, 64], [47, 56, 65], [48, 57, 66], [49, 58, 67], [50, 59, 68], [51, 60, 69], [52, 61, 70], [53, 62, 71], [54, 63, 72], 
#   [55, 64, 73], [56, 65, 74], [57, 66, 75], [58, 67, 76], [59, 68, 77], [60, 69, 78], [61, 70, 79], [62, 71, 80], [63, 72, 81],
#   [1, 11, 21], [2, 12, 22], [3, 13, 23], [4, 14, 24], [5, 15, 25], [6, 16, 26], [7, 17, 27],       # diagonals (to right)
#   [10, 20, 30], [11, 21, 31], [12, 22, 32], [13, 23, 33], [14, 24, 34], [15, 25, 35], [16, 26, 36],
#   [19, 29, 39], [20, 30, 40], [21, 31, 41], [22, 32, 42], [23, 33, 43], [24, 34, 44], [25, 35, 45],
#   [28, 38, 48], [29, 39, 49], [30, 40, 50], [31, 41, 51], [32, 42, 52], [33, 43, 53], [34, 44, 54],
#   [37, 47, 57], [38, 48, 58], [39, 49, 59], [40, 50, 60], [41, 51, 61], [42, 52, 62], [43, 53, 63],
#   [46, 56, 66], [47, 57, 67], [48, 58, 68], [49, 59, 69], [50, 60, 70], [51, 61, 71], [52, 62, 72],
#   [55, 65, 75], [56, 66, 76], [57, 67, 77], [58, 68, 78], [59, 69, 79], [60, 70, 80], [61, 71, 81],
#   [3, 11, 19], [4, 12, 20], [5, 13, 21], [6, 14, 22], [7, 15, 23], [8, 16, 24], [9, 17, 25],       # diagonals (to left)
#   [12, 20, 28], [13, 21, 29], [14, 22, 30], [15, 23, 31], [16, 24, 32], [17, 25, 33], [18, 26, 34],
#   [21, 29, 37], [22, 30, 38], [23, 31, 39], [24, 32, 40], [25, 33, 41], [26, 34, 42], [27, 35, 43], 
#   [30, 38, 46], [31, 39, 47], [32, 40, 48], [33, 41, 49], [34, 42, 50], [35, 43, 51], [36, 44, 52], 
#   [39, 47, 55], [40, 48, 56], [41, 49, 57], [42, 50, 58], [43, 51, 59], [44, 52, 60], [45, 53, 61], 
#   [48, 56, 64], [49, 57, 65], [50, 58, 66], [51, 59, 67], [52, 60, 68], [53, 61, 69], [54, 62, 70], 
#   [57, 65, 73], [58, 66, 74], [59, 67, 75], [60, 68, 76], [61, 69, 77], [62, 70, 78], [63, 71, 79]
# ]