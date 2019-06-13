module uim.rest.api.cms.pages;

import uim.rest.api;

@path("/api/1/pages")
interface IPages {
	struct Page { 
	@safe:
		mixin(EntityProperties!());
		string visibility = "private";
		string contentType = "html";
		string mainTitle = "";
		string subTitle = "";
		string summary = "";
		string content = "";
		size_t orderNo = 0;
		string keywords = "";
		string author = "UIM";
		string theme = "";
		string image = "";

		mixin(EntityGetter!(`
		case "visibility": return visibility;
		case "contenttype": return contentType;
		case "maintitle": return mainTitle;
		case "subTitle": return subTitle;
		case "summary": return summary;
		case "content": return content.replace("\n", "");
		case "orderNo": return to!string(orderNo);
		case "keywords": return keywords;
		case "author": return author;
		case "theme": return theme;
		case "image": return image;
`));
		mixin(EntitySetter!(`
		case "visibility": visibility = value; break;
		case "contenttype": contentType = value; break;
		case "maintitle": mainTitle = value; break;
		case "subTitle": subTitle = value; break;
		case "summary": summary = value.replace("\n", ""); break;
		case "content": content = value.replace("\n", ""); break;
		case "orderNo": orderNo = to!size_t(value); break;
		case "keywords": keywords = value; break;
		case "author": author = value; break;
		case "theme": theme = value; break;
		case "path": path = value; break;
		case "image": image = value; break;
		`));
		mixin(EntitySQL!());
		mixin(ConvertAPI!("Page"));
	}

	mixin(EntityAPI!("Page"));

//	@path("/idname/:idname")
//	@headerParam("sessionid", "Authorization")
//	Page getByIdName(string sessionid, string _idname);	
//
//	@path("all")
//	@headerParam("sessionid", "Authorization")
//	@queryParam("where", "where")
//	Page[] all(string sessionid, string[] where);	
//	
//	@path("find")
//	@headerParam("sessionid", "Authorization")
//	@queryParam("where", "where")
//	@queryParam("orderNo", "orderNo")
//	Page[] all(string sessionid, string[] where, string[] orderNo);	
//
//	@path("/get/:id")
//	@headerParam("sessionid", "Authorization")
//	Page get(string sessionid, string _id);	
//
//	@headerParam("sessionid", "Authorization")
//	string idOfIdName(string sessionid, string idName);

	@path("/by/contenttype/:contenttype")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Page[] byContentType(string sessionid, string _contenttype);

	@path("/by/theme/:theme")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Page[] byTheme(string sessionid, string _theme);

	@path("/search/:searchText")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Page[] search(string sessionid, string _searchText);

	@path("/count/contenttypes")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Json countContentTypes(string sessionid);

//	@path("/by/year/:year")
//	@method(HTTPMethod.GET)
//	@headerParam("sessionid", "Authorization")
//	Page[] byYear(string sessionid, string _year);
//	
//	@path("/blogs/:id")
//	@method(HTTPMethod.GET)
//	@headerParam("sessionid", "Authorization")
//	Page blog(string sessionid, string _id);
//	
//	@path("/news")
//	@method(HTTPMethod.GET)
//	@headerParam("sessionid", "Authorization")
//	Page[] news(string sessionid);
//
//	@path("/services")
//	@method(HTTPMethod.GET)
//	@headerParam("sessionid", "Authorization")
//	Page[] services(string sessionid);
}

