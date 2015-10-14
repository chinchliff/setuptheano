# based on blog post: http://markus.com/install-theano-on-aws/

# install included samples and test cuda
/usr/local/cuda/bin/cuda-install-samples-7.5.sh ~/
cd NVIDIA\_CUDA-7.5\_Samples/1\_Utilities/deviceQuery  
make  
./deviceQuery

# set up the theano config file to use gpu by default
echo -e "\n[global]\nfloatX=float32\ndevice=gpu\n[mode]=FAST_RUN\n\n[nvcc]\nfastmath=True\n\n[cuda]\nroot=/usr/local/cuda" >> ~/.theanorc
