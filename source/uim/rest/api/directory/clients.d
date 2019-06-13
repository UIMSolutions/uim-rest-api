module uim.rest.api.directory.clients;

import uim.rest.api;

@path("/api/1/clients")
interface IClients {
	struct Client {
	@safe:
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Client"));
	}

	mixin(EntityAPI!("Client"));

//	// @path("/api/1/clientsofsessionuser")
//	@headerParam("sessionid", "Authorization")
//	Client[] clientsOfSessionUser(string sessionid);
//
//	@headerParam("sessionid", "Authorization")
//	Client[] clientsOfUser(string sessionid, string userid); 
//
//	@headerParam("sessionid", "Authorization")
//	Client sessionClient(string sessionid);
//
//	@headerParam("sessionid", "Authorization")
//	Client changeSessionClient(string sessionid, string toClientid);
}
