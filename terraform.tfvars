
  #use your key
aws-vpc-cidr   = "10.0.0.0/16"

cidrs = {
  public1  = "10.0.1.0/24"
  public2  = "10.0.2.0/24"
  private1 = "10.0.3.0/24"
  private2 = "10.0.4.0/24"

}

db_instance_class = "db.t2.micro"
db_name           = "user"
db_user           = "user"
db-password       = "12345678"
db_bak_retention  = "4"
db_port           = 3306

image_id             = "ami-03af6a70ccd8cb578"
instance_type        = "t2.micro"
bucket_name          = "cloud-avengers-bucket"