FROM jsrjsr0040/centos-apm:0.1

RUN yum install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:qwer1234' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"

RUN echo "export VISIBLE=now" >> /etc/profile
EXPOSE 22
CMD ["/sbin/sshd", "-D"]
