module uim.rest.api.security;

import uim.rest.api;

public import uim.rest.api.security.logins;
public import uim.rest.api.security.accounts;
public import uim.rest.api.security.passwords;
public import uim.rest.api.security.rights;
public import uim.rest.api.security.roles;
public import uim.rest.api.security.sessions;

RestInterfaceClient!ILogins iLogins; 
RestInterfaceClient!IRights iRights; 
RestInterfaceClient!IRoles iRoles; 
RestInterfaceClient!ISessions iSessions; 
RestInterfaceClient!IAccounts iAccounts; 
RestInterfaceClient!IPasswords iPasswords; 
