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