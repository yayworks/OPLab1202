
#!/bin/bash
####################################################################################################
#                                                                                                  #
# yb--sw-config.NIMBIX.ppc64le.oplab1202.sh - Software installs & configuration for Ubuntu         #
#                                                                                                  #
# Copyright (C) 2017 Yayworks, Inc. - All Rights Reserved                                          #
#                                                                                                  #
# Last revised 09/17/2017                                                                          #
#                                                                                                  #
####################################################################################################


wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-ppc64le.sh

(
sudo bash Anaconda3-4.4.0-Linux-ppc64le.sh <<EOF

yes
/usr/local/anaconda3
EOF

) > com.out

rm com.out

sudo /usr/local/anaconda3/bin/conda install -c conda-forge jupyterlab <<EOF
y
EOF

###This finally did work

sudo /usr/local/anaconda3/bin/conda create -n tensorflow python=3.6 <<EOF
y
EOF

source /usr/local/anaconda3/bin/activate tensorflow

sudo /usr/local/anaconda3/bin/conda install -c conda-forge tensorflow <<EOF
y
EOF

sudo /usr/local/anaconda3/envs/tensorflow/bin/pip install --upgrade prettytensor
sudo /usr/local/anaconda3/envs/tensorflow/bin/pip install --upgrade gym






exit 0




