FROM          redhat/ubi8
ADD           mongo.repo /etc/yum.repos.d/mongo.repo
RUN           curl -L -O https://cdn.mysql.com/archives/mysql-8.3/mysql-8.3.0-1.el8.x86_64.rpm-bundle.tar && tar -xf mysql-8.3.0-1.el8.x86_64.rpm-bundle.tar
RUN           dnf install mysql-community-client-8.3.0-1.el8.x86_64.rpm mysql-community-client-plugins-8.3.0-1.el8.x86_64.rpm mysql-community-libs-8.3.0-1.el8.x86_64.rpm  mysql-community-common-8.3.0-1.el8.x86_64.rpm  git mongodb-org-shell -y
RUN           rm -f *.tar *.rpm
COPY          run.sh /
ENTRYPOINT    ["bash", "/run.sh"]


