docker build -t khaledmohamedatia/app . 
docker run -itd --name app -p 8087:80 khaledmohamedatia/app

docker exec -it jenkins bash

# ----------------------------- jenkins ----------------------------- #

    ع سيرفر الجينكز  java خالي بالك لازم تحمل 
    jenkins file   يرده خالي بالك من 
        maven اسم ال 
        credentials بتاعه ال id  من ال 
        slave و من اسم ال 
----------------------------------------

creditials kind

    github token ==  Username with password(token)
        username == github username
        setting => Developer setting => personal access token => tokens
    ----------------------------------------
    docker as slaves  ==  SSH Username with private key
        username = jenkins
    ----------------------------------------
    dockerhub == Username with password
        username == dockerhub name
    ----------------------------------------
    slack ==  Secret text
    ----------------------------------------
    ec2 as slaves == SSH Username with private key

# ----------------------------- jenkins and github ----------------------------- #
github webhook for jenkins
    https://www.blazemeter.com/blog/how-to-integrate-your-github-repository-to-your-jenkins-project  

# ----------------------------- jenkins and kubernetes ----------------------------- #

    https://medium.com/@harik8/jenkins-cd-on-kubernetes-854dcaf3a40a

# ----------------------------- CI / CD ----------------------------- #

؟ CD عن ال  CI ليه نفصل  
    ! من الاول  CI/CD ليه اعمل ال  k8s  لو حبيت اغير حاجه ف 
    بس وكدا و هنكون وفرنا وقتcd  و نعمل ال  cd  و نغير ف ال  ci  منفصله عن  cd  عشان كدا نخلي  
    و دا شئ مش كويس creditials  كمان كدا الجينكز هيبقا فيه كل ال 

CI/CD tools
    jenkins 
    gitlab
    github action
    travis

CD tools
    argo 
    flux 
    spinnaker

# ----------------------------- Iac ----------------------------- #
Iac configration
    ansible
    chef 
    Puppet

# ----------------------------- kubernetes ----------------------------- #

kubectl get scv -n argocd

kubectl get secrets -n argocd
kubectl get secrets argocd-initial-admin-secret -n argocd
kubectl get secrets argocd-initial-admin-secret -n argocd -o yaml

password: U1Bnc3NWTG9zSjBoWGkzTg==
echo U1Bnc3NWTG9zSjBoWGkzTg | base64 --decode


# install bash-completion
sudo apt-get install bash-completion

# Add the completion script to your .bashrc file
echo 'source <(kubectl completion bash)' >>~/.bashrc

# Apply changes
source ~/.bashrc

# ----------------------------- docker ----------------------------- #

run jenkins container
        docker run -itd  --name jenkins -v /mnt/linux/data/project/devops_1/jenkins:/var/jenkins_home:Z -v /var/run/docker.sock:/var/run/docker.sock:Z -p 8001:8080 -p 50000:50000  jenkins_docker_client_im

# ----------------------------- eks_cluster ----------------------------- #
aws configure
vim ~/.aws/credentials 
aws eks update-kubeconfig --region us-east-1 --name eks_cluster 

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
kubectl get svc
kubectl create -f k.yml 
kubectl apply -f k.yml
    مره  image غير ال 
kubectl get svc -o wide
kubectl describe svc nginx-elb 
#------------#
kubectl annotate svc nginx-elb  "service.beta.kubernetes.io/aws-load-balancer-internal"="true" 
    error load balancer ping 
        https://pet2cattle.com/2021/02/aws-eks-could-not-find-any-suitable-subnets
#------------#

# ----------------------------- argo cd ----------------------------- #
install argocd
    https://www.digitalocean.com/community/tutorials/how-to-deploy-to-kubernetes-using-argo-cd-and-gitops

kubectl get nodes
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
watch kubectl get pods -n argocd
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl port-forward svc/argocd-server -n argocd 8081:443
    افتح بورت 8081 فالسيكورتي جروب
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
    argo و هو هيطلعلك ال  eks  روح بقا ع اللود بلانسر يتاع ال 

--  مش هيعملها هيشتغل ع الي ف الربو cluster هي الكود الاصلي , بمعني لو حد غير حاجه ف ال  git repo اهم حاجه بالنسبه ليه هي ال 
        overwrite طبعا ف اوبشن جوا الارجو انك تخلي التغير ف الكلاستر يعمل 
--  بيخليني اقدر اراقب حاله الكلاستر الي الجينكز مش بيثدر يوفرها

# ----------------------------- git ----------------------------- #
 قديم  commit  عشان ترجع ل 
    git checkout <branch>
    git reset --hard <old commit hash>

