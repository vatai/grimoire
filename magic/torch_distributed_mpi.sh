#!/bin/bash
#PJM -L "rscunit=rscunit_ft01,rscgrp=small"
#PJM -L elapse=00:01:00
#PJM -L "node=2"
#PJM -j
#PJM -S

# RUN IT WITH:
# $ pjsub magic.sh

source ~/mytorch/activate.sh
LD_PRELOAD=libtcmalloc.so mpirun -n $PJM_MPI_PROC python3 magic.py

