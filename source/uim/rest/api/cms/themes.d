module uim.rest.api.cms.themes;

import uim.rest.api;

@path("/api/1/themes")
interface IThemes {
	struct Theme {
	@safe:
		mixin(EntityProperties!());
		size_t numberOfNews = 0;
		size_t numberOfBlogs = 0;
		size_t numberOfServices = 0;
		size_t numberOfDocs = 0;
		size_t numberOfTuts = 0;

		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Theme"));
	}

	// API
	mixin(EntityAPI!("Theme"));

//	@method(HTTPMethod.OPTIONS)
//	@path("/create")
//	Json create();	
}

/*
get		GET
query 	GET
set 	PUT
put 	PUT
update 	PATCH
patch 	PATCH
add 	POST
create 	POST
post 	POST
  */