module uim.rest.api.directory.groups;

import uim.rest.api;

@path("/api/1/groups")
interface IGroups {
	struct Group {
	@safe:
		mixin(EntityProperties!());
		//string[] groupIds;

		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Group"));
	}	
	mixin(EntityAPI!("Group"));

//	@path("/api/1/groups")
	@headerParam("sessionid", "Authorization")
	Group[] groups(string sessionid);	

//	@path("/api/1/groups/:id")
	@headerParam("sessionid", "Authorization")
	Group group(string sessionid, string _id);	

	@headerParam("sessionid", "Authorization")
	void addGroup(string sessionid, string groupid, Group group);

	@headerParam("sessionid", "Authorization")
	void addUser(string sessionid, string groupid, IUsers.User user);
}
