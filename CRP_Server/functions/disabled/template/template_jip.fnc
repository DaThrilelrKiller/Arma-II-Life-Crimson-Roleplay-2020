/*
	Purpose:
	This functions runs everytime a new player joins the server on every machine including the server.
	However if it is a server side modules then it will only run on the server.
	
	Prams:
		0. Unit that joined - OBJ
		1. Side of joining player - STRING
		2. uid of the joining player - STRING
		
	Commons Usages:
		-Loading player stats
		-making sure everything is sync for the module upon new players joining
		-loading messages
*/