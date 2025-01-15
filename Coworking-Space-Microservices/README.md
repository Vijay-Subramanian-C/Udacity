# Enhanced Coworking Space Service Project

## Initial Configuration

To begin the setup process, please follow these steps:

1. **Database Initialization and Setup**:
   - Buid the postgresql database with various configuration using vpc.yaml and vp.yaml files and deployement is done with postgresql-deployment.yaml and
   - postgresql-service.yaml files.
   - Once database is created, tables and data are loaded using sql files in db folder.

2. **Application Configuration**:
   - Application's Dockerfile invloves incorporating runtime variables to configure `DB_USERNAME` and `DB_PASSWORD`. Ensure these credentials are consistent with the ones specified in postgres connection establishment.


## Deployment Pipeline

The merge into the main branch triggers an automated deployment sequence:

1. **AWS CodeBuild Pipeline Setup**:
   - The `buildspec.yml` file execution begins within AWS CodeBuild, processing and deployment for every merge pull request.

2. **Docker Image Repository**:
   - AWS CodeBuild pushes the newly built Docker image to an Amazon ECR repository with BuildNumber as identification.

3. **Kubernetes Deployment**:
   - Utilizing the Image ARN, the `coworking-api.yml` deployment file is updated. This file, alongside the database configuration files, orchestrates the service deployment on Kubernetes.

4. **Service Availability**:
   - The associated pods within the analytics service are initiated, bringing the application online and operational.
5. **Cloudwatch monitoring**:
   - Enabling of cloudwatch to monitor logs and container insights.
     
## Project services involved:
1. Postgres db
2. AWS ECR
3. AWS EKR cluster
4. AWS Codebuild
5. IAM roles
6. Cloudwatch service

**Overall Process Cycle**
Creation of Db -> Loading of data and tables -> Creation of configuration files for application deployment -> Creation of CodeBuild Pipeline -> 
Pusing of images into ECR for every changes -> Use of updated images for updating the deployed application -> Continuous monitoring through Cloudwatch.
