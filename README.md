## Jenkinsfile Overview

This Jenkinsfile defines a declarative pipeline for building and deploying a Dockerized application. Here's a brief explanation of its functionality:

### Overview:
- **Agent:** The pipeline can run on any available agent.
- **Environment:** Sets the environment variable `DOCKER_IMAGE_NAME` to specify the Docker image name.
- **Parameters:** Allows the user to input a Git commit revision.
- **Tools:** Specifies the Maven tool named 'khaled' to be used.
- **Stages:** Divides the pipeline into several stages:
    1. **Clean Workspace:** Clears the workspace to ensure a clean build environment.
    2. **Checkout Source Code:** Clones the source code repository from the specified URL.
    3. **Write Commit to File:** Writes the Git commit revision to a file named 'commit.txt'.
    4. **Build and Push Docker Image:** Builds the Docker image using the Dockerfile in the 'app' directory, tags it with the Git commit revision, logs in to Docker Hub using provided credentials, and pushes the image to Docker Hub.
    5. **Trigger CD Job:** Triggers a downstream CD job named 'cd' with the Git commit revision as a parameter.

The pipeline integrates with Docker Hub for image management and enables the automation of build, test, and deployment processes.
