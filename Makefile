all: help

c: create
create: ## create cluster
	time ansible-playbook playbooks/build_eks.yaml

delete: ## delete cluster
	# time ansible-playbook playbooks/delete.yaml
	time ansible-playbook playbooks/destroy_eks.yaml

d: deploy
deploy: ## cluster deployment
	time ansible-playbook playbooks/deploy.yaml

f: fix
fix: ## run pre-commit hooks
	@pre-commit run --all-files

save: ## save work
	git add . ; git commit -am'code updates' ; git pull ; git push

watch: ## run save in tmux
	tmux new-session -s "docs" \; send-keys 'watch make save' C-m \; split-window -v \;

.PHONY: help
help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
