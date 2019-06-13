module uim.rest.api.security.sessions;

import uim.rest.api;

@path("/api/1/sessions")
interface ISessions {
	struct Session {
	@safe:
		string id;
		string userId;
		string clientId;
		size_t created;
		size_t accessed;
		size_t validUntil;
		
		void set(string[string] values) {
			string[string] results;
			foreach(k, v; values) set(k, v);
		}
		
		void set(T)(string key, T value) { set(key, value.toString); }
		void set(string key, string value) {
			switch(key) {
				case "id": id = value; break;
				case "userid": userId = value; break;
				case "clientid": clientId = value; break;
				case "created": created = to!size_t(value); break;
				case "accessed": accessed = to!size_t(value); break;
				case "validuntil": validUntil = to!size_t(value); break;
				default: break;
			}
		}
		
		string get(string key) {
			switch(key.toLower) {
				case "id": return id;
				case "userid": return userId;
				case "clientid": return clientId;
				case "created": return to!string(created);
				case "accessed": return to!string(accessed);
				case "validuntil": return to!string(validUntil);
				default: return "";
			}
		}
	}
	
	@path("/")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Session[] sessions(string sessionid);
	
	@path("/:id")
	@method(HTTPMethod.GET)
	@headerParam("sessionid", "Authorization")
	Session session(string sessionid, string _id);
}