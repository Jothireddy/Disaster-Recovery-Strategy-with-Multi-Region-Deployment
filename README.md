# Disaster Recovery Strategy with Multi-Region Deployment

This project demonstrates a disaster recovery (DR) strategy for cloud infrastructure using AWS services. The solution leverages:

- **AWS RDS Multi‑AZ:** Provides high availability by replicating your database across multiple Availability Zones.
- **AWS CloudFront:** Distributes content globally for low‑latency delivery and acts as an edge for failover.
- **AWS Route 53:** Configures DNS failover routing with health checks to automatically route traffic to a DR endpoint if the primary becomes unhealthy.

All resources are provisioned using Terraform, enabling version control and reproducibility. This project serves as a template that can be extended for full multi‑region deployments.

## Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup & Deployment](#setup--deployment)
- [Configuration Details](#configuration-details)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## Overview

This DR strategy ensures business continuity by:
- Deploying an RDS instance in Multi‑AZ mode to protect against data center (AZ) failures.
- Distributing your application globally with CloudFront.
- Leveraging Route 53 failover routing to automatically redirect traffic from the primary endpoint to a DR endpoint if necessary.

## Architecture

1. **AWS RDS Multi‑AZ:** Provides high availability for your database.
2. **AWS CloudFront:** Two CloudFront distributions are configured: one for the primary environment and one for the DR environment.
3. **AWS Route 53:** Health checks monitor the primary endpoint. Failover DNS records ensure that if the primary becomes unhealthy, traffic is routed to the DR CloudFront distribution.

## Project Structure

disaster-recovery-dr/ ├── README.md ├── terraform/ │ ├── provider.tf │ ├── variables.tf │ ├── main.tf │ ├── rds.tf │ ├── cloudfront.tf │ ├── route53.tf │ └── outputs.tf └── scripts/ └── deploy.sh


## Prerequisites

- An AWS Account with permissions to create RDS, CloudFront, and Route 53 resources.
- [Terraform](https://www.terraform.io/downloads.html) (v1.0+ recommended)
- AWS CLI configured with your credentials.
- Git for version control.

## Setup & Deployment

1. **Clone the repository:**
 ```bash
   git clone <repository_url>
 ```
Configure Variables: Edit terraform/variables.tf to set your preferred AWS region, domain names, and other parameters (e.g., primary and DR endpoints).

Deploy Infrastructure: Use the deployment script:
```
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```
This will initialize Terraform, create your RDS instance in Multi‑AZ mode, deploy CloudFront distributions, and configure Route 53 health checks and failover records.

Review Outputs: Terraform will output key resource information such as the RDS instance identifier, CloudFront distribution domain names, and Route 53 record details.

## Configuration Details
RDS (rds.tf): Configured with multi_az = true to ensure high availability.
CloudFront (cloudfront.tf): Two distributions are created. You can customize origins to point to your application endpoints.
Route 53 (route53.tf): Health checks monitor the primary CloudFront distribution and route traffic to the secondary (DR) distribution if needed.
## Troubleshooting
Terraform Errors: Verify your AWS credentials, region settings, and that resource names are unique.
RDS Issues: Check the RDS console for instance health and Multi‑AZ status.
CloudFront and Route 53: Use AWS Console to verify that health checks are passing and that DNS records are configured correctly.
Contributing
Contributions are welcome! Please fork the repository, make your changes, and open a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

Happy DR planning and deployment!
