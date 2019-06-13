module uim.rest.api.modeling.models;

import uim.rest.api;

@path("/api/1/models")
interface IModels {
	// Properties
	struct Model {
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Model"));
	}

	// API
	 mixin(EntityAPI!("Model"));
}