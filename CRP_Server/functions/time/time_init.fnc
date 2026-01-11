private ["_realDate"];
_realDate =  call compile ("real_date" callExtension "");
_realDate = [(DTK_Real_Date select 0),(DTK_Real_Date select 1),(DTK_Real_Date select 2),12,0];

setDate _realDate;