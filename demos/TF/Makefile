.DEFAULT_GOAL := help
.PHONY: init plan apply refresh output import

init:
	terraform init 

plan:
	terraform plan \
		-var-file="prod.tfvars" \
		-out "prod.tfplan"

apply: 
	terraform apply prod.tfplan

destroy:
	terraform destroy \
		-var-file="prod.tfvars"

refresh:
	terraform refresh

output:
	terraform output

import:
	terraform import \
		-state tfstate.json \
	  $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
