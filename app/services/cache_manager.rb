class CacheManager
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def read
    JSON.load($redis[@name])
  end

  def clear
    $redis.del(@name)
  end

end
