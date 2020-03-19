#big_file_version
#if you want to download data, file in google drive link, you must change fileId and filename in link.

# How to use
#ex)https://drive.google.com/file/d/1234/view
# id = 1234
# filename = filename in link
# change text
#sh ./google_drive_file_download.sh

fileId=
fileName=
curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=${fileId}" > /dev/null
code="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"  
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${code}&id=${fileId}" -o ${fileName} 
