#!/bin/bash
product=""
isOnline=""
while getopts ":p:o" opt
do
	case $opt in
		o )
			isOnline="_online"
			;;
		p )
			product=$OPTARG
			echo $OPTARG
			;;                    
		\? )
			echo product -- $OPTARG $OPTIND
			;;                    
	esac
done
shift $((OPTIND-1))  #This tells getopts to move on to the next argument.


while [ $# -ne 0 ]; do
  	input_value=$1
    echo -e "value is: $input_value"
	  shift  #Move on to next input file.
	  done
if [ -z $product ];then
	product=$((OPTIND-1))
fi
echo $product  $isOnline
svn ls https://svn.intra.sina.com.cn/icplatform/tech/ria$isOnline/$product/tags/ | awk -F '[_/]' 'BEGIN {max=0} {if (max < $2) max=$2} END {print max}'
