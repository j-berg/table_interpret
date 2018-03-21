#!/bin/bash

#Script for parsing plates from flourometer compilation.
#Expected input file:
#plates.csv
#A1_Plate1 A1_Plate2 A2_Plate1 A2_Plate2 ...
#A1_Plate3 A1_Plate4 A2_Plate3 A2_Plate4 ...
#B1_Plate1 B1_Plate2 B2_Plate1 B2_Plate2 ...
#B1_Plate3 B1_Plate4 B2_Plate3 B2_Plate4 ...
#...       ...       ...       ...
#
#Expected usage:
#sh table_interpret.sh input_file.csv
#Copy script to ~/table_interpret
#Bash profile:
#export PATH="/Users/uesername/table_interpret:$PATH"
#export PATH
#alias table_interpret="sh table_interpret.sh"

#plate1
awk 'NR%2 == 1' $1 > plate1_inter.csv #print 1st rows, 2nd columns
awk -F, '{for(i=1;i<=NF;i+=2)printf "%s%s", $i, (i+2>NF?"\n":FS)}' < plate1_inter.csv > plate1.csv
rm plate1_inter.csv
tr , '\n' < plate1.csv > plate1_flat.csv
rm plate1.csv

#plate2
awk 'NR%2 == 1' $1 > plate2_inter.csv #print 1st rows, 2nd columns
awk -F, '{for(i=2;i<=NF;i+=2)printf "%s%s", $i, (i+2>NF?"\n":FS)}' < plate2_inter.csv > plate2.csv
rm plate2_inter.csv
tr , '\n' < plate2.csv > plate2_flat.csv
rm plate2.csv

#plate3
awk 'NR%2 == 0' $1 > plate3_inter.csv #print 1st rows, 2nd columns
awk -F, '{for(i=1;i<=NF;i+=2)printf "%s%s", $i, (i+2>NF?"\n":FS)}' < plate3_inter.csv > plate3.csv
rm plate3_inter.csv
tr , '\n' < plate3.csv > plate3_flat.csv
rm plate3.csv

#plate4
awk 'NR%2 == 0' $1 > plate4_inter.csv #print 1st rows, 2nd columns
awk -F, '{for(i=2;i<=NF;i+=2)printf "%s%s", $i, (i+2>NF?"\n":FS)}' < plate4_inter.csv > plate4.csv
rm plate4_inter.csv
tr , '\n' < plate4.csv > plate4_flat.csv
rm plate4.csv
