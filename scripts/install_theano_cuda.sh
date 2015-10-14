# based on blog post: http://markus.com/install-theano-on-aws/

CUDA_DEB_FILE="cuda-repo-ubuntu1404_7.5-18_amd64.deb"
CUDA_DEB_URL="http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/$CUDA_DEB_FILE"

# install all the dependencies
sudo apt-get install -y gcc g++ gfortran build-essential git wget linux-image-generic libopenblas-dev python-dev python-pip python-nose python-numpy python-scipy

# install the bleeding-edge version of Theano
sudo pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git 

# grab the latest (7.5) cuda toolkit.
sudo wget $CUDA_DEB_URL

# depackage Cuda
sudo dpkg -i $CUDA_DEB_FILE  

# add the package and install the cuda driver (this takes a while)
sudo apt-get update
sudo apt-get install -y cuda  

# update the path to include cuda nvcc and ld_library_path
echo -e "\nexport PATH=/usr/local/cuda/bin:$PATH\n\nexport LD_LIBRARY_PATH=/usr/local/cuda/lib64" >> .bashrc  

# reboot the system for cuda to load
sudo reboot 