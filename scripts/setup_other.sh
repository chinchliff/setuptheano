sudo pip install pandas

echo 'alias ls="ls -lGA"' >> ~/.bashrc

ssh -o StrictHostKeyChecking=no bitbucket.org
git config --global user.name "Cody Hinchliff"
git config --global user.email cody.hinchliff@gmail.com
git clone git@bitbucket.org:codyh/seq_learning_sandbox.git
