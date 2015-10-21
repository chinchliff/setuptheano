sudo apt-get -y install zip
#sudo pip install pandas

echo 'alias ls="ls -lGA"' >> ~/.bashrc

# setup bitbucket
ssh -o StrictHostKeyChecking=no bitbucket.org
git config --global user.name "Cody Hinchliff"
git config --global user.email cody.hinchliff@gmail.com

# get training/analysis scripts
git clone git@bitbucket.org:codyh/seq_learning_sandbox.git
git clone git@bitbucket.org:codyh/treelearning.git