rm -rf TextadeptPortable/Data/.textadept
cp -r dot_textadept TextadeptPortable/Data/.textadept
rm TextadeptPortable.zip
pushd TextadeptPortable
zip -r ../TextadeptPortable.zip .
popd
