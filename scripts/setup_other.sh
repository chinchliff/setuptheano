sudo apt-get -y install zip

echo 'alias ls="ls -lGA"' >> ~/.bashrc
echo 'export PYTHONPATH=/home/ubuntu/kerasutils:$PYTHONPATH' >> ~/.bashrc

# setup bitbucket
ssh -o StrictHostKeyChecking=no bitbucket.org
ssh -o StrictHostKeyChecking=no github.com

# credentials for signing git commits
git config --global user.name "Cody Hinchliff"
git config --global user.email cody.hinchliff@gmail.com

# get training/analysis scripts
git clone git@bitbucket.org:codyh/seqlearning.git
git clone git@bitbucket.org:codyh/treelearning.git
git clone git@github.com:chinchliff/kerasutils.git

# install aws command line tools
sudo pip install awscli