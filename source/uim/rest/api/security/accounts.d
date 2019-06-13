module uim.rest.api.security.accounts;

import uim.rest.api;

@path("/api/1/accounts/")
interface IAccounts {
	struct Account {
	@safe:
		string id;
		string name;
		string userId;
		string type = "user";

		void set(string[string] values) {
			string[string] results;
			foreach(k, v; values) set(k, v);
		}
		
		void set(T)(string key, T value) { set(key, value.toString); }
		void set(string key, string value) {
			switch(key) {
				case "id": id = value; break;
				case "name": name = value; break;
				case "userid": userId = value; break;
				case "type": type = value; break;
				default: break;
			}
		}
		
		string get(string key) {
			switch(key.toLower) {
				case "id": return id;
				case "name": return name;
				case "userid": return userId;
				case "type": return type;
				default: return "";
			}
		}
		mixin(ConvertAPI!("Account"));
	}
	
	@path("/:id")
	@method(HTTPMethod.GET)
	Account account(string _id);
}