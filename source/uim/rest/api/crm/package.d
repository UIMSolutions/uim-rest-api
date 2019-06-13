module uim.rest.api.crm;

import uim.rest.api;

public import uim.rest.api.crm.addresses;
public import uim.rest.api.crm.contacts;
public import uim.rest.api.crm.invoices;
public import uim.rest.api.crm.orders;
public import uim.rest.api.crm.partners;
public import uim.rest.api.crm.products;

RestInterfaceClient!IAddresses iAddresses; 
RestInterfaceClient!IContacts iContacts; 
RestInterfaceClient!IInvoices iInvoices; 
RestInterfaceClient!IOrders iOrders; 
RestInterfaceClient!IPartners iPartners; 
RestInterfaceClient!IProducts iProducts; 
