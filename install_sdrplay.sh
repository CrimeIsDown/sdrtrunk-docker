#!/usr/bin/expect
exp_internal 1

set script_path [lindex $argv 0];

spawn $script_path

expect {
	-regex "identification in applications such as lsusb?" {
		send "y\r"
	}
	-regex "Press RETURN to view the license agreement" {
		send "\r"
		exp_continue
	}
	-regex "Press space to continue" {
		send "\r"
		exp_continue
	}
	-regex "Press y and RETURN" {
		send "y\r"
	}
    	-regex "\[y/n\]" {
    		send "y\r"
    		exp_continue
    	}
}

expect eof
