module CacheVersion
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
  
  end
end

class ActiveRecord::Base
  include CacheVersion
end
