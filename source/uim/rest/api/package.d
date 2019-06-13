module uim.rest.api;

public import std.stdio;
public import std.string;
public import std.uuid;

public import vibe.vibe;

public import uim.core;

public import uim.rest.api.ecm;
public import uim.rest.api.cms;
public import uim.rest.api.crm;
public import uim.rest.api.directory;
public import uim.rest.api.libraries;
public import uim.rest.api.modeling;
public import uim.rest.api.security;
public import uim.rest.api.storages;
public import uim.rest.api.server;

RestInterfaceClient!IServer iServer; 

template EntityProperties() {
	const char[] EntityProperties = `
	string id = "";
	size_t versionId = 1;
	size_t isCurrent = 1;
	size_t versioned = 0;
	string versionedBy = "";
	string name = "";
	string title = "";
	size_t validFrom = 0;
	size_t validUntil = 0;
	size_t created = 0;
	string createdBy = "";
	size_t changed = 0;
	string changedBy = "";
	size_t accessed = 0;
	string accessedBy = "";
	size_t locked = 0;
	string lockedBy = "";
	size_t deleted = 0;
	string deletedBy = "";
	string parameters = "";
	string description = "";
`;
}

template EntitySetter(string additional = null) {
	const char[] EntitySetter = `
this(IObjs.Obj obj) {
	auto bson = obj.serializeToBson;
	this.deserializeBson(bson);
}
@safe void set(string[string] values) {
	string[string] results;
	foreach(k, v; values) set(k, v);
}

@safe void set(T)(string key, T value) { set(key, value.toString); }
@safe void set(string key, string value) {
	switch(key) {
		case "id": id = value; break;
		case "name": name = value; break;
		case "versionid": versionId = to!size_t(value); break;
		case "iscurrent": isCurrent = to!size_t(value); break;
		case "versioned": versioned = to!size_t(value); break;
		case "versionedBy": versionedBy = value; break;
		case "title": title = value; break;
		case "validfrom": validFrom = to!size_t(value); break;
		case "validuntil": validUntil = to!size_t(value); break;
		case "created": created = to!size_t(value); break;
		case "createdby": createdBy = value; break;
		case "changed": changed = to!size_t(value); break;
		case "changedby": changedBy = value; break;
		case "accessed": accessed = to!size_t(value); break;
		case "accessedby": accessedBy = value; break;
		case "locked": locked = to!size_t(value); break;
		case "lockedby": lockedBy = value; break;
		case "deleted": deleted = to!size_t(value); break;
		case "deletedby": deletedBy = value; break;
		case "parameters": parameters = value; break;
		case "description": description = value; break;
`~additional~`
		default: break;
	}
}
`;
}

template EntityGetter(string additional = null) {
	const char[] EntityGetter = `
@safe string get(string key) {
	switch(key.toLower) {
		case "id": return id;
		case "name": return name;
		case "versionid": return to!string(versionId);
		case "iscurrent": return to!string(isCurrent);
		case "versioned": return to!string(versioned);
		case "versionedBy": return versionedBy;
		case "title": return title;
		case "validfrom": return to!string(validFrom);
		case "validuntil": return to!string(validUntil);
		case "created": return to!string(created);
		case "createdby": return createdBy;
		case "changed": return to!string(changed);
		case "changedby": return changedBy;
		case "accessed": return to!string(accessed);
		case "accessedby": return accessedBy;
		case "locked": return to!string(locked);
		case "lockedby": return lockedBy;
		case "deleted": return to!string(deleted);
		case "deletedby": return deletedBy;
		case "parameters": return parameters;
		case "description": return description;
`~additional~`
		default: return "";
	}
}`;
}

template EntitySQL(string additional = null) {
	const char[] EntitySQL = `
@safe string sql(string key) {
	switch(key.toLower) {
//		case "id": return "'%s'".format(id);
//		case "name": return "'%s'".format(name);
//		case "versionid": return versionId;
//		case "iscurrent": return isCurrent;
//		case "versioned": return versioned;
//		case "versionedBy": return "'%s'".format(versionedBy);
//		case "title": return "'%s'".format(title);
//		case "validfrom": return validFrom;
//		case "validuntil": return validUntil;
//		case "created": return created;
//		case "createdby": return "'%s'".format(createdBy);
//		case "changed": return changed;
//		case "changedby": return "'%s'".format(changedBy);
//		case "accessed": return accessed;
//		case "accessedby": return "'%s'".format(accessedBy);
//		case "locked": return locked;
//		case "lockedby": return "'%s'".format(lockedBy);
//		case "deleted": return deleted;
//		case "deletedby": return "'%s'".format(deletedBy);
//		case "parameters": return "'%s'".format(parameters);
//		case "description": return "'%s'".format(description);
`~additional~`
		default: return "'%s'".format(get(key));
	}
}`;
}

template EntityForm(string additional = null) {
	const char[] EntityForm = `
@safe string form(string key) {
	switch(key.toLower) {
//		case "id": return "%s".format(id);
//		case "name": return "%s".format(name);
//		case "versionid": return versionId;
//		case "iscurrent": return isCurrent;
//		case "versioned": return versioned;
//		case "versionedBy": return "	%s".format(versionedBy);
//		case "title": return "%s".format(title);
//		case "validfrom": return validFrom;
//		case "validuntil": return validUntil;
//		case "created": return created;
//		case "createdby": return "%s".format(createdBy);
//		case "changed": return changed;
//		case "changedby": return "%s".format(changedBy);
//		case "accessed": return accessed;
//		case "accessedby": return "%s".format(accessedBy);
//		case "locked": return locked;
//		case "lockedby": return "%s".format(lockedBy);
//		case "deleted": return deleted;
//		case "deletedby": return "%s".format(deletedBy);
//		case "parameters": return "%s".format(parameters);
//		case "description": return "%s".format(description);
`~additional~`
		default: return "%s".format(get(key));
	}
}`;
}

template EntityCProperties() {
	const char[] EntityCProperties = `
	string name = "";
	string title = "";
	size_t validFrom = 0;
	size_t validUntil = 0;
	string description = "";
`;
}
template EntityCGetter(string additional = null) {
	const char[] EntityCGetter = `
@safe string get(string key) {
	switch(key.toLower) {
		case "name": return name;
		case "title": return title;
		case "validfrom": return to!string(validFrom);
		case "validuntil": return to!string(validUntil);
		case "description": return description;
`~additional~`
		default: return "";
	}
}`;
}

template EntityAPI(string entity) {
	const char[] EntityAPI = `
	@path("/exists/:id")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	bool exists(string sessionid, string _id);

	@path("/count")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	size_t count(string sessionid);	

	@path("/count")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	@bodyParam("selector", "selector")
	size_t count(string sessionid, string[string] selector);	

	@path("/")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	`~entity~`[] all(string sessionid);	

//	@path("/")
//	@method(HTTPMethod.GET)
//	@headerParam("sessionid", "Authorization")
//	@bodyParam("selector", "selector")
//	`~entity~`[] all(string sessionid, int[string] order = null, size_t limit = 0);	
//
//	@path("/")
//	@method(HTTPMethod.GET)
//	@headerParam("sessionid", "Authorization")
//	@bodyParam("selector", "selector")
//	@queryParam("order", "order")
//	`~entity~`[] all(string sessionid, string[string] selector, int[string] order = null, size_t limit = 0);	

	@path("/values/of/:col")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	string[] values(string sessionid, string _col);

	@path("/values/of/:col")
	@headerParam("sessionid", "Authorization")
	@bodyParam("order", "order")
	@bodyParam("limit", "limit")
	string[] values(string sessionid, string _col, int[string] order, size_t limit);

	@path("/values/of/:col")
	@headerParam("sessionid", "Authorization")
	@bodyParam("selector", "selector")
	@bodyParam("order", "order")
	@bodyParam("limit", "limit")
	string[] values(string sessionid, string _col, string[string] selector, int[string] order, size_t limit);

	@method(HTTPMethod.GET)
	@path("/:id")
	@headerParam("sessionid", "Authorization")
	`~entity~` get(string sessionid, string _id);	

	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	`~entity~`[] get(string sessionid, string[] ids);

	@method(HTTPMethod.GET)
	@path("/:id/versions")
	@headerParam("sessionid", "Authorization")
	`~entity~`[] versions(string sessionid, string _id);	

//	@method(HTTPMethod.GET)
//	@path("/:id/attributes")
//	@headerParam("sessionid", "Authorization")
//	IAttributes.Attribute[] attributes(string sessionid, string _id);	
//
//	@method(HTTPMethod.GET)
//	@path("/:id/events")
//	@headerParam("sessionid", "Authorization")
//	IEvents.Event[] events(string sessionid, string _id);	

//	@method(HTTPMethod.GET)
//	@path("/:id/versions/:versionid")
//	@headerParam("sessionid", "Authorization")
//	`~entity~` version(string sessionid, string _id, string _versionid);	

	@method(HTTPMethod.POST)
	@path("/create")
	@headerParam("sessionid", "Authorization")
	`~entity~` create(string sessionid, `~entity~` entity);	

//	@method(HTTPMethod.GET)
//	@path("/:id/createdby")
//	@headerParam("sessionid", "Authorization")
//	IUsers.User createdBy(string sessionid, string _id);	

	@path("/update")
	@method(HTTPMethod.PUT)
	@headerParam("sessionid", "Authorization")
	`~entity~` update(string sessionid, `~entity~` entity);	

	@method(HTTPMethod.PUT)
	@path("/update/:id/name/:name")
	@headerParam("sessionid", "Authorization")
	void updateName(string sessionid, string _id, string _name);	

	@method(HTTPMethod.PUT)
	@path("/update/:id/title/:title")
	@headerParam("sessionid", "Authorization")
	void updateTitle(string sessionid, string _id, string _title);	

	@method(HTTPMethod.PUT)
	@path("/lock/:id")
	@headerParam("sessionid", "Authorization")
	void lock(string sessionid, string _id);	

	@method(HTTPMethod.PUT)
	@path("/lock/:id/versions/:versionid")
	@headerParam("sessionid", "Authorization")
	void lock(string sessionid, string _id, string _versionid);	

	@method(HTTPMethod.GET)
	@path("/locked/:id")
	@headerParam("sessionid", "Authorization")
	bool locked(string sessionid, string _id);	

	@method(HTTPMethod.GET)
	@path("/locked/:id/versions/:versionid")
	@headerParam("sessionid", "Authorization")
	bool locked(string sessionid, string _id, string _versionid);	

	@method(HTTPMethod.GET)
	@path("/lockedby/:id")
	@headerParam("sessionid", "Authorization")
	IUsers.User lockedBy(string sessionid, string _id);	

	@method(HTTPMethod.GET)
	@path("/lockedby/:id/versions/:versionid")
	@headerParam("sessionid", "Authorization")
	IUsers.User lockedBy(string sessionid, string _id, string _versionid);	

	@method(HTTPMethod.PUT)
	@path("/unlock/:id")
	@headerParam("sessionid", "Authorization")
	void unlock(string sessionid, string _id);	

	@method(HTTPMethod.PUT)
	@path("/unlock/:id/versions/:versionid")
	@headerParam("sessionid", "Authorization")
	void unlock(string sessionid, string _id, string _versionid);	

	@method(HTTPMethod.PUT)
	@path("/id/:id/newversion")
	@headerParam("sessionid", "Authorization")
	size_t newVersion(string sessionid, string _id);	

//	@method(HTTPMethod.GET)
//	@path("/:id/deletedby")
//	@headerParam("sessionid", "Authorization")
//	IUsers.User deletedBy(string sessionid, string _id);	

//	@method(HTTPMethod.GET)
//	@path("/:id/versions/:versionid/deletedby")
//	@headerParam("sessionid", "Authorization")
//	IUsers.User delete_(string sessionid, string _id, string _versionid);	

	@method(HTTPMethod.DELETE)
	@path("/delete/:id")
	@headerParam("sessionid", "Authorization")
	void delete_(string sessionid, string _id);	

	@method(HTTPMethod.DELETE)
	@path("/delete/:id/versions")
	@headerParam("sessionid", "Authorization")
	void deleteAllVersions(string sessionid, string _id);	

	@method(HTTPMethod.DELETE)
	@path("/delete/:id/versions/:versionid")
	@headerParam("sessionid", "Authorization")
	void delete_(string sessionid, string _id, string _versionid);	

	@method(HTTPMethod.PUT)
	@path("/undelete/:id")
	@headerParam("sessionid", "Authorization")
	void undelete(string sessionid, string _id);	

	@method(HTTPMethod.DELETE)
	@path("/undelete/:id/versions")
	@headerParam("sessionid", "Authorization")
	void undeleteAllVersions(string sessionid, string _id);	

	@method(HTTPMethod.PUT)
	@path("/undelete/:id/versions/:versionid")
	@headerParam("sessionid", "Authorization")
	void undelete(string sessionid, string _id, string _versionid);	

//	@method(HTTPMethod.PUT)
//	@path("/undelete/)
//	@headerParam("sessionid", "Authorization")
//	@bodyParam("selector", "selector")
//	void undelete(string sessionid, Bson selector);	

	@method(HTTPMethod.DELETE)
	@path("/cleanup")
	@headerParam("sessionid", "Authorization")
	void cleanUp(string sessionid);	

	@method(HTTPMethod.DELETE)
	@path("/cleanup/:id")
	@headerParam("sessionid", "Authorization")
	void cleanUp(string sessionid, string _id);	
`;
}

interface IVersions {
	// Properties
	struct Version {
		string id = "";
		size_t versionId = 1;
		size_t isCurrent = 0;
		size_t versioned = 0;
		string versionedBy = "00000000-0000-0000-0000-000000000000";
		size_t changed = 0;
		string changedBy = "00000000-0000-0000-0000-000000000000";
		size_t locked = 0;
		string lockedBy = "00000000-0000-0000-0000-000000000000";
		size_t deleted = 0;
		string deletedBy = "00000000-0000-0000-0000-000000000000";
	}
}

interface IEvents {
	// Properties
	struct Event {
		string id = "";
		string name = "";
		size_t timed = 0;
		string userid = "00000000-0000-0000-0000-000000000000";
	}
}

template ConvertAPI(string entity) {
	const char[] ConvertAPI = `
		Bson toBson() { return this.serializeToBson; }
		void fromBson(Bson bson) { return this.deserializeBson(bson); }
		Json toJson() { return this.serializeToJson; }
		Json toJson(string[] fields) {
			auto json = this.serializeToJson; 
			auto result = Json.emptyObject;
			foreach(field; fields) result[field] = json[field];
			return result;
		}
		void fromJson(Json json) { return this.deserializeJson(json); }		
		string toString() { return toJson.toString; }
	`;
}