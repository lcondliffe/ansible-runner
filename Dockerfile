FROM ansible/ansible-runner

LABEL name="uod-ansible-runner"

# Git
RUN yum install git -y &&\
    yum clean all

#PIP
RUN pip3 install --upgrade pip

# VMware Automation SDK
RUN pip3 install --upgrade pip setuptools &&\
    pip3 install --upgrade git+https://github.com/vmware/vsphere-automation-sdk-python.git

# PywinRM
RUN pip3 install pywinrm==0.4.1 &&\
    pip3 install pywinrm[credssp]

# Infoblox Client
RUN pip3 install infoblox-client --ignore-installed PyYAML

# Tower CLI
RUN pip3 install ansible_tower_cli

VOLUME /runner

ENV HOME=/runner

WORKDIR /runner

ENTRYPOINT ["entrypoint"]
CMD ["ansible-runner", "run", "/runner"]