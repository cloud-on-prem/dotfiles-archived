require_relative "helpers"

module Babushka
  class Go
    class << self
      VERSION = "1.3"

      def version
        VERSION
      end

      def version_with_name
        "go#{version}"
      end

      def system_version
        `go version`
      end

      def matches_system_version?
        v = Regexp.escape(version)
        Regexp.new(v).match(system_version)
      end
    end
  end
end

dep 'go-main' do
  if Babushka::Helpers::Os.osx?
    requires 'golang.bin'
  else
    requires 'golang.bin.linux'
  end
end

dep 'golang.bin' do
  met? { Babushka::Go.matches_system_version? }
end

dep 'golang.bin.linux' do

  met? { Babushka::Go.matches_system_version? }

  meet do
    tmp = "/tmp"
    go_version = Babushka::Go.version_with_name

    system %Q{
      cd #{tmp}
      # wget http://golang.org/dl/#{go_version}.linux-amd64.tar.gz
      # sudo tar -C /usr/local -xzf #{go_version}.linux-amd64.tar.gz
      # rm /tmp/#{go_version}* -f
    }
  end
end
