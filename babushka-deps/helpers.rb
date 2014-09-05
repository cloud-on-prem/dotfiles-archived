module Babushka
  module Helpers
    class Os
      class << self
        def osx?
          !!(`uname` =~ /Darwin/)
        end

        def linux?
          !osx?
        end

        def windows?
          raise "Seriously?"
        end
      end
    end
  end
end

