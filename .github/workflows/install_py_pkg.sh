source_root=$1
cuda_version=$2
gcc_version=$3

conda create -n mink -y -c conda-forge 'python<3.11'

conda activate mink

conda install -y -c pytorch -c nvidia pytorch "pytorch-cuda=$cuda_version"
conda install -y -c anaconda openblas-devel
conda install -y -c conda-forge "gcc=$gcc_version" gxx=$gcc_version"

cd $source_root && python setup.py install --blas_include_dirs=${CONDA_PREFIX}/include --blas=openblas --force_cuda
