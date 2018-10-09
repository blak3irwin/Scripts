$list= get-content "<file_location>"

foreach ($ip in $list) {
    Try {
        $dns = Resolve-DnsName $ip -server <dns_server_name> | Select-Object namehost
    catch {
        Resolve-DnsName $ip | Select-Object namehost
    }
}
