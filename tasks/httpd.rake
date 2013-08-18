namespace :httpd do
  desc "Install and setup local webservers"
  task :install do
    # Check for Apache and Nginx installed
    http_installed = system("which nginx") or system("which apache2ctl")

    next

    # TODO Write package installation script
    if not http_installed then
      install = ask "Which HTTP server would you like to install?", ["nginx","apache","q"]

      exit if install == "q"

      if linux? then
        # Add appropriate Ubuntu repository
        `sudo apt-get install #{package[:linux][install]}`
      elsif mac? then
        # Install on Mac OSX
        `brew install #{package[:mac][install]}`
        next
      else
        puts "You are running an unsupported OS!"
        next
      end
    end

    # Run `rake subl:sync`
    Rake::Task["http:sync"].execute
  end

  desc "Link user configurations to appropriate web server"
  task :sync do
    nginx_installed = system("which nginx >/dev/null")
    apache_installed = system("which apache2ctl >/dev/null")

    if linux? or mac? then
      system "sudo ln -v -s -i $HOME/.http/vhosts/*.nginx /etc/nginx/sites-enabled/" if nginx_installed
      system "sudo ln -v -s -i $HOME/.http/vhosts/*.apache /etc/apache2/sites-enabled/" if apache_installed

      if apache_installed then
        system "/etc/init.d/nginx status && sudo /etc/init.d/nginx restart"
      end
      if apache_installed then
        system "/etc/init.d/apache2 status && (sudo apache2ctl graceful || sudo apache2ctl restart)"
      end
    else
      puts "You are running an unsupported OS!"
      next
    end

  end
end
