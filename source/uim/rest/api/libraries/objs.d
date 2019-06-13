module uim.rest.api.libraries.objs;

import uim.rest.api;

@path("/api/1/objs")
interface IObjs {
	// Properties
	struct Obj {
		mixin(EntityProperties!());
		string classId;
		string[] attributes;
		
		mixin(EntityGetter!(`
		case "classid": return classId;		
		case "attributes": return attributes.join(",");		
		`));
		mixin(EntitySetter!(`
		case "classid": classId = value; break;		
		case "attributes": attributes = value.split(","); break;		
		`));
		mixin(EntitySQL!(`
		case "classid": return "'%s'".format(classId);		
		case "attributes": return "'%s'".format(attributes.join(","));		
		`));

		mixin(ConvertAPI!("Objs"));
	}

	// API
	mixin(EntityAPI!("Obj"));

//	@path("/:id/add_to/:folderid")
//	@method(HTTPMethod.PUT)
//	@headerParam("sessionid", "Authorization")
//	void addTo(string sessionid, string _id, string _folderid);
//
//	@path("/:id/remove_from/:folderid")
//	@method(HTTPMethod.PUT)
//	@headerParam("sessionid", "Authorization")
//	void removeFrom(string sessionid, string _id, string _folderid);
//
//	@path("/:id/move/:fromid/to/:targetid")
//	@method(HTTPMethod.PUT)
//	@headerParam("sessionid", "Authorization")
//	void move(string sessionid, string _id, string _fromid, string _targetid);

	@path("/:id/objects")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Obj[] objects(string sessionid, string _id);

	@path("/:id/objects/:objid")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Obj objectOfObjects(string sessionid, string _id, string _objid);
}
