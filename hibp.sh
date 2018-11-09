#!/bin/bash

echo Password to check with \'Have I been pwned\'
echo
echo NOTE: The entered password does not leave this system. 
echo
echo An SHA-1 hash of the entered password is computed locally, the first five digits of the SHA-1 hash are sent for a prefix range match
echo If no output appears your password was not found. If a hash is printed, a match of the full SHA-1 hash of the entered password was found.
echo The number after the colon is the number of instances the entered password was found in the database
echo
echo -n Password:
read -s password 
echo
FFIVE=$(echo -n ${password} | shasum);curl https://api.pwnedpasswords.com/range/{${FFIVE:0:5}} 2>/dev/null | grep -i ${FFIVE:6:34}
unset password
unset FFIVE
