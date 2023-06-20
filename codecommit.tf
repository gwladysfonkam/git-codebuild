resource "aws_instance" "myinstance" {
  ami = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"
  user_data = <<EOF
        #!/bin/bash
        sudo su
        yum update -y
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
        echo "<<html>
        <head> <title> </title> </head>
        <body bgcolor=green>
        <h1> "This is my Terraform instance" </h1>
        </body>
        </html>" >> /var/www/html/index.html
EOF
}
 