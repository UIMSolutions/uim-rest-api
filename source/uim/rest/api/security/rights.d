module uim.rest.api.security.rights;

import uim.rest.api;

@path("/api/1/rights")
interface IRights {
	struct Right {
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());

		mixin(ConvertAPI!("Right"));
	}

	mixin(EntityAPI!("Right"));

	@headerParam("sessionid", "Authorization")
	Right[] rightsOfUser(string sessionid, string userid);

	@headerParam("sessionid", "Authorization")
	Right[] rightsOfGroup(string sessionid, string groupid);

////	@path("/api/1/groups")
//	@headerParam("sessionid", "Authorization")
//	Right[] rights(string sessionid);	
//
////	@path("/api/1/groups/:id")
//	@headerParam("sessionid", "Authorization")
//	Right right(string sessionid, string _id);	
}
