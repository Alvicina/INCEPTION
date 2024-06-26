all:
	@docker compose -f ./srcs/docker-compose.yml up --build #-f sirve para indicar ruta alternativa a un docker-compose

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f ./srcs/docker-compose.yml up --build

clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
#	docker network rm $$(docker network ls -q);\
	rm -rf /home/alvicina/data/wordpress/*;\
	rm -rf /home/alvicina/data/mysql/*;\

.PHONY: all re down clean
