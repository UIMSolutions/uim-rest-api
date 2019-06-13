module uim.rest.api.ecm.folders;

import uim.rest.api;

@path("/api/1/folders")
interface IFolders {
	// Properties
	struct Folder {
		mixin(EntityProperties!());
		IFolders.Folder[] folders;
		IDocuments.Document[] documents;

		mixin(EntityGetter!());
		mixin(EntitySetter!());
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Folder"));
	}

	// API
	 mixin(EntityAPI!("Folder"));

//	@path("/:id/folders")
//	@method(HTTPMethod.GET)
//	Folder[] foldersOfFolder(string _id);
//
//	@path("/:id/folders/:id")
//	@method(HTTPMethod.POST)
//	void addFolder(string id);
//
//	@path("/:id/folders/:id")
//	@method(HTTPMethod.DELETE)
//	void removeFolder(string _id);
}