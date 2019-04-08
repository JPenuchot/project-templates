#include <iostream>
#include <cstddef>
#include <vector>

template<typename T>
__global__ void iota(T* in, T* out)
{
  out[threadIdx.x] = in[threadIdx.x] * threadIdx.x;
}

template <typename T>
struct cuda_managed_alloc
{
  using value_type = T;
  using size_type = std::size_t;
  using difference_type = std::ptrdiff_t;

  static T* allocate(std::size_t n)
  {
    T* res;
    cudaMallocManaged((void**)&res, n * sizeof(T));
    return res;
  }

  static void deallocate(T* ptr, std::size_t)
  {
    cudaFree(ptr);
  }
};

template<typename T>
using cuda_vector = std::vector<T, cuda_managed_alloc<T>>;

int main(int, char const *[])
{
  std::vector<float, cuda_managed_alloc<float>> v(1024);

  for(auto& elmt : v)
    elmt = 1;

  iota<<<1, v.size()>>>(v.data(), v.data());

  cudaDeviceSynchronize();

  for(auto& elmt : v)
    std::cout << elmt << '\n';

  return 0;
}
