module uim.rest.api.security.passwords;

import uim.rest.api;

@path("/api/1/passwords")
interface IPasswords {
	struct Password {
	@safe:
		string accountId;
		string password;
		
		void set(string[string] values) {
			string[string] results;
			foreach(k, v; values) set(k, v);
		}
		
		void set(T)(string key, T value) { set(key, value.toString); }
		void set(string key, string value) {
			switch(key) {
				case "accountid": accountId = value; break;
				case "password": password = value; break;
				default: break;
			}
		}
		
		string get(string key) {
			switch(key.toLower) {
				case "accountid": return accountId;
				case "password": return password;
				default: return "";
			}
		}
		mixin(ConvertAPI!("Password"));
	}
	
	@path("/")
	@method(HTTPMethod.POST)
	@headerParam("token", "Authorization")
	bool check(string token, string password);	
}