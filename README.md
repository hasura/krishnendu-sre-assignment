# assignment
Terraform Stack for  EKS cluster..
cd eks-tf-stack/terraform-eks-cluster
terraform init
terraform plan
terraform apply
(s3 bcakend configured for state and dynamodb configured for locking)


Charts(env-echo)
cd problem-1/
helm install env-echo-charts   env-echo-charts --values ./env-echo-charts/values.yaml

Charts(Ingress Nontroller):
cd problem-1/ingress-controller-charts/kubernetes-ingress/deployments/helm-chart
helm install my-release . --namespace nginx-ingress
