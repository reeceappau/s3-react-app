# React Website on AWS S3 with Terraform and GitHub Actions

This project demonstrates how to build and deploy a React website on AWS S3 using Terraform for infrastructure management and GitHub Actions for continuous deployment.

## Project Overview

- **React App**: Built using Vite for fast development.
- **AWS S3**: Used for static website hosting.
- **CloudFront**: Configured as a CDN for improved performance and global availability.
- **Terraform**: Used to define and provision the AWS infrastructure.
- **GitHub Actions**: Automates the deployment process, triggered by changes to the main branch.

## How It Works

- The React app is built and deployed to an S3 bucket using Terraform.
- CloudFront is used to serve the website with low latency.
- GitHub Actions automates the deployment pipeline, using AWS credentials stored in GitHub Secrets.

## Setup Instructions

1. Clone the repository.
2. Set up the necessary AWS credentials in your GitHub repository secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `DISTRIBUTION_ID`).
3. Modify `terraform.tfvars` to suit your AWS region and bucket names.
4. Push changes to the `main` branch to trigger the deployment.

## Read the Full Documentation

For a detailed explanation of the setup and deployment process, check out the [documentation here](https://blog.reeceappau.com/deploying-a-react-website-on-s3).

## License

This project is licensed under the MIT License.
