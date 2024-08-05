mv debug debug.c
gcc -S -O0 debug.c
mv debug.s sample.txt
mv debug.c debug