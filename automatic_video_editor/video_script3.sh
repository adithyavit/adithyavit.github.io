FILES=inputs/*
for filename in $FILES 
    do 
        NAME=$(echo "${filename}"); 
    	echo $NAME
    	NAME2=$(echo "$NAME" | cut -c 8-)
    	echo $NAME2
    
#NAME="Lesson Design 3_2_8_Three Teachers_Objective Discussions.mp4"
       
video_information=$(ffmpeg -i "$NAME" -ss 0 -t 15 -filter_complex "select='gt(scene,0.9)',metadata=print:file=-"  -vsync vfr slidesnap%03d.png 2>&1 2>/dev/null)

#echo "$video_information"  
count=0
while read -r line;do
    for word in $line; do
   	if [[ $word == pts_time:* ]]; then
   	    ((count=count+1))
   	    if [[   count==1 ]]; then
    	    	ts=$(echo $word | cut -c10-15)
    	    	break 2
    	    fi
    	fi	
    done
done <<< "$video_information"

#echo "$ts"

rm slidesnap*

mkfifo temp1 temp2
ffmpeg -y -i Montage3.mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts temp1 2> /dev/null & \
ffmpeg -y -ss "$ts" -i "$NAME" -c copy -bsf:v h264_mp4toannexb -f mpegts temp2 2> /dev/null & \
ffmpeg -f mpegts -i "concat:temp1|temp2" -c copy -bsf:a aac_adtstoasc outputs/"$NAME2"


rm temp1
rm temp2

done
