<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
	<html>
	<head>
		<title><xsl:value-of select="//title"/></title>
		<script type="text/javascript"><![CDATA[
			function toggle(id) {
				var e = document.getElementById(id);
				if(e.style.display == 'block')
					e.style.display = 'none';
				else
					e.style.display = 'block';
			}
		]]></script>
		<style type="text/css"><![CDATA[
			body{
				font-family: Arial,Tahoma;
			}
			div{
				background-color: yellow;
			}
		]]></style>
	</head>
	<body>

	<h1><xsl:value-of select="//title"/></h1>
	<p><xsl:value-of select="//description" disable-output-escaping="yes"/></p>

	<xsl:apply-templates select="galleries" />

	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
