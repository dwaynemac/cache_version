module CacheVersion
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def keeps_cache_versions(*args, &block)
      #default options
      options = {}
      options.merge!(args.pop) if args.last.kind_of?(Hash)

      class_eval <<-EOV
        after_save :increment_version

        def version(key)
          return [self.cache_version,"/",key,":",Version.read(Version.read([self.class.to_s,"#",self.id,key].join))].join
        end

        def increment_version(key)
          return Version.increment([self.class.to_s,"#",self.id,key].join)
        end
      EOV
    end

    # When model is saved it increments versions of associated models
    def updates_versions_of(*args, &block)
      # TODO
    end
  end

  module Version
      # increments key by value (default 1) and returns new value
      # if key is nil, sets to 1
      def self.increment(key)
        if (value = Rails.cache.read("Version:#{key}")).nil?
          Rails.cache.write("Version:#{key}", (value = 1))
        else
          Rails.cache.write("Version:#{key}", (value = value + 1))
        end

        return value
      end

      def self.read(key)
        return Rails.cache.fetch("Version:#{key}"){0}
      end
  end
end

class ActiveRecord::Base
  include CacheVersion
  include Version
end
