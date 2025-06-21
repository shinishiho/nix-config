# Cloud development tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # AWS tools
    awscli2
    aws-sam-cli
    
    # Google Cloud
    google-cloud-sdk
    
    # Azure
    azure-cli
    
    # Infrastructure as Code
    terraform
    terragrunt
    ansible
    
    # Serverless frameworks
    # serverless
    
    # Multi-cloud tools
    # pulumi
    # crossplane-cli
    
    # Cloud-native development
    # skaffold
    # tilt
    # devspace
  ];
}
