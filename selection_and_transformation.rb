produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hash)
  selected_fruits = {}
  keys = hash.keys  # makes an array of all keys
  counter = 0       # used on `keys` array

  loop do
    break if counter == keys.size

    current_key = keys[counter]
    current_value = hash[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size
    
    current_number = numbers[counter]
    numbers[counter] = current_number * 2

    counter += 1
  end

  numbers
end

double_numbers!(my_numbers)
p my_numbers