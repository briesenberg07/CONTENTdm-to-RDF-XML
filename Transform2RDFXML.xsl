<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" 
    xmlns:dcterms="http://purl.org/dc/terms/" 
    version="2.0">
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <xsl:apply-templates select="metadata"/>
    </xsl:template>
    
    <xsl:template match="metadata">
        <rdf:RDF>
            <xsl:apply-templates select="record" mode="sr"/>
            <xsl:apply-templates select="record" mode="wr"/>
        </rdf:RDF>
    </xsl:template>
    
    <xsl:template match="record" mode="sr">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.1#{cdmid}sr">
            <dcterms:title>
                <xsl:apply-templates select="title" mode="sr"/>
            </dcterms:title>
        </rdf:Description>
    </xsl:template>
    
    <xsl:template match="record" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.1#{cdmid}wr">
            <dcterms:title>
                <xsl:apply-templates select="title" mode="wr"/>
            </dcterms:title>
        </rdf:Description>
    </xsl:template>
    
    <xsl:template match="title" mode="sr">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="title" mode="wr">
            <xsl:value-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>