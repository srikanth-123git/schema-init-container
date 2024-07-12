FROM          redhat/ubi9
RUN           dnf install mysql -y
COPY          run.sh /
ENTRYPOINT    ["bash", "/run.sh"]

