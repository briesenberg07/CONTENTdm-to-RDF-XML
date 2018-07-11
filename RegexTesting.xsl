<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dct="http://purl.org/dc/terms/"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="metadata"/>
    </xsl:template>
    
    <xsl:template match="metadata">
        <xsl:result-document href="/Users/ries07/Work/BMR_CaMS/AYP_XSLOutput/TestingRegex.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="record"/>
            </rdf:RDF>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="record">
        <xsl:apply-templates select="RepositoryCollection"/>
    </xsl:template>
    
    <xsl:template match="RepositoryCollection">
        <xsl:if test="text()">
            <xsl:call-template name="CollectionName">
                <xsl:with-param name="ColName" select="."/>
                <!-- BELOW, HOW TO USE AN XSL FUNCTION + REGEX TO PULL ONLY "PH COLL ####" FROM THE VALUE OF ELEMENT RepositoryCollection? -->
                <xsl:with-param name="Regex" select="translate(., '. ', '')"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
    
    <xsl:template name="CollectionName">
        <xsl:param name="Regex"/>
        <xsl:param name="ColName"/>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.4{$Regex}">
            <dct:title><xsl:value-of select="$ColName"/></dct:title>
        </rdf:Description>
    </xsl:template>
</xsl:stylesheet>