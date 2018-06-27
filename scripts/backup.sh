#este comando genera 
# pg_dump --column-inserts hc_rrhh_development > file.dmp

DATE=`date +%Y%m%d`
FILENAME="dmp/$DATE.dmp"; #TODO: change to actual directory

echo "\nNumber of files in drive"
QTY="$(gdrive list | wc -l)"
echo $QTY

echo "\nGenerating backup"
echo "===================="
if pg_dump --column-inserts hc_rrhh_development > $FILENAME ; then
    echo "Backup generated succesfully"
else
    echo "Error generating backup"
    exit 1;
fi

echo "\nUploading to Google Drive"
echo "============================"
if gdrive upload --no-progress $FILENAME &>/dev/null; then
    echo "Upload succesful";
else
    echo "Upload failed";
    exit 1;
fi

exit 0;
