#!/bin/bash

checkOS(){
    case $(uname -s) in
        "Darwin"*) OSname="mac" ;;
        "Linux"*) OSname="linux" ;;
        "MINGW32"* | "MINGW64"* | "CYGWIN" ) OSname="win" ;;
    esac
    echo ${OSname}
}

helpContent() {
    if [[ $# -eq 3 ]]; then
        echo -e "\t[-$1, --$2]\t$3"
    elif [[ $# -eq 2 ]]; then
        echo -e "\t[--$1]\t$2"
    fi
}

helpHead() {
    echo -e "\nbash $1 [Options ...]"
    helpContent h "help" "print help messages"
}

helpTail() {
    echo -e "\n"
    exit 1
}

kill() {
    echo >&2 "[WARNING] $@"
    exit 1
}

success() {
    echo "[SUCCESS] $@"
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
    source $1.env set +o allexport
}

loop_to_success() {
    getenv ./environments/manager-config
    for (( iter=1; iter>0; iter++ )) ; do
        if ${SILENT}; then
            echo "try to exec command: '$@' (${iter}/${ITERATION_LIMIT} trials)";
        fi
        eval $@ && break;
        sleep 2;
        if [[ iter -eq ${ITERATION_LIMIT} ]]; then kill "command iteration is close to limit > exit. (${iter}/${ITERATION_LIMIT} failed)"; fi;
    done
}