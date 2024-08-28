build:
	@docker build -t contatinhos-api .

run:
	@docker compose up

bash:
	@docker compose exec -it web bash