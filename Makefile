CONTAINER_APP=web

setup:
	@docker build -t contatinhos-api .

run:
	@docker compose up

bash:
	@docker compose exec -it $(CONTAINER_APP) bash

attach:
	@docker attach $(CONTAINER_APP)
