#script for encrypting files using gpg.exe

#input and output directories for script
$inputfile = "<file_location>"
$outputfile = "<file_location>"
#location of public key
$certfile = "<file_location>"

echo "[+] ENCRYPTING FILE: $inputfile"
echo ''
echo ''
#import  public PGP key
& gpg.exe --import $certfile

#encryption magic
& gpg.exe  -r <recipient> --trust-model always -v  -o $outputfile -e $inputfile

echo ''
echo ''
echo "[+] ENCRYPTED FILE CREATED: $outputfile"
echo ''
