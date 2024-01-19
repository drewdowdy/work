require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
OTHER_MARKER = '△'

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
def display_board(brd, size, player_num)
  system 'clear'

  puts '=' * 60

  case size
  when 3
    puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.".center(60)
  when 5, 9
    if player_num == 1
      puts "You are #{PLAYER_MARKER}. Computer 1 is #{COMPUTER_MARKER}. Computer 2 is #{OTHER_MARKER}.".center(60)
    elsif player_num == 2
      puts "Player 1 is #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}. Player 2 is #{OTHER_MARKER}.".center(60)
    end
  end

  puts 'First to 3 in a row wins.'.center(60)
  puts 'Best of 5 is the ultimate winner.'.center(60)
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
      puts "#{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}  |  #{brd[sqr_num += 1]}".center(60)
      puts '|     |     |     |     |     |     |     |'.center(60)
      row += 1
      puts '-----+-----+-----+-----+-----+-----+-----+-----+-----'.center(60) if row <= 9
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

def someone_won?(brd, size, player_num)
  !!detect_winner(brd, size, player_num) # a double bang converts to a boolean
end

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
        return player_num == 1 ? 'Player' : 'Player 1'
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return player_num == 1 ? 'Computer 1' : 'Computer'
      elsif brd.values_at(*line).count(OTHER_MARKER) == 3
        return player_num == 1 ? 'Computer 2' : 'Player 2'
      end
    end
  when 9
    WINNING_LINES_9x9.each do |line|
      if brd.values_at(*line).count(PLAYER_MARKER) == 3
        return player_num == 1 ? 'Player' : 'Player 1'
      elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
        return player_num == 1 ? 'Computer 1' : 'Computer'
      elsif brd.values_at(*line).count(OTHER_MARKER) == 3
        return player_num == 1 ? 'Computer 2' : 'Player 2'
      end
    end
  end
  nil
end

def mark_board!(brd, current_player, size)
  square = ''

  if current_player == 'Player 1' || current_player == 'Player 2'                              # player marks the board
    loop do
      prompt "Choose a square (#{joinor(empty_squares(brd))}):" 
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)

      prompt "Sorry, that's not a valid choice."
    end

    brd[square] = PLAYER_MARKER if current_player == 'Player 1'
    brd[square] = OTHER_MARKER if current_player == 'Player 2'
  elsif current_player == 'Computer 1' || current_player == 'Computer 2'                        # computer marks the board
    case size 
    when 3
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
    when 5
      WINNING_LINES_5x5.each do |line|
        square = ideal_square(line, brd, COMPUTER_MARKER)    # finds offense move
        break if square                                  
      end

      if !square
        WINNING_LINES_5x5.each do |line|      
          square = ideal_square(line, brd, PLAYER_MARKER)    # finds defense move
          break if square                                  
        end
      end

      if !square
        square = 13 if empty_squares(brd).include?(13) # chooses square 13 if available
      end

      if !square
        square = empty_squares(brd).sample # chooses randomly if no offense, defense, or sqr 5
      end
    when 9
      WINNING_LINES_9x9.each do |line|
        square = ideal_square(line, brd, COMPUTER_MARKER)    # finds offense move
        break if square                                  
      end

      if !square
        WINNING_LINES_9x9.each do |line|      
          square = ideal_square(line, brd, PLAYER_MARKER)    # finds defense move
          break if square                                  
        end
      end

      if !square
        square = 41 if empty_squares(brd).include?(41) # chooses square 41 if available
      end

      if !square
        square = empty_squares(brd).sample # chooses randomly if no offense, defense, or sqr 5
      end
    end

    sleep 1.5
    brd[square] = COMPUTER_MARKER if current_player == 'Computer 1'
    brd[square] = OTHER_MARKER if current_player == 'Computer 2'
  end
end

def alternate_player(current_player, player_num, size)
  players = ['Player 1', 'Player 2', 'Computer 1', 'Computer 2']

  case size
  when 3
    current_player == players[0] ? players[2] : players[0]
  when 5, 9
    if player_num == 1
      return players[2] if current_player == players[0]
      return players[3] if current_player == players[2]
      return players[0] if current_player == players[3]
    elsif player_num == 2
      return players[1] if current_player == players[0]
      return players[2] if current_player == players[1]
      return players[0] if current_player == players[2]
    end
  end
end

def display_score_message(array, board_size, player_num)
  case board_size
  when 3
    puts "Player: #{array[0].to_s} Computer: #{array[0].to_s}".center(60)
  when 5, 9
    if player_num == 1
      puts "Player: #{array[0].to_s} Computer 1: #{array[2].to_s} Computer 2: #{array[3].to_s}".center(60)
    elsif player_num == 2
      puts "Player 1: #{array[0].to_s} Player 2: #{array[1].to_s} Computer: #{array[2].to_s}".center(60)
    end
  end
end

def greeting
  puts '=' * 60
  puts 'Welcome to Tic Tac Toe!'.center(60)
  puts '=' * 60
end

player_1_score = 0
player_2_score = 0
com_1_score = 0
com_2_score = 0

score_array = [player_1_score, player_2_score, com_1_score, com_2_score]

board_size = nil
player_num = nil
current_player = nil

system 'clear'
greeting  # Welcome Message

loop do                               # decide board size
  puts 'What board size do you want to play? 3x3, 5x5, or 9x9? (3/5/9)'
  board_size = gets.chomp.to_i
  break if board_size.to_i == 3 || board_size.to_i == 5 || board_size.to_i == 9

  puts "Please type the number '3', '5', or '9'."
end

if board_size == 5 || board_size == 9
  loop do
    puts 'How many human players are there? (1 or 2)'   # decide num of human players
    player_num = gets.chomp.to_i
    break if player_num.to_i == 1 || player_num.to_i == 2

    puts "Please type the number '1' or '2'."
  end
end

loop do                                                                   # decide the first player
  prompt "Who should go first? 'Player', 'Computer', or 'I don't care'? (p/c/idc)"
  current_player = gets.chomp

  break if current_player.downcase == 'p' || current_player.downcase == 'c' || current_player.downcase == 'idc'
  prompt "Please type 'p' for Player, 'c' for Computer or 'idc' for I don't care."
  sleep 0.5
end

case current_player # convert user input to 'current_player'
when 'p'
  current_player = 'Player 1'
when 'c'
  current_player = 'Computer 1'
when 'idc'
  case board_size
  when 3
    current_player = ['Player 1', 'Computer 1'].sample
  when 5, 9
    current_player = ['Player 1', 'Computer 1', 'Computer 2'].sample if player_num == 1
    current_player = ['Player 1', 'Player 2', 'Computer 1'].sample if player_num == 2
  end
end

sleep 0.5

case board_size # display who goes first
when 3
  prompt 'Player will go first!' if current_player == 'Player 1'
  prompt 'Computer will go first!' if current_player == 'Computer 1'
when 5, 9
  if player_num == 1
    prompt 'Player will go first!' if current_player == 'Player 1'
    prompt 'Computer 1 will go first!' if current_player == 'Computer 1'
    prompt 'Computer 2 will go first!' if current_player == 'Computer 2'
  elsif player_num == 2
    prompt 'Player 1 will go first!' if current_player == 'Player 1'
    prompt 'Player 2 will go first!' if current_player == 'Player 2'
    prompt 'Computer will go first!' if current_player == 'Computer 1'
  end
end

sleep 1

loop do            # outter game loop
  board = initialize_board(board_size)

  loop do                 # main game loop
    display_board(board, board_size, player_num)

    puts '=' * 60
    display_score_message(score_array, board_size, player_num)
    puts "Now, it's #{current_player}'s move.".center(60)
    puts '=' * 60

    mark_board!(board, current_player, board_size)
    current_player = alternate_player(current_player, player_num, board_size)

    break if someone_won?(board, board_size, player_num) || board_full?(board)
  end

    display_board(board, board_size, player_num)

  if someone_won?(board, board_size, player_num)             # display the winner
    prompt "#{detect_winner(board, board_size, player_num)} won!"

    case detect_winner(board, board_size, player_num)  # allocate points based
    when 'Player', 'Player 1'
      player_1_score += 1
      score_array[0] = player_1_score
    when 'Player 2'
      player_2_score += 1
      score_array[1] = player_2_score
    when 'Computer', 'Computer 1'
      com_1_score += 1
      score_array[2] = com_1_score
    when 'Computer 2'
      com_2_score += 1
      score_array[3] = com_2_score
    end

  else
    prompt "It's a tie! Everyone gets 1 point!"
    player_1_score += 1
    score_array[0] = player_1_score
    player_2_score += 1
    score_array[1] = player_2_score
    com_1_score += 1
    score_array[2] = com_1_score
    com_2_score += 1
    score_array[3] = com_2_score
  end

  break if player_1_score == 5 || player_2_score == 5 || com_1_score == 5 || com_2_score == 5

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

if player_num == 1
  case
  when player_1_score == 5
    prompt 'Player is the ultimate winner!'
  when player_2_score == 5
    prompt 'Player 2 is the ultimate winner!'
  when com_1_score == 5
    prompt 'Computer is the ultimate winner!'
  end
elsif player_num == 2
  case
  when player_1_score == 5
    prompt 'Player 1 is the ultimate winner!'
  when com_1_score == 5
    prompt 'Computer 1 is the ultimate winner!'
  when com_2_score == 5
    prompt 'Computer 2 is the ultimate winner!'
  end
end

sleep 0.5
prompt 'Thanks for playing Tic Tac Toe! Goodbye.'
