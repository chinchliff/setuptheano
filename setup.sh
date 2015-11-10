CUDA_PEM=$1 # pass in location to identity file for ssh login 
CUDA_USER_AT_DOMAIN=$2  # pass in login information for server, e.g. ubuntu@127.0.0.1

### general setup below here

# update the system
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN -- "bash -s" < scripts/update.sh

# install cuda and theano + dependencies
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN -- "bash -s" < scripts/install_theano_cuda.sh
sleep 60 # wait for reboot

# test the cuda installation (verify visually that it passed!) and set theano to use cuda by default
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN -- "bash -s" < scripts/confirm_cuda.sh

# install keras
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN -- "bash -s" < scripts/install_keras.sh

# upload a known private key (used for git stuff)
scp -i $CUDA_PEM private_resources/id_rsa_cuda $CUDA_USER_AT_DOMAIN:~/.ssh/id_rsa

# set up aws credentials
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN "mkdir ~/.aws"
scp -i $CUDA_PEM private_resources/credentials $CUDA_USER_AT_DOMAIN:~/.aws/credentials
scp -i $CUDA_PEM private_resources/config $CUDA_USER_AT_DOMAIN:~/.aws/config

# install other shit
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN -- "bash -s" < scripts/setup_other.sh

# run scripts to get training datasets too large to be kept in git repos
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN -- "bash -s" < scripts/install_test_data_treelearning.sh
ssh -i $CUDA_PEM $CUDA_USER_AT_DOMAIN -- "bash -s" < scripts/install_test_data_seqlearning_phlawdruns_2012.sh