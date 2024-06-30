DOCKER_CONTAINER_NAME=media-server
FOLDER_WEB=media-server
PATH_FOLDER_WEB=/tmp/$(FOLDER_WEB)

create-files:
	mkdir -p $(PATH_FOLDER_WEB)
	cp src/index.html $(PATH_FOLDER_WEB)/

run-docker:
	docker run --rm -d -v $(PATH_FOLDER_WEB):/usr/share/nginx/html:ro -p 8080:80 --name $(DOCKER_CONTAINER_NAME) nginx

stop-docker:
	docker stop $(DOCKER_CONTAINER_NAME)

open-browser:
	firefox http://localhost:8080/index.html

run: create-files \
	run-docker \
	open-browser

stop: stop-docker
