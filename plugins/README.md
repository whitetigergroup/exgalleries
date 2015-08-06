#information

<?xml version="1.0" encoding="UTF-8"?>
<library name="exgalleries">

    <name>
art-of-fantasy
    </name>

    <title>
Art of Fantasy
    </title>

    <link>
http://art-of-fantasy.org/
    </link>
    <image>
http://art-of-fantasy.org/uploads_categories/Fairy.jpg
    </image>

    <version>
1.0
    </version>

    <min_api>
1.0
    </min_api>

    <description><![CDATA[
	Shows beautiful pictures from the Art-of-fantasy site.
	]]>
    </description>

    <author>
Somebody ;-)
    </author>

    <jsmain><![CDATA[
function GetItem(id) {
	var res=false;
	var url = Interactor.GetLink(id);
	Interactor.Print("Update item " + id);
	var req = Interactor.RequestGet(url);
	var pattern = /<br \/><a href="([^"]*?)" title=".*?".*?>[\s\S]*?<\/tbody>/gi;
	while ((find = pattern.exec(req)) != null) {
		if (Interactor.FindIdByLink(find[1]) == 0) {
			res = Interactor.AddItem(id, find[1]);
			Interactor.Print("New picture ID=" + res + ", URL=" + find[1]);
		} else {
			Interactor.Print("Skip because of exists item with URL=" + find[1]);
		}
	}
	if(!res){
		var parent = Interactor.GetParentId(id);
		var pattern = /<table border="0">\n<tr><td class="det"><img .*?src='(.*?)'.*?>[\s\S]*?<div .*?><noindex>(.*?)<\/noindex>[\s\S]*?<h2 class="imagetitle">(.*?)<\/h2>.*?\~by <a .*?>(.*?)<\/a>.*?href="(.*?)"/i;
		if (find = req.match(pattern)) { // search for link to next part of
			res = Interactor.SaveItem(id, parent, find[1], find[3], find[4],
				find[2], 0);
		}
	}
};        
        ]]>
    </jsmain>

    <keywords>
оператор татинком нсс ncc ростелеком ростелеком-волга
    </keywords>

    <gallery
        name="godsart"
        link="http://art-of-fantasy.org/pics/imagelist/24/"
        image="http://art-of-fantasy.org/uploads_categories/20090901130034.jpg" >
Gods art
    </gallery>
