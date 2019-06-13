module uim.rest.api.directory.users;

import uim.rest.api;

@path("/api/1/users")
interface IUsers {
	struct User {
	@safe:
		mixin(EntityProperties!());
		string clientId;
		string[] clients;

		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());

		mixin(ConvertAPI!("User"));
	}

	// API
	mixin(EntityAPI!("User"));

	@path("/id/:id")
	@headerParam("sessionid", "Authorization")
	User get(string sessionid, string _id);	

//	@path("/api/1/users/create")
//	@method(HTTPMethod.POST)
//	@headerParam("sessionid", "Authorization")
//	string create(string sessionid, User user);	
//
//	@path("/api/1/users/update/:id")
//	@method(HTTPMethod.PUT)
//	@headerParam("sessionid", "Authorization")
//	string update(string sessionid, User user);	
//
//	@path("/api/1/sessionuser/")
//	@headerParam("sessionid", "Authorization")
//	User sessionUser(string sessionid);
//
//	@path("/api/1/users/:id")
//	@method(HTTPMethod.DELETE)
//	@headerParam("sessionid", "Authorization")
//	void del(string sessionid, User user);	
}
