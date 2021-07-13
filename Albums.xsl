<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name="groupby" match="/Albums/Album" use="Country"/>


<xsl:template match="/">
<html dir="rtl">
<body>
	<xsl:for-each select="Albums/Album[generate-id(.)= generate-id(key('groupby', Country)[1])]">
		<h2 style="color:green; text-decoration: underline;"><xsl:value-of select="Country"/></h2>
		<table border ="1">
		<tr bgcolor ="gray">
			<th>שם האומן </th>
			<th>אלבום</th>
			<th>שנה</th>
			<th>חברה </th>
			<th>לינק</th>
			<th>מחיר</th>
		</tr>
		<xsl:for-each select="key('groupby', Country)">		
				<tr>
					<td><p style="color:red;"><xsl:value-of select="Artist"/> </p></td>
					<td><xsl:value-of select="Name"/></td>
					<td><xsl:value-of select="concat(substring(concat(Date, '01', '01'), 1, 4), '-', substring(concat(Date, '01', '01'), 5, 2), '-', substring(concat(Date, '01', '01'), 7, 2))"/></td>
					<td><xsl:value-of select="Company"/></td>
					<td><a href="url"><xsl:value-of select="wiki"/></a></td>
					<td><xsl:value-of select="Price"/></td>
				</tr>
		</xsl:for-each>
		<tr>
		<th colspan="5">סה"כ אלבומים</th>
			<td><script type="text/javascript" src="SomePath/SomeFileName.js"></script></td>
		</tr>
		</table>
	</xsl:for-each>
</body>
</html>
</xsl:template>

</xsl:stylesheet>




