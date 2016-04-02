class Hash
  def deep_stringify_keys
    new_hash = {}
    each do |key, value|
      new_hash.merge!(key.to_s => (value.is_a?(Hash) ? value.deep_stringify_keys : value))
    end
  end
end
