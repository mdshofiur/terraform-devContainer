.PHONY: init plan

init:
	@echo "Initializing Terraform..."
	@terraform init

plan: init
	@echo "Planning Terraform..."
	@terraform fmt -recursive
	@terraform plan

apply:
	@echo "Applying Terraform..."
	@terraform fmt -recursive
	@terraform apply --auto-approve

formate: 
	@echo "Planning Formateing..."
	@terraform fmt -recursive
