# Build the geth project
# see: https://qiita.com/Naomasa/items/ba86646f718d8eacb4b7#2parity%E3%81%AEdocker%E3%82%92%E5%88%A9%E7%94%A8%E3%81%97%E3%81%A6%E7%92%B0%E5%A2%83%E6%A7%8B%E7%AF%89%E3%82%92%E8%A1%8C%E3%81%86

all: init run

init:
	docker pull ethereum/client-go
run:
	docker run -d --name ethereum-node -v ~/ethereum-data:/root \
	  -p 8545:8545 -p 30303:30303 \
	  ethereum/client-go --fast --cache=512
log:
	@echo "\033[0;35mPress Ctrl-C to stop\033[0m"
	docker logs -f ethereum-node
ssh:
	@echo "\033[0;35mRun Geth console >> \\044 geth attach\033[0m"
	docker exec -it ethereum-node sh

.PHONY: init run ssh
