USER root

RUN curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | sudo apt-key add - \
     && curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/focal.list | sudo tee /etc/apt/sources.list.d/tailscale.list \
     && curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
     && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
     && apt-get update \
     && apt-get install -y tailscale terraform jq \
     && wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux.tar.gz \
     && tar zxf openshift-install-linux.tar.gz openshift-install \
     && mv openshift-install /usr/local/bin/ && rm openshift-install-linux.tar.gz \
     && wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux.tar.gz \
     && tar zxf openshift-install-linux.tar.gz oc kubectl \
     && mv oc kubectl /usr/local/bin/ && rm openshift-client-linux.tar.gz \
     && curl -L https://github.com/derailed/k9s/releases/download/v0.26.0/k9s_Linux_x86_64.tar.gz | tar -C /usr/local/bin -xvz k9s
