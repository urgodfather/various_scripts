#! /bin/bash                                                                    

/bin/rm -f /var/www/html/*.xml

wget -O /var/www/html/1.xml.gz http://rytec.ricx.nl/epg_data/rytecNO_Basic.gz && gunzip /var/www/html/1.xml.gz &
wget -O /var/www/html/2.xml.gz http://rytec.ricx.nl/epg_data/rytecNO_Misc.gz && gunzip /var/www/html/2.xml.gz &
wget -O /var/www/html/3.xml.gz http://rytec.ricx.nl/epg_data/rytecNO_SportMovies.gz && gunzip /var/www/html/3.xml.gz &
wget -O /var/www/html/4.xml.gz http://rytec.ricx.nl/epg_data/rytecSE_Basic.gz && gunzip /var/www/html/4.xml.gz &
wget -O /var/www/html/5.xml.gz http://rytec.ricx.nl/epg_data/rytecSE_Misc.gz && gunzip /var/www/html/5.xml.gz &
wget -O /var/www/html/6.xml.gz http://rytec.ricx.nl/epg_data/rytecSE_SportMovies.gz && gunzip /var/www/html/6.xml.gz &
wget -O /var/www/html/7.xml.gz http://rytec.ricx.nl/epg_data/rytecDK_Basic.gz && gunzip /var/www/html/7.xml.gz &
wget -O /var/www/html/8.xml.gz http://rytec.ricx.nl/epg_data/rytecDK_Misc.gz && gunzip /var/www/html/8.xml.gz &
wget -O /var/www/html/9.xml.gz http://rytec.ricx.nl/epg_data/rytecDK_SportMovies.gz && gunzip /var/www/html/9.xml.gz &
wget -O /var/www/html/10.xml.gz http://rytec.ricx.nl/epg_data/rytecMisc.gz &&  gunzip /var/www/html/10.xml.gz &
wget -O /var/www/html/11.xml.gz http://rytec.ricx.nl/epg_data/rytecUK_Basic.gz && gunzip /var/www/html/11.xml.gz &
wget -O /var/www/html/12.xml.gz http://rytec.ricx.nl/epg_data/rytecUK_SportMovies.gz && gunzip /var/www/html/12.xml.gz &
wget -O /var/www/html/13.xml.gz http://rytec.ricx.nl/epg_data/rytecNWS.gz && gunzip /var/www/html/13.xml.gz &
wget -O /var/www/html/14.xml.gz http://rytec.ricx.nl/epg_data/rytecUK_SkyDead.gz && gunzip /var/www/html/14.xml.gz &
wget -O /var/www/html/15.xml.gz http://rytec.ricx.nl/epg_data/rytecERO.gz && gunzip /var/www/html/15.xml.gz &

wait

rm /var/www/html/*.gz

/usr/bin/tv_cat /var/www/html/*.* > /var/www/html/guide.xml

#copy file add timestamp
/bin/cp -rf /var/www/html/guide.xml "/var/www/html/guide-$(date +"%Y%m%d").xml"

#rename file 5 days old (not working)
#/usr/bin/find /var/www/html/ -type f -name 'guide*' -mtime 5 -execdir /bin/mv {} /var/www/html/pl.xml ';' 2> /var/www/html/epg.log
