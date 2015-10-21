# write the downloading script locally so it can be reused
script='get_test_data_treelearning.sh'
downloadurl='https://www.dropbox.com/sh/t4gj1ivcmwp083e/AAB66yWyv91dSHyMYcjmyXSIa?dl=1'
target='tree_learning_test_data' # the name to use for the dir and the zip file

echo "wget -O $target.zip $downloadurl" > $script
echo "rm -R $target" >> $script
echo "mkdir $target && cd $target && unzip -o ../$target.zip" >> $script
chmod +x $script

# make sure certs are up to date so we can connect to dropbox
sudo update-ca-certificates

# execute the script
./$script