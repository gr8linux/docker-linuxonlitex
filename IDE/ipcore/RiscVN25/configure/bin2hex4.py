#!/tools/bin/python2
# -*- coding: UTF-8 -*-

import sys
import re
import pdb
import struct

def bin2hex(binFile,hexFile):
	aHexFile 		= open('A' + hexFile,'w')
	bHexFile 		= open('B' + hexFile,'w')
	cHexFile 		= open('C' + hexFile,'w')
	dHexFile 		= open('D' + hexFile,'w')
	with open(binFile, "rb") as f:
		bindata = f.read()
	for dwIdx in range(len(bindata) / 4):
		if dwIdx < len(bindata) / 4:
			dw = bindata[4*dwIdx : 4*dwIdx+4]
			intDw = struct.unpack('>BBBB', dw)
			if(dwIdx == len(bindata) / 4 -1):
				aHexFile.write("{0:0>2x}".format(intDw[0]))
				bHexFile.write("{0:0>2x}".format(intDw[1]))
				cHexFile.write("{0:0>2x}".format(intDw[2]))
				dHexFile.write("{0:0>2x}".format(intDw[3]))
			else:
				aHexFile.write("{0:0>2x}\n".format(intDw[0]))
				bHexFile.write("{0:0>2x}\n".format(intDw[1]))
				cHexFile.write("{0:0>2x}\n".format(intDw[2]))
				dHexFile.write("{0:0>2x}\n".format(intDw[3]))
		else:
			hexFile.write("0\n")
	print('C bin to Hex successful')

if __name__ == '__main__':
	print("---------- bin 2 hex ----------")
	if(len(sys.argv) != 2):
		print('Error: illegal parameter.\nUsage: script <C_bin_image_file>')
	else:
		bin2hex(sys.argv[1],'mem.dat')
