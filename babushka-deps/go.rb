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
  requires 'go-path'
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

dep 'go-path', :path do
  path.default("~/projects/")

  go_root = File.join(path, "go")
  bin_path = File.join(go_root, "bin").to_s
  pkg_path = File.join(go_root, "pkg").to_s
  src_path = File.join(go_root, "src").to_s

  met? do
    bin_path.p.exists?
    pkg_path.p.exists?
    src_path.p.exists?
  end

  meet do
    `mkdir -p #{bin_path}`
    `mkdir -p #{pkg_path}`
    `mkdir -p #{src_path}`
  end
end
