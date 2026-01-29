private ["_realDate"];
_realDate =  call compile ("real_date" callExtension "");
_realDate = [(_realDate select 0),(_realDate select 1),(_realDate select 2),12,0];

setDate _realDate;