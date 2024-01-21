require 'pry'

def prompt(msg)
  puts "=> #{msg}"
end

def card_values
  all_cards = {}
  suits = %w[diamonds clubs hearts spades]

  suits.each do |suit|
    (2..10).each do |num|
      all_cards["#{num} of #{suit}"] = num
    end

    all_cards["jack of #{suit}"] = 10
    all_cards["queen of #{suit}"] = 10
    all_cards["king of #{suit}"] = 10
    all_cards["ace of #{suit}"] = 11
  end

  all_cards
end

def deal_card!(deck)
  card = deck.sample
  deck.delete(card)
  card
end

def total(hand)
  total = 0
  hand.each do |key|
    num = card_values[key]
    total += num
  end

  if total > 21
    hand.select { |card| card.include?('ace') }.count.times do # makes 'ace' worth 1 if total is over 21
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

def who_wins?(player_hand, dealer_hand)
  player_total = total(player_hand)
  dealer_total = total(dealer_hand)

  if player_total > 21 || (21 - player_total).abs > (21 - dealer_total).abs
    'The dealer'
  elsif dealer_total > 21 || (21 - dealer_total).abs > (21 - player_total).abs
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
prompt "To see the rules, press 'r'."
prompt "To play the game, press 'p'."
answer = nil

loop do
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

loop do # main game loop
  break if answer == 'q'

  deck = card_values.keys

  player_hand = [deal_card!(deck), deal_card!(deck)]
  dealer_hand = [deal_card!(deck), deal_card!(deck)]

  prompt "You and the dealer are being delt 2 cards each."
  prompt ''
  sleep(1)
  prompt "The dealer has: #{dealer_hand[0]} and unknown card."
  prompt "You have: #{player_hand[0]} and #{player_hand[1]}."

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

    player_hand << deal_card!(deck) if move == 'h'
    prompt "Now, you have #{player_hand.join(', ')}."
  end

  prompt "Now it's the dealer's turn!"

  loop do # Dealer Turn
    break if total(dealer_hand) >= 17

    dealer_hand << deal_card!(deck)
    prompt 'The dealer chose to hit!'
    sleep(1)
  end

  prompt 'The dealer chose to stay!'

  sleep(1)

  prompt ''
  prompt "The dealer has #{dealer_hand.join(', ')}."
  prompt "You have #{player_hand.join(', ')}."
  prompt ''

  sleep(1)

  if total(dealer_hand) > 21
    prompt "The dealer has #{total(dealer_hand)} and busted!"
  elsif total(player_hand) > 21
    prompt "You have #{total(player_hand)} and busted!"
  else
    prompt "You have #{total(player_hand)} and the dealer has #{total(dealer_hand)}."
  end

  winner = who_wins?(player_hand, dealer_hand)

  prompt "#{winner} is the winner!"

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
