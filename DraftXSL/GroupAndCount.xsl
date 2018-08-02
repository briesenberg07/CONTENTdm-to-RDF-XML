<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">

    <xsl:output indent="yes"/>

    <!-- Haven't got any counting to work yet -->

    <xsl:template match="/">
        <GroupingCollections>
            <xsl:apply-templates select="metadata"/>
        </GroupingCollections>
    </xsl:template>

    <xsl:template match="metadata">

        <DigitalCollections>
            <!-- This variable use does not work! -->
            <xsl:variable name="dcCount">
            <xsl:for-each-group select="record" group-by="DigitalCollection">
                <DigitalCollection>
                    <xsl:value-of select="DigitalCollection"/>
                </DigitalCollection>
            </xsl:for-each-group>
            </xsl:variable>
            <DigiCollCount>
                <xsl:value-of select="count($dcCount)"/>
            </DigiCollCount>
        </DigitalCollections>

        <PhysicalCollections>
            <xsl:for-each-group select="record" group-by="RepositoryCollection">
                <RepositoryCollection>
                    <xsl:value-of select="RepositoryCollection"/>
                </RepositoryCollection>
            </xsl:for-each-group>
        </PhysicalCollections>
    </xsl:template>

</xsl:stylesheet>
