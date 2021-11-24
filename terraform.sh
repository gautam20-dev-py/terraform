echo "+++++++++++++++Selected Workspace $1 ++++++++++++++++++"
echo "---------------Switching to $1 ------------------------"

cd $1

terraform init
if [[ $2 == "apply" ]]; then
terraform apply --auto-approve
else
terraform plan
fi