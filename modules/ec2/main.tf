data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

#AIM role
resource "aws_iam_role" "ec2_role" {
  name = "ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "rds_policy" {
  name = "rds_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = ["rds:*"],
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "rds_attachment" {
  policy_arn = aws_iam_policy.rds_policy.arn
  role       = aws_iam_role.ec2_role.name
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}


resource "aws_launch_template" "web" {
  name_prefix   = "${var.project}-lt"
  image_id      = data.aws_ami.ami.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [var.webserver_sg_id]

  user_data = filebase64("${path.module}/run.sh")

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name
  }
}