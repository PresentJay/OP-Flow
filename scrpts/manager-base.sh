#!/bin/bash

checkOS(){
    case $(uname -s) in
        "Darwin"*) OSname="mac" ;;
        "Linux"*) OSname="linux" ;;
        "MINGW32"* | "MINGW64"* | "CYGWIN" ) OSname="win" ;;
    esac
    echo ${OSname}
}

helpHead() {
    echo -e "\nbash $1 [Options ...]"
    content h "help" "print help messages"
}

helpContent() {
    if [[ $# -eq 3 ]]; then
        echo -e "\t[-$1, --$2]\t$3"
    elif [[ $# -eq 2 ]]; then
        echo -e "\t[--$1]\t$2"
    fi
}

helpTail() {
    echo -e "\n"
    exit 1
}

kill() {
    echo >&2 "[WARNING] $@"
    exit 1
}

bar() {
    echo -e "\n* * * * * * * * * * * * * * * * * * * * *\n"
}

# $1: size of blank line
line() {
    if [[ $# -eq 0 ]]; then
        echo -e "\n"
    elif [[ $# -eq 1 ]]; then
        for (( iter=1; iter<=$1; iter++ )); do
            echo -e "\n"
        done
    fi
}

getenv() {
    set -o allexport
    source $1.env set
    +o allexport
}