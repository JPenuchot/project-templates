#include <iostream>
#include <type_traits>

#include <blaze/Blaze.h>

template<unsigned int I, typename T1, typename T2>
inline auto add( T1 const& e1, T2 const& e2 )
  -> std::enable_if_t < !(I > 0), decltype(e1)> {
  return e1;
}

template<unsigned int I, typename T1, typename T2>
inline auto add( T1 const& e1, T2 const& e2 )
  -> std::enable_if_t < (I > 0), decltype(add<I-1>( e1 + e2, e2 ))> {
  return add<I-1>( e1 + e2, e2 );
}

template<unsigned int I, typename T1, typename T2>
[[clang::jit]]
blaze::DynamicVector<float> eval ( T1 const& e1, T2 const& e2 ) {
  blaze::DynamicVector<float> res = add<I>( e1,e2 );
  return res;
}

int main ()
{
  blaze::DynamicVector<float> a( 10,1.f ), b( 10,1.f );
  for( auto const i : { 1, 2, 3, 4 } )
    std::cout << eval<i>( a, b ) << '\n';
}
