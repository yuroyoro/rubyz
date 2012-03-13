# -*- coding: utf-8 -*-

module Scalaz::Identity
  def ？？(default)
    self.nil? ? default :
      self.class === default ? self : (raise TypeError.new("type mismatch: found: #{default.class}, required #{self.class}"))
  end

  def ｜＞(f = nil, &block)
    if f && Proc === f
      f.call(self)
    elsif block_given?
      yield self
    end
  end

  def some ; Scalaz::Some.new(self) end

  def left  ; raise 'いらなくね？' end
  def right ; raise 'いらなくね？' end

  def pair ; [self,self] end
  alias_method :squared, :pair

  # required first args is Proc object.
  def whileDo(predicate)
    raise TypeError.new("requires predicate is Proc, but #{predicate.class}") unless Proc === predicate
    raise TypeError.new("no block given") unless block_given?

    res = self
    while predicate.call(res) do
      res = yield res
    end
    res
  end

  def doWhile(predicate)
    raise TypeError.new("requires predicate is Proc, but #{predicate.class}") unless Proc === predicate
    raise TypeError.new("no block given") unless block_given?

    res = self
    begin
      res = yield res
    end while predicate.call(res)
    res
  end

end

Object.send(:include,  Scalaz::Identity)
