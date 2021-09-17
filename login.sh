#!/bin/bash

# Read config
IFS=":"
while read game port ;do WAR_GAME=$game PORT=$port ; done < GAME
HOST="${WAR_GAME}.labs.overthewire.org"

LEVEL=$2

function save_passwd(){
    echo "LEVEL $LEVEL: Saving password"
    echo "$1" > "${WAR_GAME}${LEVEL}"
}

function login(){
    echo "LEVEL $LEVEL: Trying to login"
    if [[ -f "${WAR_GAME}${LEVEL}" ]] ; then
    	sshpass -p $(cat "${WAR_GAME}${LEVEL}") ssh "${WAR_GAME}${LEVEL}"@$HOST -p $PORT
    else
	    echo "Missing password file for level $LEVEL"
        exit 1
    fi
}

if [[ $1 = "-l" ]] ; then
    login $3
elif [[ $1 = "-s" ]] ; then
    save_passwd
elif [[ $1 = "--save-and-login" ]] ; then
    save_passwd $3
    login $3
else
    # Print usage
    echo "Illegal argument $1"
    echo "Usage: $0 [l|s] LEVEL [PASSWORD]"
fi

