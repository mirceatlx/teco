#!/bin/bash
#SBATCH -J bigrun
#SBATCH -n 1
#SBATCH -p gpu
#SBATCH -t 5-00:00:00
#SBATCH --cpus-per-task 18 
#SBATCH --gpus 4
#SBATCH --mail-type=END
#SBATCH --mail-user=mlica@tudelft.nl
#SBATCH --mem=60G


module load 2021
module load Miniconda3/23.5.2-0
conda init
source activate teco
module load CUDA/11.3.1
#conda install -y cudatoolkit=11.3 cudnn --yes

#Loading modules

DATA_DIR=/projects/0/prjs0951/teco/bigrun python scripts/train.py -o /projects/0/prjs0951/teco/bigrun -c configs/dmlab.yaml -i bigrun \
> 'logs/teco_bigrun.out' 2> 'logs/teco_bigrun.err'
