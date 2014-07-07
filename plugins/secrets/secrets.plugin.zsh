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
    local ALLOWED='A-Za-z+.)(}{/$%&*=''?"@!^\-<>:;,'
    local len="$1"
    if [ -z "$len" ]; then
        len=20
    fi

    tr -dc "$ALLOWED" < /dev/urandom | head -c $len
    echo
}
