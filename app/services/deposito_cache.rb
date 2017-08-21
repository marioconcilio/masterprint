class DepositoCache < CacheManager

  def write(object)
    # create cache if it does not exist
    if $redis[@name].nil?
      $redis[@name] = [object].to_json
    else
      array = JSON.load($redis[@name])

      # add to array only if it does not contain same id
      array << object unless array.any? { |obj| obj['id'] == object.id }
      $redis[@name] = array.to_json
    end
  end

  def remove(object_id)
    array = JSON.load($redis[@name])
    array.delete_if { |obj| obj['id'] == object_id }
    $redis[@name] = array.to_json
  end

end
