<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:j="http://www.w3.org/2005/xpath-functions"
    xmlns="http://www.w3.org/2005/xpath-functions" 
    exclude-result-prefixes="j xs" 
    version="2.0">
    <!-- IDENTITY TEMPLATE -->
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    <!-- Strings to numbers: 
        -1 for PTs which have not been worked on
        0 for undetermined
        Numbers for numbers
        Errors for other values
        -->
    <xsl:template match="j:string[@key = 'uwFormOrder']">
        <xsl:choose>
            <xsl:when test=". = ''">
                <number key="uwFormOrder">-1</number>
            </xsl:when>
            <xsl:when test=". = 'undetermined'">
                <number key="uwFormOrder">0</number>
            </xsl:when>
            <xsl:when test="matches(., '[0-9.]')">
                <number key="uwFormOrder">
                    <xsl:value-of select="."/>
                </number>
            </xsl:when>
            <xsl:otherwise>
                <number key="uwFormOrder">
                    <xsl:text>*INCORRECT FORM ORDER ENTRY*</xsl:text>
                </number>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
