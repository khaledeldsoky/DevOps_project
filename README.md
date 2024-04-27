## Installation of ArgoCD

To deploy ArgoCD, follow these steps:

1. Install ArgoCD by following the instructions provided in the [official documentation](https://www.digitalocean.com/community/tutorials/how-to-deploy-to-kubernetes-using-argo-cd-and-gitops).

2. Check the status of nodes using the following command:
    ```bash
    kubectl get nodes
    ```

3. Create a namespace for ArgoCD:
    ```bash
    kubectl create namespace argocd
    ```

4. Apply the ArgoCD installation manifest:
    ```bash
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
    ```

5. Watch the pods until all components are running:
    ```bash
    watch kubectl get pods -n argocd
    ```

6. Patch the ArgoCD server service to use a LoadBalancer:
    ```bash
    kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
    ```

7. Forward the ArgoCD server port:
    ```bash
    kubectl port-forward svc/argocd-server -n argocd 8081:443
    ```

8. Open port 8081 in the security group associated with your cluster.

9. Retrieve the initial admin password for ArgoCD:
    ```bash
    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
    ```

After completing these steps, you can access ArgoCD using the provided credentials. Then, navigate to the LoadBalancer endpoint on port 8081 to begin managing your Kubernetes clusters.

- ArgoCD simplifies Kubernetes deployment by automating the synchronization of cluster state with Git repositories.
- Ensure proper security measures are taken when opening ports and managing access to ArgoCD.
