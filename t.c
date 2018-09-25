#include <stdio.h>

int
main ( int argc , char * argv[] )
{
  int c ;
  printf ( "Écrivez: Bonjour, monde !\n" ) ;
  scanf ( "Bonjour, monde !" ) ;
  c = getchar () ;
  while ( c != '\n' )
  {
    printf ( "%c" , c ) ;
    c = getchar ( ) ;
  }
  printf ( "Je vous ai compris!\n" ) ;
  return 0 ;
}
