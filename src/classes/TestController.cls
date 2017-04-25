/**
* @author Salesforce.com Foundation
* @date 2014
*
* @group Accounts
*
* @description Trigger Handler on Accounts that handles ensuring the correct system flags are set on
* our special accounts (Household, One-to-One), and also detects changes on Household Account that requires
* name updating.
*/
public with sharing class TestController {
	public TestController() {

	}

	/*******************************************************************************************************
    * @description specifies whether state and country picklists are enabled in this org.
    * returns true if enabled.
    */
    public static Boolean isStateCountryPicklistsEnabled;

	/*******************************************************************************************************
    * @description Returns field describe data
    * @param objectName the name of the object to look up
    * @param mycustomFIELD the name of the field to look up
    * @return the describe field result for the given field
    * @example
    * Account a = new Account();
    */
    public static void listListViews()
    {
        MetadataService.MetadataPort service = MetadataService.createService();
        List<MetadataService.ListMetadataQuery> queries = new List<MetadataService.ListMetadataQuery>();
        MetadataService.ListMetadataQuery listView = new MetadataService.ListMetadataQuery();
        listView.type_x = 'ListView';
        queries.add(listView);
        MetadataService.FileProperties[] fileProperties = service.listMetadata(queries, 25);
        for(MetadataService.FileProperties fileProperty : fileProperties) {
            System.debug(fileProperty.fullName);
            readListView(fileProperty.fullName);
        }
    }

    public static void readListView(String name)
    {
         MetadataService.MetadataPort service = MetadataService.createService();

        // Read List View definition
        MetadataService.ListView listView =
            (MetadataService.ListView) service.readMetadata('ListView',
                new String[] { name }).getRecords()[0];
        System.debug(listView);
        if(listView.columns!=null)
            for(String column : listView.columns)
                System.debug('Column ' + column);
        if(listView.filters!=null)
            for(MetadataService.ListViewFilter filter : listView.filters)
                System.debug('Filter ' + filter.field + ' ' + filter.operation + ' ' + filter.value);

    }
}
