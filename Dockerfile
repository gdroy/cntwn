FROM centos:6

# Install the base WLCG dependecies, along with the VOMS information for the main WLCG experiments
RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install http://linuxsoft.cern.ch/wlcg/sl6/x86_64/wlcg-repo-1.0.0-1.el6.noarch.rpm && \
    yum -y install HEP_OSlibs_SL6 wlcg-voms-atlas wlcg-voms-cms wlcg-voms-lhcb wlcg-voms-ops 

# Install latest stable version of HTCondor
ADD http://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel6.repo /etc/yum.repos.d/htcondor.repo
RUN rpm --import http://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor && \
    yum -y install condor

COPY ./cntwn.sh /

ENTRYPOINT ["/cntwn.sh"]
