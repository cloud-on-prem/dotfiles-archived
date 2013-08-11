require "thor"

class Cloud < Thor

  desc "make_it_rain", "copies all the files into relevant places"

  def make_it_rain
    files = ['.bashrc', '.vimrc', '.bash_aliases', '.gitconfig', '.tmux.conf']
    files.each  do |file|
      old_file_ref = File.expand_path("~/#{file}")
      new_file_ref = File.expand_path("~/.dotfiles/#{file}")
      if File.exists?(old_file_ref)
        File.delete(old_file_ref)
        puts "Deleted #{old_file_ref}"
      end
      File.symlink(new_file_ref, old_file_ref)
      puts "Symlinked #{old_file_ref}"
    end
    source_bash_files = `source ~/.bashrc`
    puts "Sourced .bashrc"
    puts "All Done!"
  end
end

Cloud.start(ARGV)
