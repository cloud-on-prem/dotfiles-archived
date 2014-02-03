begin
  require "thor"
rescue LoadError
  system("gem install thor")
  require "thor"
end


class Cloud < Thor

  desc "make_it_rain", "copies all the files into relevant places"
  def make_it_rain
    files = ['.bashrc', '.vimrc', '.bash_aliases', '.gitconfig', '.tmux.conf', '.git-completion.bash']
    files.each  do |file|
      old_file_ref = File.expand_path("~/#{file}")
      new_file_ref = File.expand_path("~/.dotfiles/#{file}")
      if File.exists?(old_file_ref)
        File.delete(old_file_ref)
        puts "✂ Deleted #{old_file_ref}"
      end
      File.symlink(new_file_ref, old_file_ref)
      puts "⚑ Symlinked #{old_file_ref}"
    end

    # Put Tmux SSH RC into the correct place;
    system("cat ~/.dotfiles/.ssh.tmux.rc > ~/.ssh/rc") unless `uname`.chomp == "Darwin"

    system("source ~/.bashrc")
    puts "✎ Sourced .bashrc"
    puts "☀ All Done!"
  end
end

Cloud.start(ARGV)
