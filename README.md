# Jenkins with Terraform on AWS
> Deploy a Jenkins Master Server securely on AWS Using Terraform for Infrastructure-As-Code(IAC)

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

# Installation
Prerequities of Terraform and AWS
- [Terraform Installed](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [AWS Account](https://aws.amazon.com/console/)
- [AWS-CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- Create or Include an IAM User which has EC2 Instantiation and VPC Security Group Creation policies


### Clone
- Clone this repo to your local machine using `https://github.com/andrewzz310/Jenkins-On-AWS.git`

### Setup
> Verify AWS-CLI is  installed correctly and Configure Credentials (Access/Secret) generated for your IAM User
```shell
$ aws --version
$ aws configure
```

> Verify Terraform is installed correctly, create environment variables for access/secret key from your IAM user and Create Entries for your private parameters in your terraform.tfvars file
```shell
$ terraform --version
$ export AWS_ACCESS_KEY_ID="youraccesskey"
$ export AWS_SECRET_ACCESS_KEY="yoursecretkey"
$ cd Jenkins-On-AWS
$ touch terraform.tfvars
```
Entries for your .tfvars should include the following values for you to fill in:

```hcl
VpcId = ""
VpcCidr = ""
LocalIp = "" #this is your public routable ip CIDR
KeyName = ""
```
### Deployment
> Now we are able to Deploy!
```shell
$ terraform init # run in the root module (same directly where you created your .tfvars file) 
$ terraform plan # You will see a blueprint of the resources to be created/modified/destroyed
$ terraform apply # This will create your EC2 with Jenkins and SG with permissions to connect
```
Note: This next step may take a few minutes depending on how quickly your EC2 installs Java/Jenkins from the bootsrap script.

Verify the deployment by getting the public ip of your recently created ec2 instance.
```sh
aws ec2 describe-instances | PublicIp
```
Alternatively, you may verify the deployment by navigating to the aws console and finding the public ip of your EC2 Jenkins Server and then enter the following into your browser.

```sh
http://publicip:8080
```

## Contributing

- *Fork the Repo*
- Create a new pull request using [https://github.com/andrewzz310/Jenkins-On-AWS/compare](https://github.com/andrewzz310/Jenkins-On-AWS/compare)



License
----

MIT


**Free Software!**
