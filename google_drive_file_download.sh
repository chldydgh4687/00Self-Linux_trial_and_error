#big_file_version
#if you want to download data, file in google drive link, you must change fileId and filename in link.

# How to use
#ex)https://drive.google.com/file/d/1234/view
# id = 1234
# filename = filename in link
# change text
#sh ./google_drive_file_download.sh

#echo "Done."

#echo "GITHUB (1) (2) Data ..."

fileId=
fileName=
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${fileId}" > /dev/null
code="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${code}&id=${fileId}" -o ${fileName} 

#curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=1soLIUkGruSKMzg5z5_OYYqUVoca4E_lI" > /dev/null
#curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=1soLIUkGruSKMzg5z5_OYYqUVoca4E_lI" -o 3_LFW
