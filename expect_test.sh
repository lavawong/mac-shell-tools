#!/usr/bin/expect
set timeout     30
set tunnel_ip   "1.x.x.x"
set ip_pre      "x.x.x."
set user        "xxxx"
set pscode_pre  "xxxx"
set tunnel_pwd  "xxxxxx"
set defaults_ip "${ip_pre}x"
set package_ip  "${ip_pre}x"
set backup_ip   "${ip_pre}x"
set pscode [lindex $argv 0]
set ip     [lindex $argv 1]
if {$pscode == ""} {
	send_user "Please input vdn code: "
	expect_user -re "(.*)\n"
	set pscode $expect_out(1,string)
}
if {$ip == ""} {
	send_user "Package IP: $package_ip, backup: $backup_ip\nMy Test machine: $defaults_ip\nPlease input ipaddress: "
	expect_user -re "(.*)\n"
	set ip $expect_out(1,string)
}
set ipnumbers [regexp -inline -all -- {\d+} $ip]
if {1 == [llength $ipnumbers]} {
	set ip "${ip_pre}${ip}"
}
spawn ssh ${user}@${tunnel_ip}
set passcode "${pscode_pre}${pscode}"
expect "*password:"
send "${tunnel_pwd}\n"
expect "*PASSCODE:"
send "${passcode}"
expect "*domain name*"
send "${ip}\n"
interact
