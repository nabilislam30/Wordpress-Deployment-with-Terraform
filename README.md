# EC2 Wordpress-Deployment

## Introduction
This project aims to deploy a WordPress application on AWS using Terraform as the primary Infrastructure-as-Code tool. It focuses on building and automating a complete cloud environment, covering networking, compute resources, security controls, and application bootstrapping through a modular Terraform architecture.

The deployment provisions:
- Custom VPC.
- A public subnet.
- Internet Gateway with routing.
- Modular security Group design.
- EC2 instance deployed via a resuable module.
- using user_data script to automate wordpress installation.
- Well structured repository with modules, variables, terraform.tfvars and .gitignore

The project itself takes the foundational knowledge of what I learnt from AWS and is implementing it through the end-to-end deployment.

---
## Folder & File Structure

```text
Wordpress-Deployment-with-Terraform/
├─ main.tf                # wires modules together (VPC -> EC2)            
├─ variables.tf           # root inputs (ami_id, instance_type, key_name, my_ip)                  
├─ outputs.tf             # public IP + WordPress URL outputs          
├─ provider.tf            # AWS provider + required_providers  
├─ user_data.sh           # Ubuntu bootstrap script (WordPress install)
├─ terraform.tfvars       # your values (NOT committed)    
└─ modules/
   ├─ vpc/
   │  ├─ main.tf            # VPC, subnet, IGW, route table, SG
   │  ├─ variables.tf       # module inputs (my_ip)
   │  └─ outputs.tf         # vpc_id, public_subnet_id, security_group_id
   └─ ec2/
      ├─ main.tf            # EC2 instance resource
      ├─ variables.tf       # module inputs
      └─ outputs.tf         # public_ip, instance_id
```

#### Deployment

     terraform init
     terraform plan
     terraform apply

---

<img width="1551" height="894" alt="image" src="https://github.com/user-attachments/assets/6c3010cb-401f-473e-bb0c-4ac63d2f7eef" />
