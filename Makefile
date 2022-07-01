PROJECT_NAME := "setup"

help:
	@grep -E '^[0-9a-z.A-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Setup required things
	python3 -m pip install -U -r requirements.txt
	python3 -m pip install -U -r requirements-dev.txt
	ansible-galaxy collection install -U -r collections/requirements.yml
	ansible-galaxy role install -f -r roles/requirements.yml

arch-i3: ## Setup arch-i3 required stuff
	ansible-playbook playbooks/arch-i3.yml --ask-become-pass

arch-headless: ## Setup arch headless required stuff
	ansible-playbook playbooks/arch-headless-vm.yml --ask-become-pass
