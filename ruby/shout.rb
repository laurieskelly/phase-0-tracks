module Shout
  
  def yell_angrily(words)
    words + "!!!" + " >:("
  end

  def yell_happily(words)
    words + "!!!" + " :D"
  end

end

class ConstructionWorker
	include Shout
end

class PerformanceArtist
	include Shout
end

c = ConstructionWorker.new
puts c.yell_happily('TGIF brosefs')

p = PerformanceArtist.new
puts p.yell_angrily('Derivative')