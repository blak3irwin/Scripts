#loops through a list of network shares and identifies EVERYONE permissions
#(ex) \\10.10.10.10\FileShare

foreach($line in get-content <file_location>) {
    icacls $line /findSID *S-1-1-0 /c /q >> icacls-EVERYONE.txt
       }
