# This repo contains terraform configuration which deploys 3 VMs in 3 different regions (eu-west-1, eu-west-2, eu-west-3)

### Prerequisites

- Terraform (version used v1.1.6) - Check [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) for install instructions.
- AWS subscription - Check [here](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all) for AWS Free Tier.
- Before you can build the infrastructure, you need to provide your AWS credentials to Terraform as environment variables. You can create AWS credentials on [this page](https://console.aws.amazon.com/iam/home?#security_credential).

**Note**:Some of the infrastructure in this configuration may not qualify for the AWS free tier. Destroy the infrastructure at the end of the guide to avoid unnecessary charges.

### Setup Instructions


#### I. Clone the repo

```
$ git clone https://github.com/krasteki/terraform-two-regions.git
$ cd terraform-two-regions
```

#### II. Authenticate to AWS

```
$ export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY
$ export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_KEY
```

**Note**: You may need to also export your `AWS_SESSION_TOKEN` and `AWS_SESSION_EXPIRATION` as **environment variables**.

#### III. Run the following commands in the cloned folder:

1. `$ terraform init` - Initializing a configuration directory downloads and installs the providers defined in the configuration, which in this case is the aws provider.
2. `$ terraform fmt` - Automatically updates configurations in the current directory for readability and consistency. Format the configuration. Terraform will print out the names of the files it modified, if any. In this case, the configuration file was already formatted correctly, so Terraform won't return any file names.
3. `$ terraform validate` - Validates the configuration.
4. `$ terraform plan` - Creates an execution plan, which lets you preview the changes that Terraform plans to make to the infrastructure.
5. `$ terraform apply` - Creates the infrastructure.

##### The given output values 

```
Outputs:

ireland-publicDNS = "ec2-54-247-42-250.eu-west-1.compute.amazonaws.com"
ireland-publicIP = "54.247.42.250"
london-publicDNS = "ec2-35-178-154-126.eu-west-2.compute.amazonaws.com"
london-publicIP = "35.178.154.126"
paris-publicDNS = "ec2-13-36-210-123.eu-west-3.compute.amazonaws.com"
paris-publicIP = "13.36.210.123"
```

#### IV.Destroy configuration

`$ terraform destroy`