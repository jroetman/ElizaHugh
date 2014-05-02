ps aux | grep thin | awk '{print $2}' | xargs kill -9
