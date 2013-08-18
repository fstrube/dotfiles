desc "Hook our dotfiles into system-standard positions."
task :install do
  # TODO dependency check

  # Setup our dotfiles repo as a homesick castle
  unless File.symlink? File.expand_path('~/.homesick/repos/dotfiles')
    puts "Creating your dotfiles castle..."
    `mkdir -p "$HOME/.homesick/repos"`
    puts `ln -sv "$PWD" "$HOME/.homesick/repos/dotfiles"`
    puts "DONE!"
  end
  puts "Linking dotfiles..."
  system("homesick symlink dotfiles")
  puts "DONE!"

  # Make sure everything in the bin folder is executable
  # .zshrc adds this to our path, so we don't have to do that here
  puts "Making all binaries executable..."
  puts `find "$PWD/bin" \! -perm +111 -exec chmod -v +x {} \\;`
  puts "DONE!"
end

desc "TODO write an uninstall script"
task :uninstall do
  # TODO actually uninstall shit
end
