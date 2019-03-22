<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <TestFunctions>
            <xsl:apply-templates select="metadata"/>
        </TestFunctions>
    </xsl:template>

    <xsl:template match="metadata">
        <Urls>
            <CountUrls>
                <xsl:value-of select="count(distinct-values(record/ItemURL))"/>
            </CountUrls>
            <!-- Don't need to look at all of these
            <ItemUrlStrings>
                <xsl:for-each-group select="record" group-by="ItemURL">
                    <Url>
                        <xsl:value-of select="ItemURL"/>
                    </Url>
                </xsl:for-each-group>
            </ItemUrlStrings>
             -->
        </Urls>
    
        <PullHupy>
            <!-- Did it. Now to group results and just display the one string.
                To do that, put all this into a variable? -->
            <xsl:for-each-group select="record" group-by="ItemURL">
                <TheStringWeWant>
                    <xsl:value-of select="substring-before(substring-after(ItemURL, 'collection/'), '/id')"/>
                </TheStringWeWant>
            </xsl:for-each-group>
        </PullHupy>
    </xsl:template>
    
</xsl:stylesheet>
