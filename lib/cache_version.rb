module CacheVersion
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def cache_version(*args, &block)
      #default options
      options = {}
      options.merge!(args.pop) if args.last.kind_of?(Hash)

			send :include, InstanceMethods
    end

    # When model is saved it increments versions of associated models
    def updates_versions_of(*args, &block)
      # TODO
    end
  end

	module InstanceMethods
		def version(key=nil,consider_updated_at=true)
	    return [self.model_key(consider_updated_at),"/",key,":",Version.read([self.class.to_s,"#",self.id,key].join)].join
    end

    def increment_version(key=nil,consider_updated_at=true)
      Version.increment([self.class.to_s,"#",self.id,key].join)
      return self.version(key,consider_updated_at)
    end

    def model_key(consider_updated_at=true)
      return (consider_updated_at)? self.cache_key : [self.class.to_s,self.id].join
    end
	end

  module Version
      # increments key by value (default 1) and returns new value
      # if key is nil, sets to 1
      def self.increment(key, by = 1)
        if (value = Rails.cache.read("Version:#{key}")).nil?
          Rails.cache.write("Version:#{key}", (value = 1))
        else
          Rails.cache.write("Version:#{key}", (value = value + by))
        end

        return value
      end

      # decrements key by value (default 1) and returns new value
      # if key is nil, sets to 0
      def self.decrement(key, by = 1)
        if (value = Rails.cache.read("Version:#{key}")).nil?
          Rails.cache.write("Version:#{key}", (value = 0))
        else
          Rails.cache.write("Version:#{key}", (value = value - by))
        end

        return value
      end

      # sets key value, defaults to 0.
      def self.set(key, value=0)
        return Rails.cache.write("Version:#{key}",value)
      end

      # gets key value, defaults to 0.
      def self.read(key)
        return Rails.cache.fetch("Version:#{key}"){0}
      end
  end
end

ActiveRecord::Base.send(:include,CacheVersion)
ActiveRecord::Base.send(:include,Version)
