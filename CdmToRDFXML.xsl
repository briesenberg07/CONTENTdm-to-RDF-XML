<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dcterms="http://purl.org/dc/terms/" version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/">
    
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
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.1#{CdmNumber}sr">
            <rdf:type rdf:resource="http://purl.org/dc/terms/BibliographicResource"/>
            <rdf:type rdf:resource="http://dp.la/about/map/SourceResource"/>
                <xsl:apply-templates select="Title"/>
            <!-- Bring the elements down into the templates as for title, change elements below -->
                <xsl:apply-templates select="UniformTitle"/>
                
            <xsl:if test="AlternateTitle/text()">
                <!-- Bring everything down into element templates -->
                <dcterms:alternative>
                    <xsl:apply-templates select="AlternateTitle"/>
                </dcterms:alternative>
            </xsl:if>
            <xsl:if test="Author/()">
                <dcterms:creator>
                    <xsl:apply-templates select="Author"/>
                </dcterms:creator>
            </xsl:if>
            <xsl:if test="Illustrator/()">
                <dcterms:contributor>
                    <xsl:apply-templates select="Illustrator"/>
                </dcterms:contributor>
            </xsl:if>
            <dcterms:publisher>
                <xsl:apply-templates select="Publisher"/>
            </dcterms:publisher>
            <xsl:if test="PublicationDate/text()">
                <dc:date>
                    <xsl:apply-templates select="PublicationDate"/>
                </dc:date>
            </xsl:if>
        </rdf:Description>
        
    </xsl:template>

    <xsl:template match="record" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.2#{CdmNumber}wr">
            <dcterms:title>
                <xsl:apply-templates select="Title" mode="wr"/>
            </dcterms:title>
        </rdf:Description>
    </xsl:template>

    <!-- SOURCE RESOURCE TEMPLATES -->

    <xsl:template match="Title"> 
        <dcterms:title>
            "<xsl:value-of select="."/>"@en
        </dcterms:title>
    </xsl:template>
    
    <xsl:template match="UniformTitle">
        <xsl:if test="text()">
        <dcterms:alternate>
                        "<xsl:value-of select="."/>"@en
        </dcterms:alternate>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="AlternateTitle">
        "<xsl:value-of select="."/>"@en
    </xsl:template>
    <xsl:template match="Author">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="Illustrator">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="Publisher">
        <xsl:value-of select="."/>
    </xsl:template>
    <xsl:template match="PublicationDate">
        <xsl:value-of select="."/>
    </xsl:template>

    <!-- WEB RESOURCE TEMPLATES -->

    <xsl:template match="Title" mode="wr">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
