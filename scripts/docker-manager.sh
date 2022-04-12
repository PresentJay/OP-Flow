#!/bin/bash

source ./scripts/manager-base.sh
getenv ./environments/manager-config

while getopts hu:c:x:d:l:b:n:-: OPT; do
    if [ $OPT = "-" ]; then
        OPT=${OPTARG%%=*}
        OPTARG=${OPTARG#$OPT}
        OPTARG=${OPTARG#=}
    fi
    case $OPT in
        u | up) docker-compose -f docker/$2.yml -p $2 up -d ;; 
        d | down) docker-compose -f docker/$2.yml -p $2 down ;; 
        c | clean) 
        # TODO: Clean시, network 상관 없이 해당 이름을 가진 volume을 모두 clean함. 개선필요
            target=$(docker volume ls | grep $2 | awk "{print \$2}")
            if [[ -n ${target} ]]; then
                docker volume rm ${target}\
                    && success "volume of ${target} was cleaned !"\
                    || kill "something error was occured while cleaning"
            else
                echo "no container of $2. please confirm!"
            fi
            ;;
        b | build) docker build -t $3/$2 -f ./docker/Dockerfile/$2 . ;;
        n | network) docker network create -d bridge $2 ;;
        x | exec) docker exec -it $(docker ps | grep $2 | awk "{print \$11}") sh ;; 
        l | log) docker-compose -f docker/$2.yml -p $2 logs -f ;; 
        h | help | ? | *)
            helpHead "scripts/docker-manager.sh"
            helpContent b build "..."
            helpContent n network "..."
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