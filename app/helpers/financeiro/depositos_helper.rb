module Financeiro::DepositosHelper

  private
    def dpo_add_entry(ch)
      # create cache if it does not exist
      if $redis[dpo_cache_name].nil?
        $redis[dpo_cache_name] = [ch].to_json
      else
        array = JSON.load($redis[dpo_cache_name])

        # add to array only if it does not contain same id
        array << ch unless array.any? { |c| c['id'] == ch.id }
        $redis[dpo_cache_name] = array.to_json
      end
    end

    def dpo_remove_entry(id)
      array = JSON.load($redis[dpo_cache_name])
      array.delete_if { |c| c['id'] == id.to_i }
      $redis[dpo_cache_name] = array.to_json
    end

    def dpo_read_cache
      JSON.load($redis[dpo_cache_name])
    end

    def dpo_flush_cache
      $redis.del(dpo_cache_name)
    end

    def dpo_get_total
      array = dpo_read_cache

      if array.nil?
        0
      else
        array.map { |ch| ch['valor'].to_f }.reduce(0, :+)
      end
    end

    def dpo_cache_name
      "#{session[:user_id]}_deposito"
    end

end
