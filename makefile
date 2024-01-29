.PHONY: init plan

init:
	@echo "Initializing Terraform..."
	@terraform fmt -recursive
	@terraform init

plan: init
	@echo "Planning Terraform..."
	@terraform fmt -recursive
	@terraform plan

apply: plan
	@echo "Applying Terraform..."
	@terraform fmt -recursive
	@terraform apply

formate: 
	@echo "Planning Formateing..."
	@terraform fmt -recursive
