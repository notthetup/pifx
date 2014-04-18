require 'mumble-ruby'

# Configure all clients globally
Mumble.configure do |conf|
    # sample rate of sound (48 khz recommended)
    conf.sample_rate = 48000

    # bitrate of sound (32 kbit/s recommended)
    conf.bitrate = 16000

    # directory to store user's ssl certs
    conf.ssl_cert_opts[:cert_dir] = File.expand_path("./")
end

# Create client instance for your server
cli = Mumble::Client.new('listen.webuild.sg') do |conf|
    conf.username = 'MumbleBot'
    conf.password = ''

    # Overwrite global config
    conf.bitrate = 48000
end
# => #<Mumble::Client:0x00000003064fe8 @host="localhost", @port=64738, @username="Mumble Bot", @password="password123", @channels={}, @users={}, @callbacks={}>

# Set up some callbacks for when you recieve text messages
# There are callbacks for every Mumble Protocol Message that a client can recieve
# For a reference on those, see the linked PDF at the bottom of the README.
cli.on_text_message do |msg|
    puts msg.message
end
# => [#<Proc:0x0000000346e5f8@(irb):2>]

# Initiate the connection to the client
cli.connect
# => #<Thread:0x000000033d7388 run>

sleep(1)

# # Join the channel titled "Chillen" (this returns the number of bytes written to the socket)
 cli.join_channel('webuildsg-live')

sleep(1);

puts "streaming"
cli.stream_raw_audio('/tmp/mumble.fifo');

print 'Press enter to terminate script';

gets

cli.disconnect
