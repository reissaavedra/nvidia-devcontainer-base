# Build the project for production
build:
	pip3 install -U pip setuptools
	poetry install --no-dev --all-extras

# Build the project for development
build-dev:
	pip3 install -U pip setuptools
	poetry install --all-extras
