cuda_version=$1
gcc_version=$2

conda create -n mink -y -c conda-forge 'python<3.11'

conda activate mink

conda install -y -c pytorch -c nvidia pytorch "pytorch-cuda=$cuda_version"
conda install -y -c anaconda openblas-devel
conda install -y -c conda-forge "gcc=$gcc_version" gxx=$gcc_version"

pip install -U git+https://github.com/NVIDIA/MinkowskiEngine -v \
    --no-deps \
    --config-setting="--install-option=--blas_include_dirs=${CONDA_PREFIX}/include" \
    --config-setting="--install-option=--blas=openblas" \
    --config-setting="--install-option=--force_cuda"
