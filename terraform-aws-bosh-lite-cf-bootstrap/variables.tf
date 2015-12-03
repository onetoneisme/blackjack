variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_jumpbox_ami" {
  default = "ami-d05e75b8"
}

variable "aws_bosh_lite_ami" {
  default = "ami-ec4e3186"
}

variable "bosh_lite_stemcell" {
  default = "https://s3.amazonaws.com/bosh-warden-stemcells/bosh-stemcell-3126-warden-boshlite-ubuntu-trusty-go_agent.tgz"
}

variable "aws_jumpbox_instance_type" {
  default = "m4.large"
}

variable "aws_bosh_lite_instance_type" {
  default = "m3.xlarge"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "jumpbox_name" {
  default = "jumpbox"
}

variable "bosh_lite_box_name" {
  default = "bosh-lite"
}
