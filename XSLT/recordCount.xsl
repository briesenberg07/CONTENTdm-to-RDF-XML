<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:marc="http://www.loc.gov/MARC21/slim"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output indent="yes"/>
    <xsl:template match="/">
        <xsl:apply-templates select="marc:collection"/>
    </xsl:template>
    <xsl:template match="marc:collection">
        <recordCount>
            <!-- this seems to have worked but I'm not sure why
            I thought I'd need to say count records with distinct *first-position* 035 fields -->
            <xsl:value-of select="count(distinct-values(marc:record[marc:datafield[@tag='035']]))"/>
        </recordCount>
    </xsl:template>
</xsl:stylesheet>