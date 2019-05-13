#!/usr/bin/expect -f
set svn_username [lindex $argv 0]
set svn_password [lindex $argv 1]
set svn_up_dir [lindex $argv 2]

spawn docker run -it --rm -v <!change me!>:<!change me!> -w <!change me!>  garethflowers/svn-server svn --username=${svn_username} --password=${svn_password} update ${svn_up_dir}
expect "(R)eject, accept (t)emporarily or accept (p)ermanently? "
send -- "p\r"
expect "Store password unencrypted (yes/no)? "
send "no\r"
expect -re "<!change me!>@.*:\/#"
