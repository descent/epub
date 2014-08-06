#!/bin/sh
# use code2html to generate html for blog.
# language:
# ada, ada95, awk, c, c++, cc, cpp, cxx, gpasm, groff, html, java,
# javascript, js, lisp, m4, make, makefile, pas, pascal, patch, perl, plain, pov,
# povray, python, ruby, sh, shellscript, sql.

if [ "$1" == "" ]; then
  echo "usage: $0 code_filename language"
  echo "code2html support language syntax"
  code2html --mode
  exit 0
#else
#  echo 'usage: code_filename $1'
fi
L=plain

if [ "$2" == "" ]; then
  echo "language syntax: $L"
else
  L=$2
fi


echo '<pre style="white-space: pre-wrap;">' >> $1.html
code2html -H -n -l $L $1 >> $1.html
#code2html -H -N -l $L $1 >> $1.html
echo "</pre>" >> $1.html

sed -i -e 's/<\/a>/<\/b>/g' $1.html
sed -i -e 's/<a name="line[0-9]*">/<b>/g' $1.html

echo "generate $1.html"
