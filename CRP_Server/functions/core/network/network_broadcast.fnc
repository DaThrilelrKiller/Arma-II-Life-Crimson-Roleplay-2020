if ((TypeName _this) == "STRING") then 
{													
	PGRE = _this;									
	publicVariable "PGRE";																														
	call compile _this;
} 
else 
{					
	hint "Public Error: Expecting String.";		
};