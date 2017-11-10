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


*
 ___  __ _ ___
/ __|/ _` / __|
\__ \ (_| \__ \
|___/\__,_|___/

;

Thanks Egg
https://listserv.uga.edu/cgi-bin/wa?A2=SAS-L;233a16d0.1711b

I was unaware that the solve function!!

Given y = x**2*(1-x)**2 find the x values corresponding to y =.1, .2, .3, .4 and .5

Academic until SAS integrates DOSUBL better.

%symdel y / nowarn;
data _null_;

   do y=0 to .5 by .1;
     call symputx('y',y);

     rc=dosubl("
        proc fcmp;
           function solve_beta(x);
              return(x**2*(1-x)**2);
           endsub;
           y = symgetn('y');
           x = solve('solve_beta', {.}, y, .);
           put x;
        run;quit;
     ");
   end;
   stop;

run;quit;

1.2524810735
1.3349931709
1.3931531546
1.4393910432
1.4783183435


if highlight the line below and type 'evl' on the command line

1.2524810735**2*(1-1.2524810735)**2

then you get the following in the log

result = 0.1


* both macros in memver evl;
%macro evl / cmd;
   store;note;notesubmit '%evla;';
   run;
%mend evl;

%macro evla;
   %symdel __evl;
   filename clp clipbrd ;
   data _null_;
     infile clp;
     input;
     put _infile_;
     call symputx('__evl',_infile_);
   run;quit;
   data _null_;
     result=&__evl;
     put result=;
   run;quit;
%mend evla;


These command macros donly work in the classic editor (not in EE. UE, EG. SAS Studio. Viya? ....)
other command macros ( try highlighting a bock of text and typing 'cuth on the command line.

gethub command macros
https://github.com/rogerjdeangelis/utl_sas_classic_editor/blob/master/utl_classic_editor.sas






