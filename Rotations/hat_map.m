function SO3 = hat_map(R3)

SO3 = [0 -R3(3) R3(2);
      R3(3) 0 -R3(1);
     -R3(2) R3(1) 0];