module uim.rest.api.ecm.emails;

import uim.rest.api;

@path("/api/1/emails")
interface IEmails {
	// Properties
	struct Email {
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Email"));
	}
	// API
	 mixin(EntityAPI!("Email"));
}
