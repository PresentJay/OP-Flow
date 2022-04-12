#!/bin/bash

source ./scripts/manager-base.sh
getenv ./environments/manager-config

while getopts hucxdl-: OPT; do
    if [ $OPT = "-" ]; then
        OPT=${OPTARG%%=*}
        OPTARG=${OPTARG#$OPT}
        OPTARG=${OPTARG#=}
    fi
    case $OPT in
        u | up) docker-compose -f $2.yml -p $2 up -d ;; 
        d | down) docker-compose -f $2.yml -p $2 down ;; 
        c | clean) clean vault ;;
        x | exec) docker exec -it $(docker ps | grep $2 | awk "{print \$11}") sh ;; 
        l | log) docker-compose -f $2.yml -p $2 logs -f ;; 
        h | help | ? | *)
            helpHead "scripts/docker-manager.sh"
            helpContent u up "..."
            helpContent d down "..."
            helpContent c clean "..."
            helpContent x exec "..."
            helpContent l log "..."
            helpContent h help "..."
            helpTail
            ;;
    esac
done
shift $((OPTIND-1))