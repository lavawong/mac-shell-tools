#!/bin/sh
#mask生成二维码
channel=1
channelTxt="0001"
version="1.0.7"
while(( $channel<=84 ))
do
   echo $channel
   sub=1
   while(( $sub<=3 ))
   do
	   if [ "$channel" -lt "10" ] ; then
		   channelTxt="000"$channel
	   elif [ "$channel" -lt "100" ] ; then
		   channelTxt="00"$channel
	   else
		   channelTxt="0"$channel
	   fi
	   downloadUrl="https%3A%2F%2Fqiangyee.github.io%2Fmask%2F%3Fqudao%3D${channelTxt}-${sub}%26v%3D${version}"
	   logoUrl="http%3A%2F%2Fqiangyee.github.io%2Fmask%2Fstyle%2Fimages%2Flogo-icon80.png"
	   url="http://qr.liantu.com/api.php?text=${downloadUrl}&logo=${logoUrl}"
	   filename="qr-v${version}-${channelTxt}.png"
	   #wget -c $url -t 120 -o $filename 
	   echo ${url} ${filename}
	   let "sub++"
   done
   let "channel++"
done

