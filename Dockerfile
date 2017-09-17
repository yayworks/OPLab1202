FROM ipoddaribm/powerai-examples

WORKDIR /root

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    wget && \
    apt-get install -y python3.4 && \
    apt-get install -y python3-pip && \
    apt-get install -y nodejs-legacy && \
    apt-get install -y npm && \
    npm install -g configurable-http-proxy && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
RUN pip3 install virtualenv && \
    pip3 install jupyterhub && \
    pip3 install --upgrade zmq && \
    pip3 install --upgrade notebook


ADD ./yb-sw-config.NIMBIX.ppc64le.oplab1202.sh /tmp/yb-sw-config.NIMBIX.ppc64le.oplab1202.sh
RUN /bin/bash -x /tmp/yb-sw-config.NIMBIX.ppc64le.oplab1202.sh 


ADD ./jupyterhub_config.py /usr/local
ADD ./jpy_lab_start.sh /usr/local/jpy_lab_start.sh
##RUN chmod +x /usr/local/jpy_lab_start.sh && \
    
##    wget -O- -q http://s3tools.org/repo/deb-all/stable/s3tools.key | sudo apt-key add - && \
##    sudo wget -O/etc/apt/sources.list.d/s3tools.list http://s3tools.org/repo/deb-all/stable/s3tools.list && \
##    sudo apt-get update && \
##    sudo apt-get install s3cmd && \
##    sudo apt-get install -y gfortran && \
##    sudo apt-get update && \

##    /usr/local/anaconda3/envs/tensorflow/bin/pip install numpy scipy && \
##    /usr/local/anaconda3/envs/tensorflow/bin/pip install scikit-learn && \
##    /usr/local/anaconda3/envs/tensorflow/bin/pip install pillow && \
##    /usr/local/anaconda3/envs/tensorflow/bin/conda install h5py && \
##    /usr/local/anaconda3/envs/tensorflow/bin/pip install keras && \
##    /usr/local/anaconda3/envs/tensorflow/bin/pip install gensim && \
##    /usr/local/anaconda3/envs/tensorflow/bin/pip install theano && \
##    /usr/local/anaconda3/envs/tensorflow/bin/pip install tensorboard

RUN echo 'export PATH=/usr/local/cuda/bin:/usr/local/anaconda3/envs/tensorflow/bin:$PATH' >> /home/nimbix/.bashrc \
&&  echo 'export PYTHONPATH=/usr/local/anaconda3/envs/tensorflow/lib/python3.6:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/prettytensor-0.7.2-py3.6.egg:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/enum34-1.1.6-py3.6.egg:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/matplotlib:$PYTHONPATH' >> /home/nimbix/.bashrc \
&&  echo 'export PATH=/usr/local/cuda/bin:/usr/local/anaconda3/envs/tensorflow/bin:$PATH' >> /etc/skel/.bashrc \
&&  echo 'export PYTHONPATH=/usr/local/anaconda3/envs/tensorflow/lib/python3.6:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/prettytensor-0.7.2-py3.6.egg:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/enum34-1.1.6-py3.6.egg:/usr/local/anaconda3/envs/tensorflow/lib/python3.6/site-packages/matplotlib:$PYTHONPATH' >> /etc/skel/.bashrc
    
##WORKDIR /home/nimbix
##RUN /usr/bin/wget https://s3.amazonaws.com/yb-lab-cfg/admin/yb-admin.NIMBIX.pwr8.tar \
##&& tar xvf yb-admin.NIMBIX.pwr8.tar -C /usr/bin \
##&& sudo apt-get install -y tcl \
##&& sudo apt-get install -y git 
    
EXPOSE 8888
    

ADD ./NAE/help.html /etc/NAE/help.html
