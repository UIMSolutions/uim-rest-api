module uim.rest.api.libraries.projects;

import uim.rest.api;

@path("/api/1/projects")
interface IProjects {
	// Properties
	struct Project {
		mixin(EntityProperties!());
		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Project"));
	}

	// API
	 mixin(EntityAPI!("Project"));
}
