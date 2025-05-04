up:
	@sudo docker compose --env-file .env  --file docker-compose.vs-host.yaml up

down:
	@sudo docker compose --env-file .env  --file docker-compose.vs-host.yaml down
	
build-image:
	@sudo docker build -t vs-host-image -f DockerFile.vs . 