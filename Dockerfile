FROM          redhat/ubi9
RUN           dnf install mysql git -y
COPY          run.sh /
ENTRYPOINT    ["bash", "/run.sh"]

