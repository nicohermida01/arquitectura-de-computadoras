.code
daddi $t1, $0, 30
daddi $t2, $0, 4
ddiv $t3, $t1, $t2
dmul $t3, $t3, $t3
dsub $t4, $t1, $t3
halt