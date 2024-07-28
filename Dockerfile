FROM          redhat/ubi9
ADD           mongo.repo /etc/yum.repos.d/mongo.repo
RUN           dnf install mysql git mongodb-org -y
COPY          run.sh /
ENTRYPOINT    ["bash", "/run.sh"]

