rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib1.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib5.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib10.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib15.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib20.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib25.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib30.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib31.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib32.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib33.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib34.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib35.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib36.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib37.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib38.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib39.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
rm ex.s
python3 ../parser/minc_to_xml.py ../test/benchmark/fib40.c > ex.xml
./minc ex.xml ex.s
gcc -o tmp ex.s
time ./tmp > improved
