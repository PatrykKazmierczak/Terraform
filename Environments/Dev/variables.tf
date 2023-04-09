variable "ec2_instance_type" {
    type = string
    default = "t2.micro"

}
variable "ec2_instance_name"{
    type = string

}
variable "number_of_instances" {
    type = number

}
variable "region" {
    type = "eu-central-1"
  
}
variable "ec2_ami_id" {
    type = string
  
}