class Hash
 
  # Converts all of the keys to strings, optionally formatting key name
  def rubyify_keys!
    keys.each{|k|
      v = delete(k)
      new_key = k.to_s.to_underscore!
      self[new_key] = v
      v.rubyify_keys! if v.is_a?(Hash)
      v.each{|p| p.rubyify_keys! if p.is_a?(Hash)} if v.is_a?(Array)
    }
    self
  end
 
end

class String
  
  # converts a camel_cased string to a underscore string, 
  # Same way ActiveSupport does string.underscore
  def to_underscore!
    self.to_s.gsub(/::/, '/').
      gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])([A-Z])/,'\1_\2').
      tr("-", "_").
      downcase
  end
  
end
