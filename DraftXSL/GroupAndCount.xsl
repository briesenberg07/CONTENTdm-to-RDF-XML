<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <GroupAndCountCollections>
            <xsl:apply-templates select="metadata"/>
        </GroupAndCountCollections>
    </xsl:template>

    <xsl:template match="metadata">

        <DigitalCollections>
            <DigiCollCount>
                <xsl:value-of select="count(distinct-values(record/DigitalCollection))"/>
            </DigiCollCount>
            <xsl:for-each-group select="record" group-by="DigitalCollection">
                <DigitalCollection>
                    <xsl:value-of select="DigitalCollection"/>
                </DigitalCollection>
            </xsl:for-each-group>
        </DigitalCollections>

        <PhysicalCollections>
            <PhysicalCollCount>
                <xsl:value-of select="count(distinct-values(record/RepositoryCollection))"/>
            </PhysicalCollCount>
            <xsl:for-each-group select="record" group-by="RepositoryCollection">
                <RepositoryCollection>
                    <xsl:value-of select="RepositoryCollection"/>
                </RepositoryCollection>
            </xsl:for-each-group>
        </PhysicalCollections>
    </xsl:template>

</xsl:stylesheet>
