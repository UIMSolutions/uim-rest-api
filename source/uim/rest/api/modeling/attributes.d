module uim.rest.api.modeling.attributes;

import uim.rest.api;

@path("/api/1/attributes")
interface IAttributes {
	// Properties
	struct Attribute {
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
		mixin(ConvertAPI!("Attribute"));
	}

	// API
	 mixin(EntityAPI!("Attribute"));
}