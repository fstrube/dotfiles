require 'date'

namespace :subl do
  desc "Install sublime-text-2 and sync user settings"
  task :install do
    if linux? then
      # Add appropriate Ubuntu repository
      if system "sudo add-apt-repository ppa:webupd8team/sublime-text-2 && sudo apt-get update" then
        system "sudo apt-get install sublime-text"
      end
    elsif mac? then
      # TODO Install on Mac OSX
      puts "Automated intall on OSX is not yet supported. Please download and install manually: http://www.sublimetext.com/2"
      next
    else
      puts "You are running an unsupported OS!"
      next
    end

    # Run `rake subl:sync`
    Rake::Task["subl:sync"].execute
  end

  desc "Symlink sublime-text-2 packages"
  task :sync do
    # TODO Windows support
    if mac? then
      sublime_path = '~/Library/Application Support/Sublime Text 2'
    elsif linux? then
      sublime_path = '~/.config/sublime-text-2'
    end

    # Only link these three folders
    folders = ['Packages', 'Installed Packages', 'Pristine Packages']
    folders.each do |folder|
      path = "#{sublime_path}/#{folder}"

      if File.symlink? File.expand_path(path) then
        # Existing symlinks kill break this loop
        puts "Sublime target already linked: #{path}"
        next
      elsif File.directory? File.expand_path(path) then
        # Backup original files
        puts "Backing up original folder: #{path}"
        `mv "#{File.expand_path path}" "#{File.expand_path path}-#{Date.today.to_s}"`
      end

      # Link it!
      puts "Creating symlink for target: #{path}"
      puts "  " + `ln -sv "$PWD/home/sublime-text-2/#{folder}" "#{File.expand_path path}"`
    end
  end
end
