FROM rhel7
LABEL maintainer="Red Hat, Inc."

LABEL com.redhat.component="rhel-tools-container"
LABEL name="rhel7/rhel-tools"
LABEL version="7.8"

LABEL License="GPLv3"

LABEL run="docker run -it --name NAME --privileged --ipc=host --net=host --pid=host -e HOST=/host -e NAME=NAME -e IMAGE=IMAGE -v /run:/run -v /var/log:/var/log -v /etc/machine-id:/etc/machine-id -v /etc/localtime:/etc/localtime -v /:/host IMAGE"

#labels for container catalog
LABEL summary="Provides the latest release of Red Hat Enterprise Linux 7 in a fully featured and supported base image."
LABEL description="The Red Hat Enterprise Linux Atomic Tools Container (RHEL Tools Container) includes hundreds of software tools for troubleshooting and investigating a Red Hat Enterprise Linux Atomic (RHEL Atomic) Host. Designed to run as a privileged container, the RHEL Tools Container allows you to interact directly with the RHEL Atomic Host system to uncover and solve problems. Inside the RHEL Tools Container are popular tools such as strace, kdump, and many others (most of which are not included with RHEL Atomic)."
LABEL io.k8s.display-name="Red Hat Enterprise Linux Tools"
LABEL io.openshift.expose-services=""

RUN INSTALL_PKGS="\
  unzip \
  bash-completion \
  bc \
  bind-utils \
  blktrace \
  crash \
  e2fsprogs \
  ethtool \
  file \
  git \
  glibc-utils \
  hwloc \
  iotop \
  iproute \
  iputils \
  less \
  ltrace \
  mailx \
  net-tools \
  netsniff-ng \
  nmap-ncat \
  numactl \
  numactl-devel \
  parted \
  pciutils \
  psmisc \
  screen \
  strace \
  sysstat \
  tcpdump \
  vim-enhanced \
  xfsprogs \
  " && yum -y install $INSTALL_PKGS && rpm -V --nosize --nofiledigest --nomtime --nomode $INSTALL_PKGS && yum clean all

CMD ["/usr/bin/bash"]
