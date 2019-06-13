module uim.rest.api.modeling.attclasses;

import uim.rest.api;

@path("/api/1/attclasses")
interface IAttclasses {
	// Properties
	struct Attclass {
		mixin(EntityProperties!());
		string classId;
		string modelId;
		
		mixin(EntityGetter!(`
		case "classid": return classId;		
		case "modelid": return modelId;		
		`));
		mixin(EntitySetter!(`
		case "classid": classId = value; break;		
		case "modelid": modelId = value; break;		
		`));
		mixin(EntitySQL!(`
		case "classid": return "'%s'".format(classId);		
		case "modelid": return "'%s'".format(modelId);		
		`));
		mixin(ConvertAPI!("Attclass"));
	}

	 //API
	 mixin(EntityAPI!("Attclass"));

//	@headerParam("sessionid", "Authorization")
//	Attclass createSubclass(string sessionid, string id, Attclass attclass); 

//	@method(HTTPMethod.GET)
//	@path("/id/:id/attributes")
//	@headerParam("sessionid", "Authorization")
//	IAttributes.Attribute[] attributes(string sessionid, string _id);

//	@method(HTTPMethod.GET)
//	@path("/id/:id/attributes/id/:attributeid")
//	@headerParam("sessionid", "Authorization")
//	IAttributes.Attribute attribute(string sessionid, string _id, string _attributeid);
}