#!/bin/sh

# Print out local connection data for map creation

# do not do anything without maplevel "all"
map_level="$(uci -q get gluon-node-info.@location[0].share_location 2> /dev/null)"
[[ $map_level != "1" ]] && exit 0

# exit if uptime is less than an hour
uptime=$(awk '{print(int($1))}' /proc/uptime)
[[ $uptime -lt 3600 ]] && exit 0

# if no offset known play the dice and set one
[[ ! -f /tmp/log/random_offset.txt ]] && awk -v min=0 -v max=43200 'BEGIN{srand(); print int(min+rand()*(max-min+1))}' > /tmp/log/random_offset.txt
offset=$(cat /tmp/log/random_offset.txt)

# declare last speedtest done 6 days ago if no other declaration found
[[ ! -f /tmp/log/last_speedtest_ts.txt ]] && awk "BEGIN {print $(date +%s) - 3600 * 24 * 6}" > /tmp/log/last_speedtest_ts.txt

# get a speedtestresult if the one found is older than 1 day
if [ $(cat /tmp/log/last_speedtest_ts.txt) -lt $(awk "BEGIN {print $(date +%s) - 3600 * 24 * 6 + $offset}") ]; then
  /sbin/wgetspeedtest.sh -w
else
  echo "offset + last timestamp to less for a new test."
fi

wan_mbps=$(cat /tmp/log/last_speedtest_wan_mbps.txt)
ff_mbps=$(cat /tmp/log/last_speedtest_ff_mbps.txt)
test_ts=$(cat /tmp/log/last_speedtest_ts.txt)
speed_ping=$(cat /tmp/log/last_gwping.txt)

speed_when=$(date -d @$test_ts +'%Y-%m-%d %H:%M:%S')
rx_bytes=$(cat /sys/class/net/br-client/statistics/rx_bytes)
tx_bytes=$(cat /sys/class/net/br-client/statistics/tx_bytes)

content="{"

[ -n "$wan_mbps" ] && content=$content"\"downstream_mbps_wan\" : $wan_mbps, "
[ -n "$ff_mbps" ] && content=$content"\"downstream_mbps_ff\" : $ff_mbps, "
[ -n "$speed_ping" ] && content=$content"\"gw_ping_ms\" : $speed_ping, "
[ -n "$speed_when" ] && content=$content"\"tested_when\" : \"$speed_when\", "
[ -n "$rx_bytes" ] && content=$content"\"rx_bytes\" : $rx_bytes, "
[ -n "$tx_bytes" ] && content=$content"\"tx_bytes\" : $tx_bytes"

content=$content"}"

if [ "$1" = "-p" ]; then

	if [ -n "$content" ]; then
		#make sure alfred is running
    pidof alfred > /dev/null || /etc/init.d/alfred start

		#publish content via alfred
		echo "$content" | /usr/sbin/alfred -s 69 -u /var/run/alfred.sock

		echo "map published"
	else
		echo "nothing published"
	fi
else
	echo  "$content"
fi
