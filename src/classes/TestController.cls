public with sharing class TestController {
	public TestController() {
		
	}


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