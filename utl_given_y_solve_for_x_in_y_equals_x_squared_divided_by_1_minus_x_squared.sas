Given y, find x in the non-linear equation y = ax**2/(1-x)**2.

This can be generalixed to more dimensions,  if you have
z=f(x,y) then iterate on x values


INPUT
  Given
   y = ax**2/(1-x)**2

   a=1
   y=1

  Calulate x

PROCESS
=======

   %utl_submit_py64("
   from sympy import *;
   x, y, z = symbols('x y a');
   y=1;
   a=1;
   r=solve(y - x**2/((1-x)**2));
   print r;
   ");

OUTPUT
======
   [1/2]

   lets check

     1 - .5**2/(1-.5)**2  = 1 -1 =0



