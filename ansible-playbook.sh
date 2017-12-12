#! /bin/bash


if [ "$#" -eq 0 ]; then
    echo -e "Script must run with atleast 1 parameter to create ansible roles\nFor example ./ansible-playbook.sh httpd sonar \n"
    exit 1
fi

if [ ! -d "playbook" ]; then
    mkdir -p playbook/roles
    cd playbook    
    touch {main.yml,hosts}
    mkdir -p {group_vars,host_vars,inventories}

    for rolename in "$@"
    do
        mkdir -p roles/$rolename/{tasks,templates,vars,handlers}
        touch roles/$rolename/{tasks,templates,vars,handlers}/main.yml
    done
else
    cd playbook
    for rolename in "$@"
    do
        mkdir -p roles/$rolename/{tasks,templates,vars,handlers}
        touch roles/$rolename/{tasks,templates,vars,handlers}/main.yml
    done
fi
