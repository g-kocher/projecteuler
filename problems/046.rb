require 'Prime'
primes = Prime.first(1000)
twice_squares = (1..1000).map{|i| 2*i**2}

odd_composites = 9.upto(primes.last + twice_squares.last).to_a.keep_if{|i| i.odd? && !i.prime?}

combinations = primes.product(twice_squares).map{|i| i.first + i.last}.sort!

puts (odd_composites - combinations).first