<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="x-feeder">
	<html>
	<head>
		<title><xsl:value-of select="title"/></title>
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

	<h1><xsl:value-of select="header"/></h1>
	<p><xsl:value-of select="description" disable-output-escaping="yes"/></p>

	<xsl:apply-templates select="genres" />

	</body>
	</html>
</xsl:template>
<xsl:template match="genres">
	<a href="#" onclick="toggle('genres');">Show/hide genres</a>
	<div style="display:none" id="genres">
	<table>
		<tr bgcolor="#9acd32">
			<th></th>
			<th>Genre</th>
		</tr>
		<xsl:for-each select="genre"><tr>
			<td><xsl:value-of select="position()"/></td>
			<td>
				<a>
				<xsl:attribute name="href">
					<xsl:value-of select="/x-feeder/baseurl"/>
					<xsl:value-of select="@id"/>
				</xsl:attribute>
					<xsl:value-of select="@name"/>
				</a>
			</td>
		</tr></xsl:for-each>  
	</table>
	</div>
</xsl:template>

</xsl:stylesheet>
