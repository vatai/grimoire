#include <cblas.h>
#include <stdio.h>
#include <stdlib.h>

// double r2() { return (double)rand() / (double)RAND_MAX; }
double r2() { return (double)(rand() % 10); }

void printvec(const int32_t N, const double *A) {
  printf("[%f", A[0]);
  for (int j = 1; j < N; ++j) {
    printf(", %f", A[j]);
  }
  printf("]");
}

void printmat(const int32_t M, const int32_t N, const double *A) {
  printf("[");
  printvec(N, A);
  for (int i = 1; i < M; ++i) {
    printf(", \n");
    printvec(N, A + (i * N));
  }
  printf("]");
}

void begnparray(const char *name) { printf("%s = np.array(", name); }
void endnparray() { printf(", dtype=np.float64)\n"); }

int main(int argc, char *argv[]) {

  int32_t M = 4, N = 7, lda = 7;
  int32_t incX = 1, incY = 1;

  const double alpha = 1e0;
  const double beta = 1e0;

  double *X = malloc(sizeof(double) * N);
  double *Y = calloc(sizeof(double), M);
  double *A = malloc(sizeof(double) * N * M);

  for (int i = 0; i < N; i++)
    X[i] = r2();
  for (int i = 0; i < M * N; ++i)
    A[i] = r2();

  printf("import numpy as np\n");
  printf("alpha, beta = %f, %f\n", alpha, beta);
  printf("print(alpha, beta)\n");

  begnparray("A");
  printmat(M, N, A);
  endnparray();

  begnparray("Y");
  printvec(M, Y);
  endnparray();

  begnparray("X");
  printvec(N, X);
  endnparray();

  printf("print(A.shape)\n");
  printf("print(A)\n");
  printf("print('Y', Y)\n");
  printf("print('X', X)\n");

  // y := alpha*A*x + beta*y,   or   y := alpha*A**T*x + beta*y,
  cblas_dgemv(CblasRowMajor, CblasNoTrans, //
              M, N / 2,                    //
              alpha, A, lda,               //
              X, 2 * incX, beta, Y, incY);

  begnparray("newY");
  printvec(M, Y);
  endnparray();

  printf("print('newY', newY)\n");
  printf("result = alpha * A[:,:-2:2] @ X[:-2:2] + beta * Y\n");
  printf("print('result:', result)\n");
  printf("print(result - newY)\n");
  printf("assert np.all(result == newY)");
  return 0;
}
