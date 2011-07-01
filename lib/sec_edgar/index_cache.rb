module SecEdgar

  class IndexCache
    INDEX_CACHE_FOLDER = '/Users/jimlindstrom/code/sec_edgar/indexcache/'

    def initialize
    end

    def exists?(key)
      return FileTest.exists?(key_to_cache_filename(key))
    end

    def insert(key, value)
      fh = File.open(key_to_cache_filename(key), "w")
      fh.write(value.to_s)
      fh.close
    end

    def lookup(key)
      fh = File.open(key_to_cache_filename(key), "r")
      value = fh.read
      fh.close
      return eval value
    end

    def key_to_cache_filename(key)
      return INDEX_CACHE_FOLDER + Digest::SHA1.hexdigest(key) + ".rb"
    end

  end

end
