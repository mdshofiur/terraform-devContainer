.PHONY: init plan

init:
	@echo "Initializing Terraform..."
	@ cd environment/dev
	@terraform init

plan: init
	@echo "Planning Terraform..."
	@ cd environment/dev
	@terraform fmt -recursive
	@terraform plan

apply: plan
	@echo "Applying Terraform..."
	@ cd environment/dev
	@terraform fmt -recursive
	@terraform apply

formate: 
	@echo "Planning Formateing..."
	@terraform fmt -recursive
