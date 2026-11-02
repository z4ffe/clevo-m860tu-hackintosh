Object does not exist ^ (\LOR)


./dsdt_ﬁxed.txt 233: If (\LOr (_OSI ("Darwin"), _OSI ("Windows 2001"))) 
Error 4063 - Object does not exist ^ (\LOR) 


Solution:

If (LOr (\_OSI ("Darwin"), \_OSI ("Windows 2001"))) 

or 

If (LOr (_OSI ("Darwin"), _OSI ("Windows 2001")))