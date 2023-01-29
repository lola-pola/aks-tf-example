# aks-tf-example


## Prerequisites
```
az account list
export SUBSCRIPTION_ID="TBD"
export SUBSCRIPTION_ID=$(az account set --subscription=$SUBSCRIPTION_ID)
export DATA=$(az ad sp create-for-rbac --role="Owner" --scopes="/subscriptions/$SUBSCRIPTION_ID")
``` 
```
export ARM_CLIENT_ID=$DATA | jq .appId
export ARM_SUBSCRIPTION_ID="SUBSCRIPTION_ID"
export ARM_TENANT_ID=$DATA | jq .tenant
export ARM_CLIENT_SECRET=$DATA | jq .password
```

## Terraform Deployment
```
terraform init -upgrade

terraform plan

terraform apply -auto-approve 
```

## Terraform Destroy
```
terraform destroy -auto-approve
``

## References
https://docs.microsoft.com/en-us/azure/terraform/terraform-backend
