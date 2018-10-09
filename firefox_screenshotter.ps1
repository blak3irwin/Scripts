#loops through a list of csv formatted ips and port numbers
#(ex)10.10.10.10,80
#get HTTP list
$HTTP_list = get-content "<file_location>"

#get HTTPS list
$HTTPS_list = get-content "<file_location>"

foreach ($line in $HTTP_list){
	$test = $line.split("{,}")
	$ip = $test[0]
	$port = $test[1]
	
	echo "firefox.exe --screenshot output\$ip`-HTTP-$port`.png http://$ip`:$port --window-size=1366,768"
	& firefox.exe --screenshot output\$ip`-HTTP-$port`.png http://$ip`:$port --window-size=1366,768
	#sleep to throttle requests
	start-sleep -s 2
}


foreach ($line in $HTTPS_list){
	$test = $line.split("{,}")
	$ip = $test[0]
	$port = $test[1]
	
	echo "firefox.exe --screenshot output\$ip`-HTTPS-$port`.png https://$ip`:$port --window-size=1366,768"
	& firefox.exe --screenshot output\$ip`-HTTPS-$port`.png https://$ip`:$port --window-size=1366,768
	#sleep to throttle requests
	start-sleep -s 2
}
