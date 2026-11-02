on run

 #!/bin/bash

cdir=`dirname $0`
dmpdir=Acpitables

# Crea el directorio para el dump 


cd "$HOME/Library/Application Support/EvOSoftware/DSDT"
if [[ ! -d $dmpdir ]];then
   mkdir $dmpdir 
fi

# Dumpeando las Tablas ACPI desde el ioreg
acpi_tbls=`ioreg -lw0 | grep "ACPI Tables" | cut -f2 -d"{" | tr "," " "`



# Loop a través de cada tabla
for tbl in $acpi_tbls
do
    tbl_name=`echo $tbl | cut -f1 -d"=" | tr -d "\""`

    echo $tbl_name
    tbl_data=`echo $tbl | cut -f2 -d"<" | tr -d ">"`
    echo $tbl_data | xxd -r -p > $dmpdir/$tbl_name.aml
    

done

end run

