module uim.rest.api.directory;

import uim.rest.api;

public import uim.rest.api.directory.clients;
public import uim.rest.api.directory.groups;
public import uim.rest.api.directory.users;

RestInterfaceClient!IGroups iGroups; 
RestInterfaceClient!IUsers iUsers; 
RestInterfaceClient!IClients iClients; 
