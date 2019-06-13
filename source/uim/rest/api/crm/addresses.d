module uim.rest.api.crm.addresses;

import uim.rest.api;

@path("/api/1/addresses")
interface IAddresses {
	// Properties
	struct Address {
	@safe:
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Address"));
	}

	// API
	mixin(EntityAPI!("Address"));
}