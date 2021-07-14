#!/bin/bash

# Read config
IFS=":"
while read game port ;do GAME=game PORT=port ; done < GAME

HOST="${GAME}.labs.overthewire.org"

LEVEL=$2

if [[ $1 = "l" ]] ; then
    echo "LEVEL $LEVEL: Trying to login"
    if [[ -f "${GAME}${LEVEL}" ]] ; then
    	sshpass -p $(cat "${GAME}${LEVEL}") ssh "${GAME}${LEVEL}"@$HOST -p $PORT
    else
	    echo "Missing password file for level $LEVEL"
        exit 1
    fi
elif [[ $1 = "s" ]] ; then
    echo "LEVEL $LEVEL: Saving password"
    echo "$3" > "${GAME}${LEVEL}"
else
    # Print usage
    echo "Illegal argument $1"
    echo "Usage: $0 [l|s] LEVEL [PASSWORD]"
fi

