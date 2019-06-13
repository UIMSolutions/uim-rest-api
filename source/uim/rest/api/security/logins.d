module uim.rest.api.security.logins;

import uim.rest.api;

@path("/api/1/")
interface ILogins {
	struct Login {
	@safe:
		string id;
		string accountId;
		string peer;
		size_t timestamp = 0;
		
		void set(string[string] values) {
			string[string] results;
			foreach(k, v; values) set(k, v);
		}
		
		void set(T)(string key, T value) { set(key, value.toString); }
		void set(string key, string value) {
			switch(key) {
				case "id": id = value; break;
				case "accountid": accountId = value; break;
				case "peer": peer = value; break;
				case "timestamp": timestamp = to!size_t(value); break;
				default: break;
			}
		}
		
		string get(string key) {
			switch(key.toLower) {
				case "id": return id;
				case "accountid": return accountId;
				case "peer": return peer;
				case "timestamp": return to!string(timestamp);
				default: return "";
			}
		}
		mixin(ConvertAPI!("Login"));
	}
	
	@path("/login/:account")
	@method(HTTPMethod.GET)
	string login(string _account);
	
	@path("/login")
	@headerParam("token", "Authorization")
	@bodyParam("pw", "input-pw")
	@method(HTTPMethod.POST)
	string login(string token, string pw);
	
	@path("/logout")
	@method(HTTPMethod.DELETE)
	@headerParam("sessionid", "Authorization")
	string logout(string sessionid);
}