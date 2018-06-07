

default:
	@echo Please check makefile

backup:
	$(eval RUNNING_CONTAINER=$(shell docker ps -q -f label=com.docker.swarm.service.name=nexus_web))
	docker run --rm --volumes-from $(RUNNING_CONTAINER) -v $(PWD):/backup ubuntu tar cjvf /backup/backup.tar.bz2 /nexus-data

deploy:
	docker stack deploy nexus -c docker-stack.yml

clean:
	docker stack rm nexus


