<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:template match="/">
		<html>
			<body>
				<h3 ><u><i>Developer</i></u></h3>
				<table border="1">
									<tr bgcolor="green">
						<th>
							<font style="font-family: 'Sans-Serif'; color: 'Black';font-size: 14px">ID</font>
						</th>
						<th>
							<font style="font-family: 'Sans-Serif'; color: 'Black';font-size:14px">Name</font>
						</th>
						<th>
							<font style="font-family: 'Sans-Serif'; color: 'Black';font-size: 14px">Email</font>
						</th>
						<th>
							<font style="font-family: 'Sans-Serif'; color: 'Black';font-size:14px">Company</font>
						</th>
						<th>
							<font style="font-family: 'Sans-Serif'; color: 'Black';font-size:14px">Website</font>
						</th>
						<th>
							<font style="font-family: 'Sans-Serif'; color: 'Black';font-size: 14px">Phone</font>
						</th>
					</tr>
					<xsl:for-each select="appinfo/Developer">
						<tr bgcolor="green">
							<td style="font-family: 'Sans-Serif'; color: 'Black';font-size: 14px">
								<xsl:value-of select="ID"/>
							</td>
							<td style="font-family: 'Sans-Serif'; color: 'Black';font-size:14px">
								<xsl:value-of select="Name"/>
							</td>
							<td style="font-family: 'Sans-Serif'; color: 'Black';font-size: 14px">
								<xsl:value-of select="Email"/>
							</td>
							<td style="font-family: 'Sans-Serif'; color:'Black';font-size: 14px">
								<xsl:value-of select="Company"/>
							</td>
							<td style="font-family: 'Sans-Serif'; color: 'Black';font-size: 14px">
								<xsl:value-of select="Website"/>
							</td>
							<td style="font-family: 'Sans-Serif'; color: 'Black';font-size:14px">
								<xsl:value-of select="Phone"/>
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<br></br>
				<h3 ><u><i>Apps</i></u></h3>
				<table border="2">
					<tr bgcolor="yellow">
						<th style="font-family:'Arial'; color: 'Black'; font-size: 12px">ID
						</th>
						<th style="font-family:'Arial'; color: 'Black'; font-size:12px">Name
						</th>
						<th style="font-family:'Arial'; color: 'Black'; font-size: 12px">Developer
						</th>
						<th style="font-family:'Arial'; color: 'Black'; font-size: 12px">Price
						</th>
						<th style="font-family:'Arial'; color: 'Black'; font-size: 12px">TabletCompatible
						</th>
						<th style="font-family:'Arial'; color: 'Black'; font-size: 12px">Category
						</th>
						<th style="font-family:'Arial'; color: 'Black'; font-size: 12px">Platform
						</th>
					</tr>
					<xsl:for-each select="appinfo/App">
						<xsl:variable name="counter" select="count(Platform)" as="xs:integer"/>
						<xsl:variable name="counter2" select="0" as="xs:integer"/>
						<xsl:variable name="counter1" select="$counter + $counter2"/>
						<tr bgcolor="yellow">
							<td rowspan="{$counter1}" style=" font-family:'Arial'; color: 'Black'; font-size:12px">
								<xsl:value-of select="ID"/>
							</td>
							<td rowspan="{$counter1}" style="font-family:'Arial'; color: 'Black'; font-size: 12px">
								<xsl:value-of select="Name"/>
							</td>
							<td rowspan="{$counter1}" align="center" style="font-family:'Arial'; color: 'Black'; font-size: 12px">
								<xsl:value-of select="Developer"/>
							</td>
							<td rowspan="{$counter1}" style="font-family:'Arial'; color: 'Black'; font-size: 12px">
								<xsl:value-of select="Price"/>
							</td>
							<xsl:choose>
								<xsl:when test="TabletCompatible = 'true'">
									<td rowspan="{$counter1}" align="center" style="font-family:'Arial'; color: 'Black'; font-size:12px">
										<xsl:value-of select="'Yes'"/>
									</td>
								</xsl:when>
								<xsl:otherwise>
									<td rowspan="{$counter1}" align="center" style="font-family:'Arial'; color: 'Black'; font-size:12px">
										<xsl:value-of select="TabletCompatible"/>
									</td>
								</xsl:otherwise>
							</xsl:choose>
							<td rowspan="{$counter1}" style="font-family:'Arial'; color: 'Black'; font-size:12px">
								<xsl:value-of select="Category"/>
							</td>
							<td style="font-family:'Arial'; color: 'Black'; font-size:12px">
								<xsl:value-of select="Platform[1]"/>
							</td>
						</tr>
						<xsl:for-each select="Platform">
							<xsl:if test="position()!=1">
								<tr bgcolor="Yellow">
									<td style="font-family:'Arial'; color: 'Black'; font-size:12px">
										<xsl:value-of select="."/>
									</td>
								</tr>
							</xsl:if>
						</xsl:for-each>
					</xsl:for-each>
				</table>
				<br></br>
				<h3 ><u><i>AppStats</i></u></h3>
				<table border="1">
					<tr bgcolor="grey">
						<th rowspan="2" style="font-family:'Times'; color: 'Black'; font-size: 10px">AppID
						</th>
						<th colspan="3" style="font-family:'Times'; color: 'Black'; font-size:10px">Statistics
						</th>
						<th rowspan="2" style="font-family:'Times'; color: 'Black'; font-size: 10px">LastChecked
						</th>
					</tr>
					<tr bgcolor="grey">
						<th style="font-family:'Times'; color: 'Black'; font-size: 10px">Platform
						</th>
						<th style="font-family:'Times'; color: 'Black'; font-size: 10px">Downloads
						</th>
						<th style="font-family:'Times'; color: 'Black'; font-size: 10px">Rating
						</th>
					</tr>
					<xsl:for-each select="appinfo/AppStat">
						<xsl:variable name="counter3" select="count(Statistics/Platform)" as="xs:integer"/>
						<tr bgcolor="grey">
							<td rowspan="{$counter3}" style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="AppID"/>
							</td>
							<td style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="Statistics/Platform[1]"/>
							</td>
							<td style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="format-number(Statistics/Downloads[1], '###,###')"/>
							</td>
							<td style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="Statistics/Rating[1]"/>
							</td>
							<td rowspan="{$counter3}" style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="LastChecked"/>
							</td>
						</tr>
						<xsl:for-each select="Statistics">
							<xsl:if test="position()!=1">
							<tr bgcolor="grey">
								<td style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="Platform"/>
								</td>
								<td style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="format-number(Downloads, '###,###')"/>
								</td>
								<td style="font-family:'Times'; color: 'Black'; font-size: 10px">
								<xsl:value-of select="Rating"/>
								</td>
							</tr>
							</xsl:if>
							</xsl:for-each>
							
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
