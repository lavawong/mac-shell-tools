#!/usr/bin/python
__author__ = 'vivek, LavaWong'
import os, sys, getopt, json

# Read file content
# @return {string} file_str
def file_get_contents(filename):
    if os.path.isfile(filename) and os.access(filename, os.R_OK):
        with open(filename, 'r') as f:
            return f.read()
    else:
        print("[Error] file %s is not exists!" % filename)
        sys.exit(2)
 
ifile=''
ofile=''
 
###############################
# o == option
# a == argument passed to the o
###############################
# Cache an error with try..except 
# Note: options is the string of option letters that the script wants to recognize, with 
# options that require an argument followed by a colon (':') i.e. -i fileName
#
try:
    myopts, args = getopt.getopt(sys.argv[1:],"i:o:")
except getopt.GetoptError as e:
    print (str(e))
    print("Usage: %s -i input -o output" % sys.argv[0])
    sys.exit(2)
 
for o, a in myopts:
    if o == '-i':
        ifile=a
    elif o == '-o':
        ofile=a

ifile_content = file_get_contents(ifile)

uni_content = ifile_content.decode('utf8');
ascii_content = '';
for c in uni_content:
    ord_c = ord(c)
    if (0xff < ord_c):
        c = "\\u{:04x}".format(ord_c)
    else:
        c = chr(ord_c)
    ascii_content += c;

# ofs.write("\\u" + "\\u".join("{:04x}".format(ord(c)) for c in ivan_uni))

encode_str = ascii_content

if str(ofile) == '':
    print encode_str
else:
    ofs = open(ofile, mode='w+')
    ofs.write(encode_str)
    ofs.close()

# Display input and output file name passed as the args
# print ("Input file : %s and output file: %s" % (ifile,ofile) )
