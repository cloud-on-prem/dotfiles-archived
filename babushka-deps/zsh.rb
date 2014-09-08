dep 'zsh-main' do
  requires 'zsh.shell_setup'
  requires 'zsh.shell_setup'
  requires 'prezto-main'

  username = shell('whoami')

  met? { shell("sudo su - '#{username}' -c 'echo $SHELL'") == which('zsh') }
  meet { sudo("chsh -s '#{which('zsh')}' #{username}") }
end

dep 'zsh.shell_setup' do
  requires 'zsh.bin'
end

dep 'zsh.bin'

dep 'prezto-main' do
  requires 'prezto-install'
  requires 'prezto-update'
end

dep 'prezto-update' do

  def dir
    "~/.zprezto"
  end

  def up_to_date?
    cd dir do
      shell("git fetch")
      0 == shell("git rev-list HEAD...origin/master --count").to_i
    end
  end

  met? do
    up_to_date?
  end

  meet do
    cd dir do
      shell("git fetch && git reset origin/master --hard")
    end
  end

end

dep 'prezto-install' do

  dir = "~/.zprezto"
  repo = "git@github.com:premjg/prezto.git"

  met? do
    dir.p.exists?
  end

  meet do
    shell "git clone --recursive #{repo} #{dir}"
  end
end
