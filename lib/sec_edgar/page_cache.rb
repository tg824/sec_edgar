module SecEdgar

  class PageCache
    PAGE_CACHE_FOLDER = '/Users/jimlindstrom/code/sec_edgar/pagecache/'

    def initialize
    end

    def exists?(key)
      return FileTest.exists?(key_to_cache_filename(key))
    end

    def insert(key, value)
      fh = File.open(key_to_cache_filename(key), "w")
      fh.write(value)
      fh.close
    end

    def lookup(key)
      fh = File.open(key_to_cache_filename(key), "r")
      value = fh.read
      fh.close
      return value
    end

    def key_to_cache_filename(key)
      return PAGE_CACHE_FOLDER + Digest::SHA1.hexdigest(key) + ".html"
    end

  end

end
