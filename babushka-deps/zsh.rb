dep 'zsh-main' do
  requires 'zsh.shell_setup'
  requires 'zsh.shell_setup'
  requires 'prezto'

  username = shell('whoami')

  met? { shell("sudo su - '#{username}' -c 'echo $SHELL'") == which('zsh') }
  meet { sudo("chsh -s '#{which('zsh')}' #{username}") }
end

dep 'zsh.shell_setup' do
  requires 'zsh.bin'
end

dep 'zsh.bin'

dep 'prezto' do

  dir = "~/.zprezto"
  repo = "https://github.com/sorin-ionescu/prezto.git"

  met? do
    dir.p.exists?
  end

  meet do
    shell "git clone --recursive #{repo} #{dir}"
  end
end
