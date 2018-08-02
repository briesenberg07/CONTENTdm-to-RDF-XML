<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <GroupAndCount>
            <xsl:apply-templates select="metadata"/>
        </GroupAndCount>
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

        <Photographers>
            <PhotogCount>
                <xsl:value-of select="count(distinct-values(record/Photographer[text() and . != 'Unidentified' and . != 'unidentified']))"/>
            </PhotogCount>
            <xsl:for-each-group select="record" group-by="Photographer[text() and . != 'Unidentified' and . != 'unidentified']">
                <Photographer>
                    <xsl:value-of select="Photographer"/>
                </Photographer>
            </xsl:for-each-group>
        </Photographers>

    </xsl:template>

</xsl:stylesheet>
