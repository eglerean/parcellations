# All data from https://ccraddock.github.io/cluster_roi/atlases.html
echo mkdir -p Craddock2011
mkdir -p Craddock2011
echo wget -O Craddock2011/craddock_2011_parcellations.tar.gz https://www.nitrc.org/frs/downloadlink.php/3720
# wget -O Craddock2011/craddock_2011_parcellations.tar.gz https://www.nitrc.org/frs/downloadlink.php/3720
echo tar xvfz Craddock2011/craddock_2011_parcellations.tar.gz -C Craddock2011
tar xvfz Craddock2011/craddock_2011_parcellations.tar.gz -C Craddock2011
