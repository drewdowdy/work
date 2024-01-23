require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def generate_card(rank, suit)
  [
    ' _____ ',
    rank.length == 2 ? "|#{rank}   |" : "|#{rank}    |",
    '|     |',
    "|  #{suit}  |",
    '|     |',
    rank.length == 2 ? "|___#{rank}|" : "|____#{rank}|"
  ]
end

def card_values
  values = {}
  ranks = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  suits = %w[♦ ♣ ♥ ♠]

  ranks.each do |rank|
    suits.each do |suit|
      card = generate_card(rank, suit)
      points = case rank
               when 'J', 'Q', 'K' then 10
               when 'A' then 11
               else rank.to_i
               end
      values[card] = points
    end
  end

  values
end

def print_horizontal(cards)
  lines = cards.transpose.map { |line| line.join('  ') }
  puts lines.join("\n")
end

def make_deck
  deck = []
  suits = %w[♦ ♣ ♥ ♠]
  faces = %w[J Q K A]
  suits.each do |suit|
    faces.each do |face|
      (2..10).each do |num|
        deck << generate_card(num.to_s, suit).dup
      end
      deck << generate_card(face, suit).dup
    end
  end
  deck
end

def total(hand)
  total = 0
  aces = 0

  hand.each do |card|
    num = card_values[card]
    total += num
    aces += 1 if card.flatten.include?('A')
  end

  if total > 21
    aces.times do
      total -= 10
    end
  end

  total
end

def display_greeting
  puts '=' * 60
  puts 'Welcome to Twenty-One!'.center(60)
  puts '=' * 60
end

def display_rules
  system 'clear'
  puts '=' * 60
  puts 'Rules of Twenty-One'.center(60)
  puts '=' * 60
  puts 'Goal:'
  puts '  - Get as close to 21 without going over.'
  puts '  - If you go over 21, it\'s a "bust" and you lose.'
  puts ''
  puts 'Card Values:'
  puts '  - All cards 2-10 have the same value as their numbers.'
  puts '  - Jack, Queen, and King are worth 10.'
  puts '  - Ace is worth either 1 or 11.'
  puts ''
  puts 'Your turn:'
  puts '  - You can see your hand and one card from the dealer.'
  puts '  - You can choose to either "hit" or "stay".'
  puts '  - If you hit, you get another card. You can hit as much as you like.'
  puts '  - If you stay, your turn ends and it is the dealer\'s turn.'
  puts ''
  puts 'Dealer\'s turn:'
  puts '  - They will choose to hit or stay based on their hand.'
  puts ''
  puts 'Do you want to quit or play? (q/p)'
end

def who_wins?(player_total, dealer_total)
  if dealer_total > 21 && player_total > 21
    'No one'
  elsif player_total > 21
    'The dealer'
  elsif dealer_total > 21
    'The player'
  elsif (21 - player_total).abs > (21 - dealer_total).abs
    'The dealer'
  elsif (21 - dealer_total).abs > (21 - player_total).abs
    'The player'
  elsif player_total == dealer_total
    'Everyone'
  end
end

# ======================================================================
#              Methods are above, Game code is below.
# ======================================================================

system 'clear'

display_greeting
prompt 'Best of 5 rounds is the ultimate winner!'
prompt "To see the rules, press 'r'."
prompt "To play the game, press 'p'."
answer = nil

loop do # rules or play?
  answer = gets.chomp.downcase
  if answer == 'p'
    break
  elsif answer == 'r'
    display_rules
    answer = gets.chomp.downcase
  end
  break if %w[p q].include?(answer)

  puts "Please type 'q' to quit or 'p' to play."
end

player_score = 0
dealer_score = 0

loop do # main game loop
  break if answer == 'q'

  deck = make_deck.shuffle

  player_hand = [deck.pop, deck.pop]
  dealer_hand = [deck.pop, deck.pop]

  prompt 'You and the dealer are being dealt 2 cards each.'
  prompt ''
  sleep(1)
  prompt 'The dealer has one unknown card and:'
  puts dealer_hand[0]
  prompt 'You have:'
  print_horizontal(player_hand)

  loop do # Player Turn
    move = nil
    loop do
      prompt 'What will you do now? Hit or Stay? (h/s)'
      move = gets.chomp.downcase
      break if %w[h s].include?(move)

      prompt "Please type 'h' for hit or 's' for stay."
      sleep(1)
    end
    break if move == 's'

    sleep(1)

    player_hand << deck.pop if move == 'h'
    prompt 'Now, you have:'
    print_horizontal(player_hand)
  end

  prompt "Now it's the dealer's turn."

  loop do # Dealer Turn
    break if total(dealer_hand) >= 17

    dealer_hand << deck.pop
    prompt 'The dealer chose to hit.'
    sleep(1)
  end

  prompt 'The dealer chose to stay.'

  sleep(1)

  prompt ''
  prompt 'The dealer has:'
  print_horizontal(dealer_hand)
  prompt 'You have:'
  print_horizontal(player_hand)
  prompt ''

  sleep(1)

  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  prompt "You have #{player_total} and the dealer has #{dealer_total}."
  prompt "#{who_wins?(player_total, dealer_total)} is the winner!"

  case who_wins?(player_total, dealer_total)
  when 'The player'
    player_score += 1
  when 'The dealer'
    dealer_score += 1
  when 'Everyone'
    player_score += 1
    dealer_score += 1
  end

  prompt "Rounds won by dealer: #{dealer_score} Rounds won by player: #{player_score}"

  ultimate_winner = nil

  if player_score == 5
    ultimate_winner == 'Player'
  elsif dealer_score == 5
    ultimate_winner == 'Dealer'
  end

  puts "The ultimate winner is #{ultimate_winner}!" if ultimate_winner

  continue = nil

  loop do # Play again?
    prompt 'Do you want to play again? (y/n)'
    continue = gets.chomp.downcase
    break if %w[y n].include?(continue)

    prompt "Please type 'y' for yes and 'n' for no."
  end

  break if continue == 'n'
end

sleep(1)
prompt 'Thanks for playing Twenty-One. Goodbye!'
