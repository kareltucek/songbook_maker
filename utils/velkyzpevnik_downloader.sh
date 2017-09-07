#!/bin/bash
if [ $# -lt 1 ]
then
  echo "syntax velkyzpevnik_downloader <song category>"
  echo ""
  echo "Song category denotes some category of songs as reckognized by velkyzpevnik. E.g., to download all Cechomor's songs, which are to be found at http://www.velkyzpevnik.cz/zpevnik/cechomor, use simply 'cechomor'."
  echo ""
  echo "Output is put into a newly created 'song' directory."
  exit 1
fi

mkdir songs

curl http://www.velkyzpevnik.cz/zpevnik/$1 | grep 'class="song' | grep -o 'href="[^"]*' | sed 's/href=.//g' | grep -v 'cechomor$' | sed 's=^=http://www.velkyzpevnik.cz/=' |
while read url
do
  name=$(echo $url | sed 's=.*/==g')
  (
  #echo $name
  #echo ====
  curl $url | awk '
  BEGIN{ off = 1; }
  /<\/pre/{off = 1;}
  /<pre/{off = 0;}
  //{if(off == 0){ print $0; } }
  ' | sed 's/<[^>]*>//g' | sed 's/Interpret.*;/\n====\n/g' 
  ) | tee /dev/tty > songs/$name
done



