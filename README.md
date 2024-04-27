# DevOps Project: Kubernetes Deployment with Terraform, Ansible, Jenkins, and ArgoCD

This project aims to deploy a small application using Kubernetes (K8s) orchestrated with Terraform, Ansible, Jenkins, and ArgoCD. The infrastructure is provisioned on AWS, and changes pushed to the Git repository automatically reflect in the production environment.

## Tools Used
- Terraform
- Ansible
- Jenkins
- ArgoCD


## Infrastructure Setup
### Terraform
- Utilized Terraform to provision AWS infrastructure.
- Created custom modules for:
  - Network setup (`network`)
  - Security configurations (`security`)
  - EC2 instance management (`ec2`)
  - EKS cluster creation (`eks`)

1. To configure AWS credentials:
    ```bash
    vim ~/.aws/credentials
    ```

2. To initialize Terraform:
    ```bash
    terraform init
    ```

3. To apply Terraform changes:
    ```bash
    terraform apply -var-file prod.tfvars
    ```

4. To destroy Terraform resources:
    ```bash
    terraform destroy -var-file prod.tfvars
    ```


### Ansible
- Developed Ansible roles for:
  - Docker to push the application image to Docker Hub.
  - kubectl to install kubectl on EC2 instances for EKS management.
  - Jenkins to install Jenkins on EC2 instances for CI pipeline setup.

1. Run ansible
    ```bash
    ansible-playbook -i hosts playbook.yml 
    ```

### Jenkins
- Configured Jenkins as the CI/CD tool.
- Implemented Jenkinsfile to automate CI processes:
  - Building and pushing application images to Docker Hub.
  - Handling GitHub webhooks to trigger pipelines.
  - Managing branches and syncing changes.


### ArgoCD
- Used ArgoCD for continuous deployment (CD).
- Orchestrated CD pipelines to deploy changes from the Git repository to EKS clusters seamlessly.

## Workflow Overview
1. **Infrastructure Setup:**
   - Provision AWS resources using Terraform modules.
   - Configure security settings and networking.
   - Create EKS clusters for K8s orchestration.

2. **CI Pipeline Setup:**
   - Install Jenkins using Ansible.
   - Configure CI pipeline in Jenkinsfile to automate the build and push process to Docker Hub.

3. **CD Pipeline Setup:**
   - Utilize ArgoCD to set up CD pipelines.
   - Automatically deploy changes from the Git repository to the production environment in EKS clusters.

## Usage
1. Clone the repository.
2. Configure AWS credentials.
3. Run Terraform to provision infrastructure.
4. Run Ansible to set up Jenkins and configure roles.
5. Access Jenkins UI to set up CI pipeline.
6. Configure ArgoCD for CD pipeline.
7. Make changes to the application code in the repository.
8. Observe automated build, test, and deployment processes.

