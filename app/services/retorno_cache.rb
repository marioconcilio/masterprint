class RetornoCache < CacheManager

  def write(object)
    $redis[@name] = object.to_json
  end

end
