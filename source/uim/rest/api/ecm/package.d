module uim.rest.api.ecm;

import uim.rest.api;

public import uim.rest.api.ecm.documents;
public import uim.rest.api.ecm.emails;
public import uim.rest.api.ecm.folders;
public import uim.rest.api.ecm.workspaces;

RestInterfaceClient!IDocuments iDocuments; 
RestInterfaceClient!IEmails iEmails; 
RestInterfaceClient!IFolders iFolders; 
RestInterfaceClient!IWorkspaces iWorkspaces; 
