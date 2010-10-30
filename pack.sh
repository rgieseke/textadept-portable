rm -rf TextadeptPortable/Data/.textadept
cp -r dot_textadept TextadeptPortable/Data/.textadept
rm TextadeptPortable/App/GTK/gtk2_runtime_uninst.exe
rm TextadeptPortable.zip
pushd TextadeptPortable
zip -r ../TextadeptPortable.zip .
popd
