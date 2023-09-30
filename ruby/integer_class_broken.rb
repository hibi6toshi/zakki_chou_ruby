class Integer
  @@called_count = 0

  alias_method 'old_+', :+

  def +(n)
    @@called_count = @@called_count.send('old_+' , 1)
    # p self => self is instance of Integer
    self.class.define_method :calc_self do
        self.send("old_+", n) 
    end unless defined? self.calc_self

    case @@called_count
      when 1 then
        calc_self
      when 2 then
        "may be... #{calc_self}?"
      when 3 then
        "may be... #{calc_self.to_s(2)}?"
      else
        "perfectly broken... 😞"
    end
  end
  # p self => self is Integer
  # define_method :test do
  #     "testing"
  # end

  # define_method(:check) do
  #    puts self
  # end
end

p 1 + 2
p 1 + 2
p 1 + 2
p 1 + 2
p 1 + 2

# 3
# "may be... 3?"
# "may be... 11?"
# "perfectly broken... 😞"
# "perfectly broken... 😞"

# 組み込みクラスをハックして、壊す
