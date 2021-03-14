FROM	debian

RUN	apt-get update && apt-get install -y gnupg2

RUN	echo 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main' >> /etc/apt/sources.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
	&& apt-get update && apt-get install -y \
	git \
	python3-pip \
	openssh-client \
	python3-dev \
	ruby \
	curl \
	ansible

ENV	HOME	/root
RUN	ssh-keygen -f /root/.ssh/id_rsa -q -N "" \
	&& pip3 install markupsafe linode-api4

WORKDIR	/root

RUN	git clone https://github.com/jlund/streisand.git

WORKDIR	/root/streisand

CMD	["./streisand"]
