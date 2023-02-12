CUR_DIR = $(CURDIR)
IMAGE_NAME = dev-cli-php81

build:
	docker build -t $(IMAGE_NAME) .

shell:
	docker run -it --rm -v $(CUR_DIR)/src:/app $(IMAGE_NAME) bash
