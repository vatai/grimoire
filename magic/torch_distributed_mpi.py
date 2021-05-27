#!/usr/bin/env python

"""run.py:"""
# import os
import torch
import torch.distributed as dist

# from torch.multiprocessing import Process




# def init_process(rank, size, fn, backend="gloo"):
#     """Initialize the distributed environment."""
#     # os.environ['MASTER_ADDR'] = '127.0.0.1'
#     # os.environ['MASTER_PORT'] = '29500'
#     dist.init_process_group(backend, rank=rank, world_size=size)
#     # dist.init_process_group(init_method="mpi://", backend=backend, rank=rank, world_size=size)
#     # fn(rank, size)


if __name__ == "__main__":
    available = dist.is_mpi_available()
    print(f"mpi available: {available}")
    # init_process(-1, -1, run, backend="mpi")
    dist.init_process_group("mpi")
    print(f"RANK: {dist.get_rank()}, SIZE: {dist.get_world_size()}")
