#!/bin/bash
echo "
rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 9080
rdr pass inet proto tcp from any to any port 443 -> 127.0.0.1 port 9443
" | sudo pfctl -ef -
