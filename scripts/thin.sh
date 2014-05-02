#/etc/nginx/nginx.conf
thin start -s2 --socket /tmp/thin.sock -e production 
#thin start -s1 --ssl -e production -p 3001 --ssl-key-file /home/ec2-user/certs/private-key.pem --ssl-cert-file /home/ec2-user/certs/www.elizahugh.com.chained.crt
