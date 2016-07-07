module Shout
  
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + "!!!" + " :D"
  end

end

Shout.yell_happiy("pretty cool")
Shout.yell_angrily("not cool")