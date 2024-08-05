rm ex.s
python3 ../../parser/minc_to_xml.py debug > ex.xml
go build .
./minc ex.xml ex.s
