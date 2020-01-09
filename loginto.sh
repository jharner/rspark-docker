#!/bin/bash
echo "\n"

PS3='Choose a container to log in to: '
options=("rstudio" "hadoop" "postgres" "hive" "cancel" )
select opt in "${options[@]}"
do
    case $opt in
        "rstudio")
            docker exec -ti rspark-docker_rstudio_1 bash
            break
            ;;
        "hadoop")
            docker exec -ti rspark-docker_hadoop_1 bash
            break
            ;;
        "postgres")
            docker exec -ti rspark-docker_postgres_1 bash
            break
            ;;
        "hive")
            docker exec -ti rspark-docker_hive_1 bash
            break
            ;;
        "cancel")
            break
            ;;
        *) echo invalid option;;
    esac
done