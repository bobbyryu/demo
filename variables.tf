variable "aws_region" {
  default = "us-west-1"
}

variable "aws-vpc-cidr" {
}

variable "cidrs" {
  type = map(string)
}

variable "db_instance_class" {
}

variable "db-password"{

}

variable "alarms_email"{

}

variable "image_id"{

}

variable "instance_type"{
    
}