module uim.rest.api.server;

import uim.rest.api;

@path("/api/1/server")
interface IServer {
	@method(HTTPMethod.POST)
	@path("/log")
	void log(Bson entry);
}

