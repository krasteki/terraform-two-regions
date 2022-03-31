# This repo contains terraform configuration which deploys 3 VMs in 3 different regions.

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