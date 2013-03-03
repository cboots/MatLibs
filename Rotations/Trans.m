function t = Trans(v)
%Homogeneous translation matrix that translates by v
%v is 3D vector representing the translation

t = [1 0 0 v(1)
     0 1 0 v(2)
     0 0 1 v(3)
     0 0 0  1  ];
   