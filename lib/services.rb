require 'socket'

class Services
	def initialize
		@releases    = "Mon 03/11/2019"
		@author      = "Muhammad Quwais Safutra"
	end
	def services_scan(rhost,port,ab)
		puts "#{ab}connecting to #{rhost} with port #{port}"
		s = TCPSocket.new(rhost,port)
		puts "#{ab}connected \n#{ab}sending shell"
		s.write("WhoAreYou\r\n")
		puts "#{ab}shell sended!. \n#{ab}reading data..."
		while line = s.gets
			puts "#{ab}data   : #{line}"
		end
	end
	def set_no
		d = r.strftime("%H:%M")
		info = "\033[1;33m[\033[1;32m#{d}\033[1;33m][\033[1;31mINFO\033[1;33m] \033[1;37m"
		printf("[?] target host  :  ")
		rhost = gets.chomp
		printf("[?] target port  :  ")
		port = gets.chomp
		services_scan(rhost,port,info)
	end
end