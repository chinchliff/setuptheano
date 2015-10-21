### set configuration variables here

CUDA_IP=54.193.123.144 # public ip of the server
CUDA_USER=ubuntu # user name for logging in to the server
CUDA_PEM=~/cuda_ca.pem # local identity file to use for ssh login

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

### optional additional setup below here

# upload a known private key (used for git stuff)
scp -i $CUDA_PEM resources/id_rsa_cuda $CUDA_USER@$CUDA_IP:~/.ssh/id_rsa

# install other shit
ssh -i $CUDA_PEM $CUDA_USER@$CUDA_IP -- "bash -s" < scripts/setup_other.sh

# run a script to get training datasets too large to be kept in git repos
ssh -i $CUDA_PEM $CUDA_USER@$CUDA_IP -- "bash -s" < scripts/install_test_data_treelearning.sh
