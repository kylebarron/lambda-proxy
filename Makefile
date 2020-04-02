
SHELL = /bin/bash

package:
	docker build --tag lambda-proxy:latest .
	docker run --name lambda-proxy --volume $(shell pwd)/:/local -itd lambda-proxy:latest bash
	docker exec -it lambda-proxy bash '/local/bin/package.sh'
	docker stop lambda-proxy
	docker rm lambda-proxy
