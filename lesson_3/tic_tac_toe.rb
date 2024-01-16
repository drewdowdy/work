require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts '=' * 40
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}.".center(40)
  puts "Best of 5 wins".center(40)
  puts '=' * 40
  puts ''
  puts '|     |'.center(40)                               #      |    |
  puts "#{brd[1]}  |  #{brd[2]}  |  #{brd[3]}".center(40) #      |    |
  puts '|     |'.center(40)                               #      |    |
  puts '-----+-----+-----'.center(40)                     # -----+-----+-----
  puts '|     |'.center(40)                               #      |    |
  puts "#{brd[4]}  |  #{brd[5]}  |  #{brd[6]}".center(40) #      |    |
  puts '|     |'.center(40)                               #      |    |
  puts '-----+-----+-----'.center(40)                     # -----+-----+-----
  puts '|     |'.center(40)                               #      |    |
  puts "#{brd[7]}  |  #{brd[8]}  |  #{brd[9]}".center(40) #      |    |
  puts '|     |'.center(40)                               #      |    |
  puts ''
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
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

def someone_won?(brd)
  !!detect_winner(brd) # a double bang converts to a boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def mark_board!(brd, current_player)
  square = ''

  if current_player == 'p'
    loop do
      prompt "Choose a square (#{joinor(empty_squares(brd))}):" # player marks the board
      square = gets.chomp.to_i
      break if empty_squares(brd).include?(square)

      prompt "Sorry, that's not a valid choice."
    end

    brd[square] = PLAYER_MARKER
  elsif current_player == 'c'
    WINNING_LINES.each do |line|                         # computer marks the board
      square = ideal_square(line, brd, COMPUTER_MARKER)  # finds offense move
      break if square                                  
    end

    if !square
      WINNING_LINES.each do |line|      
        square = ideal_square(line, brd, PLAYER_MARKER)  # finds defense move
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

def alternate_player(current_player)
  return 'c' if current_player == 'p'
  return 'p' if current_player == 'c'
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board

  system 'clear'

  puts '=' * 40
  puts 'Welcome to Tic Tac Toe!'.center(40)
  puts '=' * 40

  sleep 0.5

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
    display_board(board)

    puts '=' * 40
    puts "Player: #{player_score} Computer: #{computer_score}".center(40)
    puts '=' * 40

    mark_board!(board, current_player)
    current_player = alternate_player(current_player)

    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)                   # display the winner
    prompt "#{detect_winner(board)} won!"

    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end
  
  else
    prompt "It's a tie! Both get 1 point!"
    player_score += 1
    computer_score += 1
  end

  break if player_score == 5 || computer_score == 5 

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

if computer_score == 5
  prompt 'Computer is the ultimate winner!'
elsif player_score == 5
  prompt 'Player is the ultimate winner!'
elsif player_score == 5 && computer_score == 5
  prompt "You're both the ultimate winner!"
end

sleep 0.5
prompt 'Thanks for playing Tic Tac Toe! Goodbye.'
