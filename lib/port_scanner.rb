require 'socket'

class PortScanner
	def initialize
		@releases    = "Mon 03/11/2019"
		@author      = "Muhammad Quwais Safutra"
	end
	def port_scanner(rhost,port,ab)
		s        = Socket.new(:INET,:STREAM) 
		remote   = Socket.sockaddr_in(port,rhost)
		begin
			s.connect_nonblock(remote)
		rescue Errno::EINPROGRESS
		end
		_, sockets, _ = IO.select(nil,[s],nil)
		if sockets
			puts "#{ab}port #{port} \033[1;32mOPEN"
		else
			# => null
		end
	end
	def set_no
		d = r.strftime("%H:%M")
		info = "\033[1;33m[\033[1;32m#{d}\033[1;33m][\033[1;31mINFO\033[1;33m] \033[1;37m"
		plist = [21,22,23,25,53,80,443,3306,8080,4409,3333]
		printf("[?] target Host :   ")
		rhost = gets.chomp
		threads   = []
		plist.each { |i| threads << Thread.new { port_scanner(rhost,i,info) } }
		threads.each(&:join)
	end
end