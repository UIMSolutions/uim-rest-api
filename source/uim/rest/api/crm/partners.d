module uim.rest.api.crm.partners;

import uim.rest.api;

@path("/api/1/partners")
interface IPartners {
	// Properties
	struct Partner {
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Partner"));
	}

	// API
	mixin(EntityAPI!("Partner"));
}
