# Variables
IMAGE_NAME ?= llm-evaluation-tool

# Build the Docker image
.PHONY: build
build:
	@echo "Building Docker image $(IMAGE_NAME)..."
	docker build -t $(IMAGE_NAME) .

# Setup
.PHONY: setup
setup:
	docker run --rm -it -v $${PWD}:/app -w /app $(IMAGE_NAME) /bin/sh -c "npm install"

# Run the container
.PHONY: run
run:
	docker run --rm -it -d -p 15500:15500 -v $${PWD}:/app $(IMAGE_NAME)
	@CONTAINER_ID=$$(docker ps --filter ancestor=$(IMAGE_NAME) --format "{{.ID}}" | head -n 1); \
	if [ -z "$$CONTAINER_ID" ]; then \
		echo "No running container found for image $(IMAGE_NAME)"; \
		exit 1; \
	else \
		echo "Connecting to container $$CONTAINER_ID..."; \
		docker exec -it $$CONTAINER_ID /bin/sh; \
	fi
