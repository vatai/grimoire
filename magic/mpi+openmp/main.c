#include <assert.h>
#include <mpi.h>
#include <omp.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
  int provided;
  MPI_Init_thread(&argc, &argv, MPI_THREAD_FUNNELED, &provided);

  int rank, size;
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  assert(provided == MPI_THREAD_FUNNELED);

  omp_set_num_threads(2);
  int N = 10;

#pragma omp parallel for
  for (int i = 0; i < N; ++i) {
    int tid = omp_get_thread_num();
    int num_thrd = omp_get_num_threads();
    printf("%d/%d (on %d/%d)\n", tid, num_thrd, rank, size);
    fflush(stdout);
  }

  printf("Done! %d/%d\n", rank, size);
  MPI_Finalize();
  return 0;
}
