set -e                                                    

curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"                                                                                                     
bash Miniforge3-$(uname)-$(uname -m).sh -b -p ./miniforge -f
source miniforge/bin/activate
python -m pip install -r requirements.txt

# optional: prebuild Xsuite's compiled kernels ahead of time (otherwise
# they are built lazily on the first build_tracker() call, a few extra
# seconds on script 01c's first run). Needs the xsuite meta-package, which
# requirements.txt does NOT install by default:
# pip install xsuite
# xsuite-prebuild

# optional: GPU tracking (uncomment the cupy line in requirements.txt too).
# cupy's pip wheel bundles its own CUDA runtime, so a system-wide
# cudatoolkit is normally NOT needed -- only install it if you need to
# compile custom CUDA kernels from source.
# conda install mamba -n base -c conda-forge
# mamba install cudatoolkit=11.8.0