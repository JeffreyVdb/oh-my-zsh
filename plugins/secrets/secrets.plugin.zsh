#!/usr/bin/env zsh
genbtsynckey() {
    # keep generating until our key has the required length 
    local REQUIRED=55
    local MYKEY=''
    
    while [ ${#MYKEY} -ne $REQUIRED ]; do
        MYKEY=$(head -c 42 /dev/random| base64 | tr -d '+/')
    done

    echo $MYKEY
}

genpassword() {
    apg -c "$(head -c 32 /dev/random|base64)" -a 1 -m $1 -n 6
}
