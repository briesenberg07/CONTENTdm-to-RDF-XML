<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/2005/xpath-functions" xmlns:j="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="j" version="3.0">
    <xsl:strip-space elements="*"/>
    <!-- IDENTITY TEMPLATE -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    <!-- Fix default array in RDA profile -->
    <xsl:template match="j:array[@key = 'defaults']">
        <xsl:choose>
            <xsl:when test="j:map/j:string[2]">
                <xsl:copy-of select="."/>
            </xsl:when>
            <xsl:otherwise>
                <array key="defaults">
                    <map>
                        <xsl:for-each select="j:map">
                            <xsl:for-each select="j:string[@key = 'defaultURI']">
                                <xsl:copy-of select="."/>
                            </xsl:for-each>
                            <xsl:for-each select="j:string[@key = 'defaultLiteral']">
                                <xsl:copy-of select="."/>
                            </xsl:for-each>
                        </xsl:for-each>
                    </map>
                </array>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
