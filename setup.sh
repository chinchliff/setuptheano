### set configuration variables here

CUDA_IP=127.0.0.1 # public ip of the server
CUDA_USER=ubuntu # user name for logging in to the server
CUDA_PEM=~/cuda.pem # local identity file to use for ssh login

### general setup below here

# update the system
ssh -i $CUDA_PEM $CUDA_USER@$CUDA_IP -- "bash -s" < scripts/update.sh

# install cuda and theano + dependencies
ssh -i $CUDA_PEM $CUDA_USER@$CUDA_IP -- "bash -s" < scripts/install_theano_cuda.sh
sleep 30 # wait for reboot

# test the cuda installation (verify visually that it passed!) and set theano to use cuda by default
ssh -i $CUDA_PEM $CUDA_USER@$CUDA_IP -- "bash -s" < scripts/confirm_cuda.sh

# optionally, install keras
ssh -i $CUDA_PEM $CUDA_USER@$CUDA_IP -- "bash -s" < scripts/install_keras.sh
