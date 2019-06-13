module uim.rest.api.ecm.documents;

import uim.rest.api;

@path("/api/1/documents")
interface IDocuments {
	// Properties
	struct Document {
		mixin(EntityProperties!());
		IContents.Content[] content;

		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());		
		mixin(ConvertAPI!("Document"));
	}

	// API
	 mixin(EntityAPI!("Document"));

//	@path("/:id/documents")
//	@method(HTTPMethod.GET)
//	void documents(string _id);
//
//	@path("/:id/documents/:id")
//	@method(HTTPMethod.POST)
//	void addDocument(string _id);
//
//	@path("/:id/documents/:id")
//	@method(HTTPMethod.GET)
//	void addDocument(string _id);
}