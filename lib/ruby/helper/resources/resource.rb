module Ruby
  module Helper
    # Contains extensions validation
    module Resource
      def self.validate_ext(path, avail_exts)
        valid_exts_str = avail_exts.join('|')
        path =~ /.*\.[#{valid_exts_str}]/
      end
    end
  end
end
