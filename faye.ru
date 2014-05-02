require 'eventmachine'
require 'rack'
require 'thin'
require 'faye'

Faye::WebSocket.load_adapter('thin')

EM.run {
   thin = Rack::Handler.get('thin')
   app = Faye::RackAdapter.new(
      mount: '/faye', 
      timeout: 60 
   )

   thin.run(app, :Port => 9292) do |server|
   # You can set options on the server here, for example to set up SSL:
   server.ssl_options = {
      :private_key_file => '/home/ec2-user/certs/private-key.pem',
      :cert_chain_file =>  '/home/ec2-user/certs/www.elizahugh.com.chained.crt'
   }
   server.ssl = true
   end
}

