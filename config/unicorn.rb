worker_processes 2
 timeout 30
 listen "/tmp/unicorn.app.sock"

 root = "/home/anderson/apps/comments/current"

 working_directory root

 pid "#{root}/tmp/pids/unicorn.pid"
 stderr_path "#{root}/log/unicorn.log"
 stdout_path "#{root}/log/unicorn.log"
