def main
    starting = Time.now
    l = [2,7,4]
    l.each do |v|
        puts v
    end

    a = ('a'..'z').to_a
    (1..8).flat_map{|size| 
        print "SIZE ==> ", size, " <==\n"
        p a.combination(size).map(&:join) 
    }

    length_a = a.length
    c_count = 0
    (1..8).each do |v|
        c = comb(v, length_a)
        c_count += c
        print "C(",v,",",length_a,") = ", c,"\n"
    end
    ending = Time.now
    elapsed = ending - starting
    print "elapsed = ",elapsed,"\n"
end

def fact(n)
    return (1..n).reduce(1,:*)
end

def comb(n,m)
    return (fact m) / (fact(m-n) * fact(n))
end


main