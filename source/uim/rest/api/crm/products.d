module uim.rest.api.crm.products;

import uim.rest.api;

@path("/api/1/products")
interface IProducts {
	// Properties
	struct Product {
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Product"));
	}

	// API
	 mixin(EntityAPI!("Product"));
}
