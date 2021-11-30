echo "+++++++++++++++Selected Workspace $1 ++++++++++++++++++"
echo "---------------Switching to $1 ------------------------"

cd $1

terraform init
if [[ $2 == "apply" ]]; then
terraform apply --auto-approve
elif [[ $2 == "destroy"]]; then
echo "Destroying infrastructure, this step is irreversible" 
terraform destroy
else
terraform plan
fi