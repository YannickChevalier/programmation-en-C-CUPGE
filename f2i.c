#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

int main ( int argc , char * argv[] )
{
  float f , g = atof ( argv[1] ) ;
  int s , e , n = 0 , m ;
  unsigned int i_g ;
  f = g ;
  i_g = * ( int * ) & g ;
  if ( f < 0 )
    {
      s = 1 ;
      f = -f ;
    }
  else
    s = 0 ;
  while ( f > 2 )
    {
      f = f / 2 ;
      n = n + 1 ;
    }
  while ( f < 1 )
    {
      f = f * 2 ;
      n = n - 1 ;
    }
  e = 127 + n ;
  f = ( f - 1 ) * ( 1 << 22 ) ;
  m = ( int ) f ;
  printf ( "%f = |%d|%d|0x%06x|\n" , g , s , e , m ) ;
  printf ( "%f =  |%d|%d|0x%06x|\n" , g ,
	   i_g >> 31 ,
	   ( i_g << 1 ) >> 24,
	   ( i_g << 9 ) >> 9 ) ;
  printf ( "%f = 0x%08x\n" , g , * ( int * ) & g ) ;
  return 0 ;
}
