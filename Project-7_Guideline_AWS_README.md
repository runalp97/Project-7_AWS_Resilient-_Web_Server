**🌐 AWS Resilient Web Server Infrastructure (Highly Available & Auto-Healing)**

A fully functional AWS infrastructure built to achieve fault tolerance, scalability, and high availability using Auto Scaling Groups, Load Balancer, VPC, and User Data automation.

📌 Personal project built during AWS practical learning
Purchased personal domain → Used Route 53 for DNS mapping

**Note: the final testing of this project with screenshot ppt file are in the folder named as "final testing" in this repository.**


**🎯 Project Objective**

To deploy a resilient web server architecture on AWS that:

🔹 Automatically replaces failed EC2 instances (auto-healing).

🔹 Scales up/down based on CPU load (Auto-Scaling).

🔹 Uses Load Balancer for traffic distribution.

🔹 Ensures public DNS access using Route 53.

🔹 Delivers web content from an S3 bucket automatically.

🔹 Sends notifications via SNS upon changes.


**🧩 Architecture Overview:**


<img width="420" height="268" alt="image" src="https://github.com/user-attachments/assets/2d2a2fce-21cd-4c34-b44d-6ee988dc7299" />



**🛠️ Tools & Services Used:**


<img width="697" height="546" alt="image" src="https://github.com/user-attachments/assets/b4c32db9-c191-455b-93ad-544eaa094b93" />

**📌 Key Tasks Completed:**

🔹Task 1: S3 Setup

- Created S3 bucket for hosting website content

- Made bucket objects public using bucket policy

- Enabled SNS notifications on new uploads

- Uploaded index.html file

- Verified notification received

🔹Task 2: IAM Role

- Created EC2 role with:

  AmazonS3FullAccess

  CloudWatchFullAccess

- Attached the IAM role to EC2 instances

🔹Task 3: VPC Networking

  Configured custom VPC environment:

  <img width="815" height="365" alt="image" src="https://github.com/user-attachments/assets/369c9e16-c837-4d99-b411-e5e18562eec7" />

🔹Task 4: EC2 Auto Configuration via User Data

  Used User Data to automatically:

  - Install Apache

  - Sync files from S3 bucket

  - Add hostname to webpage

  - User Data script:
-----------------------------------------------------------------------------
    #!/bin/bash
    yum install -y httpd
    sleep 5
    aws s3 sync s3://<your-bucket-name> /var/www/html/ --region us-east-1
    sleep 5
    echo $(hostname) >> /var/www/html/index.html
    service httpd restart
-----------------------------------------------------------------------------


🔹Task 5–7: Auto Scaling Group

- Created Launch Template (AMI: Amazon Linux 2)

- Attached IAM role & User Data

- Created Auto Scaling Group:

    Min 2 | Max 4 instances

    3 subnets for high availability

- Configured CPU-based Scaling Policies

- SNS notifications for scaling alerts

🔹Task 9: Elastic Load Balancer

- Classic Load Balancer configured

- Attached ASG to ELB

- Health checks enabled

- Distributed traffic across multiple EC2 instances

🔹Task 10: Route 53 Custom Domain

- Purchased custom domain name

- Created Hosted Zone in Route 53

- DNS Mapping:

    CNAME → Load Balancer DNS
**
  🧪 Final Testing & Validation:**

🔹Web page loads from two different EC2 instances.

🔹Terminated an instance → Auto healing launched a new one.

🔹Load tested → Scaled to 3 instances automatically.

🔹Domain remained active throughout (zero downtime).

**📸 Screenshots:**

🔹S3 bucket with index file ⬇︎

<img width="1349" height="847" alt="image" src="https://github.com/user-attachments/assets/60aa4298-6e10-46bb-9473-9535d12a7ac1" />


<img width="1103" height="877" alt="image" src="https://github.com/user-attachments/assets/ad6f3aab-6692-40e8-868d-41d3ee3fdad5" />


<img width="1070" height="850" alt="image" src="https://github.com/user-attachments/assets/9d9556c9-e5d8-4fa3-b12b-6e3c2f80ba1a" />


<img width="1471" height="548" alt="image" src="https://github.com/user-attachments/assets/117661cc-6459-4ced-abda-da6bf4f86599" />



🔹VPC + Subnets  ⬇︎


<img width="1408" height="714" alt="image" src="https://github.com/user-attachments/assets/983de8da-de4c-46fd-a1ba-0fad396daa50" />


<img width="1326" height="714" alt="image" src="https://github.com/user-attachments/assets/da4a9f77-a56d-4160-9fcb-67522abfe62c" />



🔹Auto Scaling activity ⬇︎


<img width="1270" height="714" alt="image" src="https://github.com/user-attachments/assets/09874ff8-39f1-44e1-a069-3ad54668eae6" />


<img width="1408" height="714" alt="image" src="https://github.com/user-attachments/assets/6d0d4d6d-9be8-440b-acc4-c7ac702dcbac" />



<img width="1270" height="714" alt="image" src="https://github.com/user-attachments/assets/70bc57c9-d65e-4931-9069-6b488df02bb0" />


<img width="1412" height="714" alt="image" src="https://github.com/user-attachments/assets/e10ebcb8-d936-47d0-ae51-20ef859d24d9" />


<img width="1400" height="714" alt="image" src="https://github.com/user-attachments/assets/1a2f21ae-1354-4da3-b020-25e5e9dd3977" />



🔹Load Balancer healthy targets ⬇︎

<img width="1412" height="714" alt="image" src="https://github.com/user-attachments/assets/c78e8c5d-aa86-4c28-bd7e-6ed5a57e626a" />



<img width="1424" height="714" alt="image" src="https://github.com/user-attachments/assets/136a42cf-526e-4cf3-b547-be00837350b0" />


🔹Browser page showing hostnames ⬇︎

<img width="1270" height="714" alt="image" src="https://github.com/user-attachments/assets/e353b0a9-b629-4a36-8418-9a872fd2dc03" />


<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/660d17a7-01fa-4f66-9151-b487495c8f76" />



🔹Route 53 DNS settings ⬇︎


<img width="1272" height="714" alt="image" src="https://github.com/user-attachments/assets/6e77bfcc-2934-442e-9245-563afe0bdbc4" />


<img width="1270" height="714" alt="image" src="https://github.com/user-attachments/assets/e8e74194-d594-4226-ad19-b6cbb6492bbd" />


<img width="1272" height="714" alt="image" src="https://github.com/user-attachments/assets/1cede040-28b7-484a-a248-7baa5e3db9ec" />


<img width="1270" height="714" alt="image" src="https://github.com/user-attachments/assets/d77ff444-43a6-441a-a2be-7f66c995508a" />




**📌 Conclusion: **

This project helped me gain strong hands-on experience with:

🔹AWS high availability & fault tolerance concepts

🔹Auto Scaling Groups with health checks

🔹Load-balanced architecture with Route 53 DNS mapping

🔹Integrating S3 with automated EC2 configuration using User Data

🔹CloudWatch monitoring & SNS alerts

Result: A self-healing, scalable, and highly available cloud environment — similar to what is used in real production workloads.




