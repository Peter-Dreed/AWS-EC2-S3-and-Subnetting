# Terraform AWS Nginx Deployment

This repository provisions an Nginx web server on AWS using Terraform. It leverages modular infrastructure-as-code for easy customization and reuse.

## Structure

```
environment/
  dev/
    main.tf
    provider.tf
    variables.tf
    dev.tfvars
    output.tf
    install-nginx.sh
modules/
  network/
    main.tf
    variables.tf
    output.tf
  compute/
    main.tf
    keypair.tf
    variables.tf
    output.tf
```

## Features

- **Modular Design:** Separate modules for network and compute resources.
- **Automated Nginx Setup:** EC2 instance runs a custom script to install and configure Nginx.
- **Outputs:** Instance details and network IDs are exposed as Terraform outputs.

## Usage

### 1. Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS credentials configured (via environment variables or AWS CLI)
- S3 bucket for remote state (see `provider.tf`)

### 2. Configuration

Edit `environment/dev/dev.tfvars` to set your desired instance type and AMI:

```hcl
instance_type = "t2.micro"
ami_id = "ami-084568db4383264d4"
```

### 3. Initialize Terraform

```sh
cd environment/dev
terraform init
```

### 4. Plan and Apply

```sh
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

### 5. Outputs

After apply, Terraform will show:

- EC2 instance ID, public and private IP
- Key pair name
- VPC and subnet IDs

## Customization

- **AMI:** Change `ami_id` in `dev.tfvars` for different OS images.
- **User Data:** Edit `install-nginx.sh` to customize server setup.
- **Network:** Adjust CIDR blocks and subnet settings in `modules/network/main.tf`.

## Files Overview

- [`environment/dev/main.tf`](environment/dev/main.tf): Loads modules and wires variables.
- [`environment/dev/provider.tf`](environment/dev/provider.tf): AWS provider and backend config.
- [`environment/dev/dev.tfvars`](environment/dev/dev.tfvars): Variable values for deployment.
- [`environment/dev/install-nginx.sh`](environment/dev/install-nginx.sh): Script run on EC2 to install Nginx.
- [`modules/network/main.tf`](modules/network/main.tf): VPC, subnet, gateway, and routing.
- [`modules/compute/main.tf`](modules/compute/main.tf): EC2 instance and key pair.

## Example Output

```
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:
instance_id = "i-0d71e90b73162d0bb"
instance_public_ip = "3.87.224.203"
instance_private_ip = "172.31.92.62"
key_name = "peter-balablu"
```

## Security

- Security group allows SSH (port 22) and HTTP (port 80) from anywhere.
- Key pair is generated for SSH access.

## License

See [`modules/compute/.terraform/providers/registry.terraform.io/hashicorp/aws/6.0.0/windows_386/LICENSE.txt`](modules/compute/.terraform/providers/registry.terraform.io/hashicorp/aws/6.0.0/windows_386/LICENSE.txt) and [`modules/compute/.terraform/providers/registry.terraform.io/hashicorp/tls/4.1.0/windows_386/LICENSE.txt`](modules/compute/.terraform/providers/registry.terraform.io/hashicorp/tls/4.1.0/windows_386/LICENSE.txt) for provider licenses.

---
