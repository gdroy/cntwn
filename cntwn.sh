#!/bin/bash
set -e

if [ ! -d "/cvmfs" ]; then
   echo "ERROR: /cvmfs not detected, this container needs access to CVMFS on the host."
   echo "=============================================================================" 
   echo "Ensure CVMFS is configured and installed on the host and add the following"
   echo "mount option to the docker run command:"
   echo "  -v /cvmfs:/cvmfs"
   exit 1
fi

if [ -z "$1" ]; then
   exec "/bin/bash"
else
   exec "$@"
fi
