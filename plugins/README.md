#format

Plugin is the XML-file with next simple format:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<library name="exgalleries">
    <name>name-of-plugin</name>
    <title>Name of plugin</title>
    <link>http://link-to-gallery/</link>
    <image>http://link-to-gallery/cover.jpg</image>
    <version>1.0</version>
    <min_api>1.0</min_api>
    <description><![CDATA[
	Description of site.
    ]]></description>
    <author>Author and his email</author>
    <jsmain><![CDATA[
    ```
    ```javascript
function GetItem(id) {
	var res=false;
	var url = Interactor.GetLink(id);
	Interactor.Print("Update item " + id);//Interactor.Print writes to console out.
	var req = Interactor.RequestGet(url);
	var pattern = /REGEXP PATTERN FOR SEARCH LINKS TO PAGES WITH PICTURES/gi;
	while ((find = pattern.exec(req)) != null) {
		if (Interactor.FindIdByLink(find[1]) == 0) {//LINK FOUND, CHECK IF IT ALREADY EXISTS
			res = Interactor.AddItem(id, find[1]);
			//Creates the item. Should get next arguments:
			//ID - id of parent item, ARG1 - link to page
			Interactor.Print("New picture ID=" + res + ", URL=" + find[1]);
		} else {
			Interactor.Print("Skip because of exists item with URL=" + find[1]);
		}
	}
	if(!res){
		var parent = Interactor.GetParentId(id);//GETTING ID OF PARENT ITEM
		var pattern = /REGEXP PATTERN FOR SEARCH LINK TO PICTURE AND METAINFO WITHIN PAGE/i;
		if (find = req.match(pattern)) { // search for link to next part of
			res = Interactor.SaveItem(id, parent, find[1], find[3], find[4],
				find[2], 0);
				//Saves the item. Should get next arguments:
				//ID - id of item, PARENT - id of parent item, ARG2 - link to picture,
				//ARG3 - title of picture, ARG4 - author, ARG5 - description,
				//ARG6 - creation date
		}
	}
};
```
```xml
        ]]>
    </jsmain>
    <keywords>keywords</keywords>
    <gallery
        name="gallery1"
        link="http://link-to-site/path-to-gallery1/"
        image="http://link-to-site/path-to-gallery1/cover-of-gallery1.jpg">
		Name of gallery 1
    </gallery>
    <gallery
        name="gallery2"
        link="http://link-to-site/path-to-gallery2/"
        image="http://link-to-site/path-to-gallery2/cover-of-gallery2.jpg">
		Name of gallery 2
    </gallery>
</library>
