# Skanning of images to PDF 

* https://github.com/pohape/command-line-scanner/tree/main
* https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion

```

<!-- Jacek , 
changes made to /etc/ImageMagic-6/policy.xml 
for convering image scans to PDF -->


 <policy domain="coder" rights="read | write" pattern="PDF" />
</policymap>

```

```

cd /home/jacek/programs/command-line-scanner-main

./scan.sh ~/Documents/skan-temp.png
./scan.sh ~/Documents/skan-temp2.png
./scan.sh ~/Documents/skan-temp3.png


cd ~/Documents

convert skan-temp.png skan-temp2.png skan-temp3.png   skan-all-pages-temp.pdf

```

