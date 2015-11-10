sudo apt-get -y install libhdf5-dev
sudo pip install Cython
sudo pip install h5py

#sudo pip install keras # standard version

# personal fork
git clone git://github.com/chinchliff/keras.git
cd keras
sudo python setup.py install 