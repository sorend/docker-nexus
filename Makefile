

default:
	@echo Please check makefile

deploy:
	docker stack deploy nexus -c docker-stack.yml

clean:
	docker stack rm nexus


