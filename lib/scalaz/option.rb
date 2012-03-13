class Scalaz::Option
end

class Scalaz::Some < Scalaz::Option
  def initialize(x)
    @x = x
  end
end

class Scalaz::None < Scalaz::Option
end
