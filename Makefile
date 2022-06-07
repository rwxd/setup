PROJECT_NAME := "setup"

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Setup required things
	@python3 -m pip install -r requirements.txt
	@python3 -m pip install -r requirements-dev.txt
	@ansible-galaxy collection install -r collections/requirements.yml
	@ansible-galaxy role install -r roles/requirements.yml
