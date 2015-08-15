#!/bin/zsh
BIN_PATH="/usr/lib/golang/bin"

if [ -d "$BIN_PATH" ]; then
	export PATH="$PATH:$BIN_PATH"	
fi
