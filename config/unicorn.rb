# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/ec2-user/ElizaHugh"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/ec2-user/ElizaHugh/pids/unicorn.pid" 

# Path to logs
stderr_path "/home/ec2-user/ElizaHugh/log/unicorn.log"
stdout_path "/home/ec2-user/ElizaHugh/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.sock"
listen 8080, :tcp_nopush => true

# Number of processes
# worker_processes 4
worker_processes 4 
#
# Time-out
timeout 30
