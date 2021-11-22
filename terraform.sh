echo "+++++++++++++++Selected Workspace $1 ++++++++++++++++++"
echo "---------------Switching to $1 ------------------------"

cd $1

terraform init
terraform apply
