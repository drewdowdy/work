require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYER_2_MARKER = '△'

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

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, size)
  system 'clear'
  puts '=' * 60
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.".center(60)
  puts "Best of 5 wins".center(60)
  puts '=' * 60
  puts ''

  row = 1
  sqr_num = 0

  case size
  when 3
    loop do 
      puts '|     |'.center(60)
      puts "#{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}".center(60)
      puts '|     |'.center(60)
      row += 1
      puts '-----+-----+-----'.center(60) if row <= 3
      puts '' if row > 3

      break if row > 3
    end
  when 5
    loop do 
      puts '|     |     |     |'.center(60)
      puts "#{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}".center(60)
      puts '|     |     |     |'.center(60)
      row += 1
      puts '-----+-----+-----+-----+-----'.center(60) if row <= 5
      puts '' if row > 5

      break if row > 5
    end
  when 9
    loop do
      puts '|     |     |     |     |     |     |     |'.center(60)
      puts "#{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[9]}".center(60)
      puts '|     |     |     |     |     |     |     |'.center(60)
      row += 1
      puts '   -----+-----+-----+-----+-----+-----+-----+-----+-----' if row <= 9
      puts '' if row > 9

      break if row > 9
    end
  end
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board(board_size)
  new_board = {}
  case board_size
  when 3
    (1..9).each { |num| new_board[num] = INITIAL_MARKER }
    new_board
  when 5
    (1..25).each{ |num| new_board[num] = INITIAL_MARKER}
    new_board
  when 9
    (1..81).each{ |num| new_board[num] = INITIAL_MARKER}
    new_board
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, separator = ', ', last_word = 'or')
  case array.size
  when 0 then array.join
  when 1 then array.join
  when 2 then array.join( " #{last_word} ")
  else
    array[-1] = "#{last_word} #{array.last}"
    array.join(separator) 
  end
end

def ideal_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k,v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  else
    nil
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, size)
  !!detect_winner(brd, size) # a double bang converts to a boolean
end

def detect_winner(brd, size)
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
        return 'Player'
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return 'Computer'
      end
    end
  when 9
    WINNING_LINES_9x9.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        return 'Player'
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return 'Computer'
      end
    end
  end
  nil
end

def mark_board!(brd, current_player)
  square = ''

  if current_player == 'p'                              # player marks the board
    loop do
      prompt "Choose a square (#{joinor(empty_squares(brd))}):" 
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)

      prompt "Sorry, that's not a valid choice."
    end

    brd[square] = PLAYER_MARKER
  elsif current_player == 'c'                            # computer marks the board
    WINNING_LINES_3x3.each do |line|
      square = ideal_square(line, brd, COMPUTER_MARKER)    # finds offense move
      break if square                                  
    end

    if !square
      WINNING_LINES_3x3.each do |line|      
        square = ideal_square(line, brd, PLAYER_MARKER)    # finds defense move
        break if square                                  
      end
    end

    if !square
      square = 5 if empty_squares(brd).include?(5) # chooses square 5 if available
    end

    if !square
      square = empty_squares(brd).sample # chooses randomly if no offense, defense, or sqr 5
    end

    sleep 0.5
    brd[square] = COMPUTER_MARKER
  end
end

def alternate_player(current_player, brd_size, player_num)
  case brd_size
  when 3
    return 'c' if current_player == 'p'
    return 'p' if current_player == 'c'
  when 5, 9 
    if player_num == 1

  end
end

player_1_score = 0
player_2_score = 0
com_1_score = 0
com_2_score = 0

board_size = nil
player_num = nil

loop do                    # outter game loop
  system 'clear'

  puts '=' * 40
  puts 'Welcome to Tic Tac Toe!'.center(40)
  puts '=' * 40

  sleep 0.5

  loop do 
    puts 'What board size do you want to play? 3x3, 5x5, or 9x9? (3/5/9)'     # decide board size
    board_size = gets.chomp.to_i
    break if board_size.to_i == 3 || board_size.to_i == 5 || board_size.to_i == 9
  
    puts "Please type the number '3', '5', or '9'."
  end

  board = initialize_board(board_size)
  
  if board_size == 5 || board_size == 9
    loop do
      puts 'How many human players are there? (1 or 2)'   # decide num of human players
      player_num = gets.chomp.to_i
      break if player_num.to_i == 1 || player_num.to_i == 2
  
      puts "Please type the number '1' or '2'."
    end
  end

  current_player = nil

  
  loop do                                                                   # decide the first player
    prompt "Who should go first? 'Player', 'Computer', or 'I don't care'? (p/c/idc)"
    current_player = gets.chomp

    break if current_player.downcase.start_with?('p') || current_player.downcase.start_with?('c') || current_player.downcase == 'idc'

    prompt "Please type 'p' for Player, 'c' for Computer or 'idc' for I don't care."
    sleep 0.5
  end
  
  if current_player.downcase == 'idc'
    current_player = ['p','c'].sample
  end

  loop do                 # main game loop
    display_board(board, board_size)

    puts '=' * 40
    puts "Player: #{player_1_score} Computer: #{com_1_score}".center(40)
    puts '=' * 40

    mark_board!(board, current_player)
    current_player = alternate_player(current_player)

    break if someone_won?(board, board_size) || board_full?(board)
  end

    display_board(board, board_size)

  if someone_won?(board, board_size)                   # display the winner
    prompt "#{detect_winner(board, board_size)} won!"

    if detect_winner(board, board_size) == 'Player'
      player_1_score += 1
    elsif detect_winner(board, board_size) == 'Computer'
      com_1_score += 1
    end

  else
    prompt "It's a tie! Both get 1 point!"
    player_1_score += 1
    com_1_score += 1
  end

  break if player_1_score == 5 || com_1_score == 5 

  answer = nil

  loop do
    prompt "Continue? (y/n)"            # `continue?` prompt after each round
    answer = gets.chomp
    break if answer.downcase.start_with?('n') || answer.downcase.start_with?('y')
    prompt "Please type 'y' or 'n'."
    sleep 0.5
  end

  break if answer.downcase.start_with?('n')
  
end

if com_1_score == 5
  prompt 'Computer is the ultimate winner!'
elsif player_1_score == 5
  prompt 'Player is the ultimate winner!'
elsif player_1_score == 5 && computer_score == 5
  prompt "You're both the ultimate winner!"
end

sleep 0.5
prompt 'Thanks for playing Tic Tac Toe! Goodbye.'
