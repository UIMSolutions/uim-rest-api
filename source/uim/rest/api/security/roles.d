module uim.rest.api.security.roles;

import uim.rest.api;

@path("/api/1/roles")
interface IRoles {
	struct Role {
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Role"));
	}

	// API
	mixin(EntityAPI!("Role"));

//	@path("/api/1/groups")
//	@headerParam("sessionid", "Authorization")
//	Role[] roles(string sessionid);	
//
////	@path("/api/1/groups/:id")
//	@headerParam("sessionid", "Authorization")
//	Role role(string sessionid, string _id);	
}
