# Set the working application directory
# working_directory "/path/to/your/app"
#
env = ENV["RAILS_ENV"] || "development"
working_directory "/home/ec2-user/ElizaHugh"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid_path = "/home/ec2-user/ElizaHugh/pids/unicorn.pid" 
pid pid_path

# Path to logs
stderr_path "/home/ec2-user/ElizaHugh/log/unicorn.log"
stdout_path "/home/ec2-user/ElizaHugh/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.sock", :backlog => 64

worker_processes 8
timeout 30
preload_app true
 
before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end
  old_pid_path = "#{pid_path}.oldbin"

  if File.exists?(old_pid_path) && server.pid != old_pid_path
    begin
       Process.kill("QUIT", File.read(old_pid_path).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end
  
after_fork do |server, worker|
   if defined?(ActiveRecord::Base)
     ActiveRecord::Base.establish_connection
   end
end
