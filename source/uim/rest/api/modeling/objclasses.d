module uim.rest.api.modeling.objclasses;

import uim.rest.api;

@path("/api/1/objclasses")
interface IObjclasses {
	// Properties
	struct Objclass {
		mixin(EntityProperties!());
		string classId;
		string modelId;
		string[] attributes;

		mixin(EntityGetter!(`
		case "classid": return classId;		
		case "modelid": return modelId;		
		case "attributes": return attributes.join(",");		
		`));
		mixin(EntitySetter!(`
		case "classid": classId = value; break;		
		case "modelid": modelId = value; break;		
		case "attributes": attributes = value.split(","); break;		
		`));
		mixin(EntitySQL!(`
		case "classid": return "'%s'".format(classId);		
		case "modelid": return "'%s'".format(modelId);		
		case "attributes": return "'%s'".format(attributes.join(","));		
		`));
		mixin(ConvertAPI!("Objclass"));
	}

	// API
	 mixin(EntityAPI!("Objclass"));

	@method(HTTPMethod.GET)
	@path("/:id/objclasses")
	@headerParam("sessionid", "Authorization")
	Objclass[] subclasses(string sessionid, string _id);

//	@method(HTTPMethod.POST)
//	@path("/:id/objclasses/create")
//	@headerParam("sessionid", "Authorization")
//	Objclass createSubclass(string sessionid, string _id, ObjclassC objclass);

//	@method(HTTPMethod.GET)
//	@path("/:id/attributes")
//	@headerParam("sessionid", "Authorization")
//	IAttributes.Attribute[] attributes(string sessionid, string _id);
//
//	@method(HTTPMethod.GET)
//	@path("/:id/attributes/:attributeid")
//	@headerParam("sessionid", "Authorization")
//	IAttributes.Attribute attribute(string sessionid, string _id, string _attributeid);
//	
//	@method(HTTPMethod.GET)
//	@path("/:id/attributes/:attributeid/class")
//	@headerParam("sessionid", "Authorization")
//	IAttclasses.Attclass attclass(string sessionid, string _id, string _attributeid);
//
//	@method(HTTPMethod.PUT)
//	@path("/:id/attributes/:attributeid")
//	@headerParam("sessionid", "Authorization")
//	void addAttribute(string sessionid, string _id, string _attributeid);
//
//	@method(HTTPMethod.PUT)
//	@path("/:id/attributes/add")
//	@headerParam("sessionid", "Authorization")
//	void addAttribute(string sessionid, string _id, IAttributes.Attribute attribute);
}