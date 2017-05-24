from os import listdir
import re

code = ""

pattern = re.compile(".+\.asm$")

for file in listdir():
	if pattern.match(file) and not file == "main.asm":
		r = open(file, 'r')
		code += ';_________________from ' + file + '_________________\n'
		print("Menambahkan dari file " + file)
		code += r.read()
		code += '\n\n'
		r.close()

w = open("main.asm", 'w')
w.write(code)
w.close()
print("Kompilasi berhasil")