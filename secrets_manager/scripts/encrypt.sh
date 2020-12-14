#gpg --encrypt --batch --yes --armor -r tnshibu@yahoo.com          --output src/main/resources/secret.properties.encrypted src/main/resources/secret.properties
#gpg --encrypt --batch --yes --armor -r shibu.narayanan@oracle.com --output src/main/resources/secret.properties.encrypted src/main/resources/secret.properties
#

#echo gpg --encrypt --batch --yes --armor > ids_p1.txt
echo | set /p dummyName=gpg --encrypt --batch --yes --armor > ids_p1.txt
gpg  --list-keys --with-colons --fast-list-mode | awk -F: '/^pub/{printf "-r %s ", $5}' > ids_p2.txt
echo --output src/main/resources/secret.properties.encrypted src/main/resources/secret.properties > ids_p3.txt

cat ids_p1.txt ids_p2.txt ids_p3.txt > ids_final.bat
ids_final.bat
#gpg --encrypt --batch --yes --armor $(gpg --list-keys --with-colons --fast-list-mode | awk -F: '/^pub/{printf "-r %s ", $5}')  --output src/main/resources/secret.properties.encrypted src/main/resources/secret.properties
