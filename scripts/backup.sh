#este comando genera 
# pg_dump --column-inserts hc_rrhh_development > file.dmp

DATE=`date +%Y%m%d`
PASS="secret"
FILENAME="$DATE-HC_HR.dmp"; #TODO: change to actual directory

QTY="$(gdrive list --no-header | wc -l)"
echo "Number of files in google drive"
echo $QTY

OLD="$(gdrive list --order "modifiedTime asc" -m 1 --no-header | awk '{print $1;}')"

# Amount of days to keep backup
DAYS=60
# Delete oldest file in drive
if (( QTY > DAYS)) ; then
    echo "Deleting oldest backup in google drive"
    echo "========================================"

    if gdrive delete $OLD &>/dev/null; then
        echo "Deleted succesfully"
    else
        echo "Error deleting file"
        exit 1
    fi
fi

echo "Generating backup"
echo "==================="
# Generar el backup
if PGPASSWORD="secret" pg_dump --column-inserts -h localhost -U postgres -Fc hc_rrhh_development > $FILENAME ; then
    echo "Backup generated succesfully"
else
    echo "Error generating backup"
    exit 1;
fi

echo "Uploading to Google Drive"
echo "==========================="
# Subir a google drive
if gdrive upload --no-progress $FILENAME &>/dev/null; then
    echo "Upload succesful";
else
    echo "Upload failed";
    exit 1;
fi

# Borrar el archivo local
rm -rf $FILENAME

exit 0;