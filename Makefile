

default:
	@echo Please check makefile

restore:
	docker run --rm -v nexus_nexus-data:/nexus-data -v $(PWD):/backup ubuntu tar xjvf /backup/backup.tar.bz2 -C / 

backup:
	$(eval RUNNING_CONTAINER=$(shell docker ps -q -f label=com.docker.swarm.service.name=nexus_web))
	docker run --rm --volumes-from $(RUNNING_CONTAINER) -v $(PWD):/backup ubuntu tar cjvf /backup/backup.tar.bz2 /nexus-data

deploy:
	docker stack deploy nexus -c docker-stack.yml

clean:
	docker stack rm nexus


