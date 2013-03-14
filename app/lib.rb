class MetaNested
  def self.long_operation(&callback)
    instance = MetaNested.new
    instance.long_operation(&callback)
  end

  def long_operation(&callback)
    MetaBasic.long_operation do
      callback.call
    end
  end
end

class MetaBasic
  def self.long_operation(&callback)
    instance = MetaBasic.new
    instance.long_operation(&callback)
  end

  def long_operation(&callback)
    Dispatch::Queue.main.after(3) do
      callback.call
    end
  end
end