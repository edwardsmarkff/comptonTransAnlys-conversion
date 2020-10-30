# comptonTransAnlys-conversion
Compton Phonetic transcription conversion

copied from 

DAMAGED KEY FIXED 2020-10-30 -

still to do:

rename  Client_master_2_teacher_foreign_key_symbol_2
         Client_anlys_detail_2_frequency_list_foreign_key_symbol_2  (remove _2)
         
### somewhere there is a damaged key...?
### grep  CASCADE  xxx.sql  | grep -v 'ON DELETE CASCADE ON UPDATE CASCADE'
### 
### damaged key!
### 
###  CONSTRAINT `Client_anlys_detail_2_frequency_list_foreign_key_symbol` FOREIGN KEY (`Client_anlys_detail_error_frequency`) REFERENCES `Frequency_list` (`Frequency`) ON DELETE ###  NO ACTION ON UPDATE CASCADE
###  
###  CONSTRAINT `Client_master_2_teacher_foreign_key_symbol` FOREIGN KEY (`Client_master_teacher_name`) REFERENCES `Teacher` (`Teacher_name`) ON DELETE NO ACTION ON UPDATE CASCADE
