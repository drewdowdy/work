[2, 5, 3, 4, 1].sort           # => [1, 2, 3, 4 ,5]
['c', 'a', 'e', 'b', 'd'].sort # => ['a', 'b', 'c', 'd', 'e']

=begin

## The <=> Method

`<=>` is often called the 'spaceship operator'
returns -1, 0, or 1
  - -1 if the left object is LESS THAN the right object
  - 0 if the left object is EQUAL to the right object
  - 1 if the left object is MORE THAN the right object

=end

2 <=> 1     # => 1
1 <=> 2     # => -1
2 <=> 2     # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a'   # => nil

=begin

| ASCIIbetical order |
|--------------------|

### General Rules:

- Uppercase comes before lowercase
- Digits and most punctuation comes before letters

| Order | Character | Order | Character | Order | Character |
|-------|-----------|-------|-----------|-------|-----------|
|  32   | (space)   |  64   |    @      |  96   |    `      |
|  33   |    !      |  65   |    A      |  97   |    a      |
|  34   |    "      |  66   |    B      |  98   |    b      |
|  35   |    #      |  67   |    C      |  99   |    c      |
|  36   |    $      |  68   |    D      | 100   |    d      |
|  37   |    %      |  69   |    E      | 101   |    e      |
|  38   |    &      |  70   |    F      | 102   |    f      |
|  39   |    '      |  71   |    G      | 103   |    g      |
|  40   |    (      |  72   |    H      | 104   |    h      |
|  41   |    )      |  73   |    I      | 105   |    i      |
|  42   |    *      |  74   |    J      | 106   |    j      |
|  43   |    +      |  75   |    K      | 107   |    k      |
|  44   |    ,      |  76   |    L      | 108   |    l      |
|  45   |    -      |  77   |    M      | 109   |    m      |
|  46   |    .      |  78   |    N      | 110   |    n      |
|  47   |    /      |  79   |    O      | 111   |    o      |
|  48   |    0      |  80   |    P      | 112   |    p      |
|  49   |    1      |  81   |    Q      | 113   |    q      |
|  50   |    2      |  82   |    R      | 114   |    r      |
|  51   |    3      |  83   |    S      | 115   |    s      |
|  52   |    4      |  84   |    T      | 116   |    t      |
|  53   |    5      |  85   |    U      | 117   |    u      |
|  54   |    6      |  86   |    V      | 118   |    v      |
|  55   |    7      |  87   |    W      | 119   |    w      |
|  56   |    8      |  88   |    X      | 120   |    x      |
|  57   |    9      |  89   |    Y      | 121   |    y      |
|  58   |    :      |  90   |    Z      | 122   |    z      |
|  59   |    ;      |  91   |    [      | 123   |    {      |
|  60   |    <      |  92   |    \      | 124   |    |      |
|  61   |    =      |  93   |    ]      | 125   |    }      |
|  62   |    >      |  94   |    ^      | 126   |    ~      |
|  63   |    ?      |  95   |    _      | 127   |    DEL    |

=end

'A' <=> 'a' # => -1
'!' <=> 'A' # => -1

'b'.ord # => 98
'}'.ord # => 125

[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]

[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]

[2, 5, 3, 4, 1].sort do |a, b|
  puts "a is #{a} and b is #{b}"
  a <=> b
end
# a is 2 and b is 5
# a is 5 and b is 3
# a is 2 and b is 3
# a is 5 and b is 4
# a is 3 and b is 4
# a is 5 and b is 1
# a is 4 and b is 1
# a is 3 and b is 1
# a is 2 and b is 1
# => [1, 2, 3, 4, 5]

['arc', 'bat', 'cape', 'ants', 'cap'].sort

# My Idea:
# => ['arc', 'ants', 'bat', 'cap', 'cape']

# Answer:
# => ['arc', 'ants', 'bat', 'cap', 'cape']

[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort

# My Idea:
# => [['b', 2], ['a', 'car', 'd'], ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c']]

# Answer:
# => [["a", "car", "d"], ["a", "car", "d", 3], ["a", "cat", "b", "c"], ["b", 2]]
#   ** all of the arrays starting with 'a' come first

[['a', 'cat', 'b', 'c'], ['a', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# => ArgumentError: comparison of Array with Array failed

['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]

people = { Kate: 27, john: 25, Mike:  18 }

people.sort_by do |_, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]

people.sort_by do |name, _|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]


