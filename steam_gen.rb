
def main
    starting = Time.now
    $l = '!¤"#-!¤"#!¤-¤!"#!"¤-%%%!"#'
    $copy = $l
    $mem = Mem.new
    $count = 0
    parseString($l.chars)
    puts "number of candidates: ", $count
    ending = Time.now
    elapsed = ending - starting
    print "elapsed = ",elapsed,"\n"
end

def parseString(s)
    #print $mem.chars,"\n"
    if s.empty? 
        puts $copy
        $count += 1
        #print $mem.nums,"\n"
    else
        h, *t = s
        if h != '-' && !$mem.chars.include?(h)
            $mem.chars.push(h)
            (0..9).each do |n|
                if !$mem.nums.include?(n)
                    $mem.nums.push(n)
                    backup = $copy   
                    $copy = $copy.gsub(h, n.to_s)
                    parseString(t)
                    $copy = backup
                    $mem.nums.pop
                end
            end
            $mem.chars.pop
        else
            parseString(t)
        end
    end
end 

class Mem
    attr_accessor :chars, :nums
    def initialize
        @chars = []
        @nums = []
    end
end

main