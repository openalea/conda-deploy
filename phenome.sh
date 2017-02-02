# Authors: Christophe Pradal

# Install minimal debian pkgs
apt-get update -yqq  && apt-get install -yqq \
  wget \
  bzip2 \
  git \
  libglib2.0-0 \
  libsm6 \
  libxrender \
  libglu1-mesa

# Configure environment
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# Install Python 2 for Miniconda
wget -O miniconda.sh \
  https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh \
  && bash miniconda.sh -b -p $HOME/miniconda \
&& rm miniconda.sh

export PATH="$HOME/miniconda/bin:$PATH"

# Update conda
conda update -y python conda

# Create an environment
conda create -n adel -y python
source activate adel
# Install openalea
conda install -y -c openalea openalea.sconsx openalea.visualea openalea.components
conda install -y -c openalea vplants.plantgl openalea.mtg


# Install Adel
conda install -y -c r rpy2
conda install -c conda-forge -y numpy scipy pandas matplotlib
conda install -y -c openalea alinea.caribu

pip install git+https://github.com/openalea-incubator/astk.git
pip install git+https://github.com/openalea-incubator/adel.git

# Install Phenomenal
conda install -c menpo mayavi opencv qt==4.8.6 matplotlib networkx scikit-image
conda install nose



