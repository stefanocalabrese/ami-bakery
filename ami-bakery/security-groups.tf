resource "aws_security_group" "rdp_sg" {
  name        = "rdp-sg"
  description = "Allow RDP from anywhere, outbound to everywhere"
  vpc_id      = data.aws_vpc.vpc.id

  # Inbound rule: RDP from anywhere (0.0.0.0/0)
  ingress {
    description = "Allow RDP from anywhere (0.0.0.0/0)"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule: Allow all traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rdp-sg"
  }
}

resource "aws_security_group" "packer_sg" {
  name        = "packer-sg"
  description = "Security group for Packer allowing SSH within the VPC"
  vpc_id      = data.aws_vpc.vpc.id

  # Inbound rule: Allow SSH from inside the VPC CIDR block
  ingress {
    description = "Allow SSH from within the VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.vpc.cidr_block]
  }

  # Outbound rule: Allow everything
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # All protocols
    cidr_blocks = ["0.0.0.0/0"] # You can go everywhere out
  }

  tags = {
    Name  = "packer-sg"
    Scope = "Temporary EC2 used by Codebuild to bake the AMI"
  }
}
