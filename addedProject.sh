FILE=projects/
if test -f "$FILE"; then
    echo "$FILE exists."
fi
echo 'enter new project name (project)'

read project_name

echo 'enter ssh host (user@127.0.0.0)' 

read host_ssh

echo 'enter ssh port (22)'

read port_ssh

echo 'enter database name from server (project-baza)' 

read name_db_remote

echo 'enter database username from server (user)'

read user_db_remote

echo 'enter database password from server (********)'

read password_db_remote

echo 'enter a name for new dumps (project.sql)'

read name_dump

echo '************remote data setup completed******************'

echo 'enter database container name (container-db)'

read container_db

echo 'enter database name from docker container (project)'

read name_db_container

echo 'enter database username from docker container (user)'

read user_db_container

echo 'enter database password from docker container (********)'

read password_db_container

touch projects/.env-$project_name

echo "HOST=$host_ssh
PORT=$port_ssh
NAME_REMOTE_DB=$name_db_remote
USER_REMOTE_DB=$user_db_remote
PASSWORD_REMOTE_DB=$password_db_remote
NAME_DUMP=$name_dump
NAME_CONTAINER_DB=$name_db_container
USER_CONTAINER_DB=$user_db_container
PASSWORD_CONTAINER_DB=$password_db_container
CONTAINER_DB=$container_db" > projects/.env-$project_name

echo '************ locale data setup completed******************'
echo '@run please  command:   make load'