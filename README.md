# Zarektronix
This is a sample application built from flask.
**Prerequisites:**
1. Azure DevOps Account:
Access to Azure DevOps or Azure DevOps Server.
Project creation permissions.
2. Code Repository:
Source code hosted in a repository (GitHub, Azure Repos, Bitbucket, etc.).
3. Azure Resources:
Resources required for deploying the application (Azure App Service, Azure Kubernetes Service, etc.).
Necessary service connections or permissions to access Azure resources.
4. Azure Pipeline Configuration:
Understand YAML-based Azure Pipeline configuration.

**Steps to create the pipeline**
1. First, you should know where or which repo is used to manage the application and in what language the application is written.
   By default, Azure DevOps provides a repo, but we can use github, gitlab, etc.
   Then have a rough idea about the stages to be implemented, like build, test, static code analysis, converting the app into an image, pushing the image, and deploying the image into
   AKS or web apps.
2. Decide on the type of worker node needed based on the application, which can be Ubutnu, Centos, etc.
3. Try to build the pipeline stage by stage and make sure there is connectivity established between the components.
   a) First, select the target repo and which branches the pipeline should monitor for changes.
   b) Then create the first stage, i.e., the build and test stage. If you are using an application written in a compiler language, then you need to use build tools to convert it into an
      artifact and do the testing, but now we are using an application that is written in an interpreter language. So you can directly run the application and test it.
4. After successfully completing the build and test stages, we can move on to the image building of the application using Dockerfile and push the image to the ACR.
5. Then we should make sure the image is not vulnerable to any attacks. For that, we can use Trivy to check the vulnerabilities. Only after we find out that there are no major
   vulnerabilities can we move forward. I have used the manifests file to deploy the Kubernetes objects.
6. The next stage is to push the image directly to the staging area, i.e., the Kubernetes cluster. Then the final testing is performed by QA, performance testers, etc.
7. After all the final testing is done, we can proceed with the deployment of the application in the production environment, but I have added a brake there, i.e., we need approval
   from the PM or the DevOps architect to proceed with the deployment.
