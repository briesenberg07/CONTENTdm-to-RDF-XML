<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dct="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/" xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:rel="http://id.loc.gov/vocabulary/relators/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/" xmlns:bf="http://id.loc.gov/ontologies/bibframe/"
    xmlns:ore="http://www.openarchives.org/ore/terms/" version="2.0">

    <!-- NOTE that this does not work -->

    <xsl:template match="/">
        <xsl:apply-templates select="rdf:RDF"/>
    </xsl:template>

    <xsl:template match="rdf:RDF">
        <xsl:apply-templates select="ore:Aggregation"/>
    </xsl:template>

    <xsl:template match="ore:Aggregation">
        <xsl:for-each select=".">
            <rdf:Description>
                <xsl:attribute name="rdf:about">
                    <xsl:value-of select="@rdf:about"/>
                </xsl:attribute>
            </rdf:Description>
        </xsl:for-each>
        <br/>
    </xsl:template>

</xsl:stylesheet>
