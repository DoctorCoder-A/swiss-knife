DIR_DUMPS=dumps
DIR_BACKUP=dumps/backups
ALL_DIR=dumps/backups
-include projectData
-include projects/.env-${NAME_PROJECT}
-include .env
init: add-project dir-exist 
add: add-project
load: input-project-data backup install import-local reminder
import: input-project-data import-local reminder
install:
	ssh -p ${PORT} ${HOST} mysqldump -u${USER_REMOTE_DB} -p${PASSWORD_REMOTE_DB}  ${NAME_REMOTE_DB} > ${DIR_SCRIPT}/${DIR_DUMPS}/${NAME_DUMP} || @echo 'ошибка при загрузке дампа, возможно неправильные данные, make add-project чтобы снова добавить проект '
import-local: 
	docker exec -i ${CONTAINER_DB} mysql -u${USER_REMOTE_DB} ${NAME_CONTAINER_DB} < ${DIR_SCRIPT}/${DIR_DUMPS}/${NAME_DUMP} || @echo 'ошибка при импорте дампа '
add-project:
	./addedProject.sh
input-project-data:
	 ./input-data-project.sh
dir-exist:
	@if [ ! -d "${DIR_DUMPS}" ]; then\
          mkdir -p ${ALL_DIR};\
 	fi	
backup:
	@if [  -f "${DIR_DUMPS}/${NAME_DUMP}" ]; then\
          mv ${DIR_DUMPS}/${NAME_DUMP} ${ALL_DIR}/${NAME_DUMP_BACKUP}-${NAME_DUMP};\
 	fi
reminder:
	@echo '####script worked success, Do not forget to remember Allah!#####'
test:
	@echo 'test1-----------------------'