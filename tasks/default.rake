desc "Hook our dotfiles into system-standard positions."
task :install do
  # TODO dependency check

  # Setup our dotfiles repo as a homesick castle
  system("homesick clone git@github.com:fstrube/dotfiles.git dotfiles")
end

desc "TODO write an uninstall script"
task :uninstall do
  # TODO actually uninstall shit
end
