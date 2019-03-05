def main
  starting = Time.now

  puts comb(26, 1)
  puts fact 26
  puts fact 25
  puts fact 1
  length_a = 26
  c_count = 0_u64
  (1..8).each do |v|
    c = comb(length_a, v)
    c_count += c unless c.nil?
    print "C(", length_a, ",", v, ") = ", c, "\n"
  end

  ending = Time.now
  elapsed = ending - starting
  print "elapsed = ", elapsed, "\n"
end

def fact(n) : UInt64
  return 1_u64 if n <= 1
  return (1_u64..n.to_u64).reduce { |acc, i| acc * i }
end

def factBounds(l, h) : UInt64
  return 1_u64 if h <= 1 || h < l
  return (l.to_u64..h.to_u64).reduce { |acc, i| acc * i }
end

def comb(n, k)
  max, min = k > n - k ? [k, n - k] : [n - k, k]
  return factBounds(max + 1, n) / fact(min)
rescue ex
  puts ex.message
  puts "for n= ", n, "k= ", k
end

main
