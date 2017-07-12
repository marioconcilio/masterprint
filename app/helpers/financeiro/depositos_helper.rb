module Financeiro::DepositosHelper

  def write_to_cache(ch)
    # create cache if it does not exist
    if $redis[cache_name].nil?
      $redis[cache_name] = [ch].to_json
    else
      array = JSON.load($redis[cache_name])

      # add to array only if it does not contain same id
      array << ch unless array.any? { |c| c['id'] == ch.id }
      $redis[cache_name] = array.to_json
    end
  end

  def remove_from_cache(id)
    array = JSON.load($redis[cache_name])
    array.delete_if { |c| c['id'] == id.to_i }
    $redis[cache_name] = array.to_json
  end

  def clear_cache
    $redis.del(cache_name)
  end

  def read_cache
    JSON.load($redis[cache_name])
  end

  private
    def cache_name
      "#{session[:user_id]}_cheques"
    end

end
