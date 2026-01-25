if(player distance countygate <= 30) then 
{
countygate animate ["innergate",1]; jailgate_in say "fanceopen";
countygate animate ["outergate",1]; jailgate_in say "fanceopen";
systemChat  "Closing Sallyport Gate in 10 seconds";
sleep 10;
systemChat  "Closing Sallyport Gates";
countygate animate ["innergate",0]; jailgate_in say "fanceopen";
countygate animate ["outergate",0]; jailgate_in say "fanceopen";
};
}else{
	systemChat  "Not close enough to a gate";
	};
