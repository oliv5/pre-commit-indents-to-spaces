# Please type "make help" in your terminal for a list of make targets.

# ITS => Indents To Spaces
# ITS_VENV is the name of directory to store the virtual environment
ITS_VENV ?= .venv
# ROOT_PYTHON is invoked to create the venv
ROOT_PYTHON ?= python3
# ITS_PYTHON is used to invoke packages in the venv
ITS_PYTHON ?= $(ITS_VENV)/bin/python3

.DEFAULT_GOAL:=help

$(ITS_VENV)/bin/activate:
	mkdir -p $(ITS_VENV)
	$(ROOT_PYTHON) -m venv $(ITS_VENV)
	$(ITS_VENV)/bin/pip install -r requirements-dev.txt
	$(ITS_VENV)/bin/pip install -e .

.PHONY: test ## Test the project
test: $(ITS_VENV)/bin/activate
	$(ITS_VENV)/bin/pytest

.PHONY: build ## Build the project for distribution
build: clean $(ITS_VENV)/bin/activate
	$(ITS_PYTHON) -m build

.PHONY: release ## Upload build artifacts to PyPI
release: $(ITS_VENV)/bin/activate
	$(ITS_PYTHON) -m twine upload --repository testpypi dist/*

.PHONY: clean ## Remove project development artifacts
clean:
	rm -rf dist
	rm -rf src/*.egg-info

.PHONY: purge ## Clean + remove caches, virtual environment
purge: clean
	rm -rf src/indents_to_spaces/__pycache__
	rm -rf tests/__pycache__
	rm -rf .pytest_cache
	rm -rf $(ITS_VENV)

.PHONY: help ## List make targets with description
help:
	@printf "\nUsage: make <target>\nExample: make test\n\nTargets:\n"
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) ## \(.*\)/  \1	\2/' | expand -t12
