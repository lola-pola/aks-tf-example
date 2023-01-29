# aks-tf-example



az account list

elhayefrat@elhays aks-tf-example % az ad sp create-for-rbac --role="Owner" --scopes="/subscriptions/613ad620-f6ee-4055-bd0a-68a93656bee3"

response:
Creating 'Owner' role assignment under scope '/subscriptions/613ad620-f6ee-4055-bd0a-68a93656bee3'
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "dbb042ce-5a1c-4cc8-90f6-e7e242b2ca4b",
  "displayName": "azure-cli-2023-01-29-07-50-06",
  "password": "J168Q~N1rk5faNi1loR8QgKTXL2V9XIUfELlKbbw",
  "tenant": "228162eb-4233-49b4-8c17-7fab3deb48ca"
}


export ARM_CLIENT_ID="dbb042ce-5a1c-4cc8-90f6-e7e242b2ca4b"
export ARM_SUBSCRIPTION_ID="613ad620-f6ee-4055-bd0a-68a93656bee3"
export ARM_TENANT_ID="228162eb-4233-49b4-8c17-7fab3deb48ca"
export ARM_CLIENT_SECRET="J168Q~N1rk5faNi1loR8QgKTXL2V9XIUfELlKbbw"


terraform init -upgrade

terraform plan


terraform apply -auto-approve 