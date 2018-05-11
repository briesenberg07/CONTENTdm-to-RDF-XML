<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dcterms="http://purl.org/dc/terms/" version="2.0">
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
            <dcterms:title>
                <xsl:apply-templates select="Title" mode="sr"/>
            </dcterms:title>
            <xsl:if test="UniformTitle/()">
                <dcterms:title>
                    <xsl:apply-templates select="UniformTitle"/>
                </dcterms:title>
            </xsl:if>
            <xsl:if test="AlternateTitle/()">
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

    <xsl:template match="Title" mode="sr"> 
        "<xsl:value-of select="."/>"@en
    </xsl:template>
    <xsl:template match="UniformTitle">
        "<xsl:value-of select="."/>"@en
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

    <!-- WEB RESOURCE TEMPLATES -->

    <xsl:template match="Title" mode="wr">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
