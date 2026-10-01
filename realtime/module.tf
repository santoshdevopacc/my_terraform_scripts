module "instance-module" {
source = "./instance"
ami_id = "ami-0720cb7af233b0529"
itype = "t3.micro"
iname = "server"
icount = 2
}

module "bucket-module"{
source = "./bucket"
bucket_name = "devops123123.accountbucket"
}

module "sg-module" {
source = "./security"
sg_name = "sydeny-sg1"
}

