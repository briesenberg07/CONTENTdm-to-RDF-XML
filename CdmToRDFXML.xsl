<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:dcterms="http://purl.org/dc/terms/" version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="metadata"/>
    </xsl:template>
    <xsl:template match="metadata">
        <rdf:RDF>
            <xsl:apply-templates select="record[contains(CdmFileName, '.cpd')]" mode="sr"/>
            <xsl:apply-templates select="record" mode="wr"/>
        </rdf:RDF>
    </xsl:template>

    <xsl:template match="record[contains(CdmFileName, '.cpd')]" mode="sr">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.1#{CdmNumber}sr">
            <rdf:type rdf:resource="http://purl.org/dc/terms/BibliographicResource"/>
            <rdf:type rdf:resource="http://dp.la/about/map/SourceResource"/>
            <xsl:apply-templates select="Title"/>
            <xsl:apply-templates select="UniformTitle"/>
            <xsl:apply-templates select="AlternateTitle"/>
            <xsl:apply-templates select="Author"/>
            <xsl:apply-templates select="Illustrator"/>
            <xsl:apply-templates select="Publisher"/>
            <xsl:apply-templates select="PublicationDate"/>
        </rdf:Description>
    </xsl:template>

    <xsl:template match="record[contains(CdmFileName, '.cpd')]" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.2#{CdmNumber}wr">
            <!-- Add RDF types here -->
            <dcterms:title>
                <xsl:apply-templates select="Title" mode="wr"/>
            </dcterms:title>
            <!-- Do WebResources call for a title? -->
        </rdf:Description>
    </xsl:template>

    <!-- SOURCE RESOURCE TEMPLATES -->

    <xsl:template match="Title">
        <dcterms:title> "<xsl:value-of select="."/>"@en </dcterms:title>
    </xsl:template>
    <xsl:template match="UniformTitle">
        <xsl:if test="text()">
            <dcterms:alternate> "<xsl:value-of select="."/>"@en </dcterms:alternate>
        </xsl:if>
    </xsl:template>
    <xsl:template match="AlternateTitle">
        <xsl:if test="AlternateTitle/text()">
            <dcterms:alternative> "<xsl:value-of select="."/>"@en </dcterms:alternative>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Author">
        <xsl:if test="Author/text()">
            <dcterms:creator>
                <xsl:value-of select="."/>
            </dcterms:creator>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Illustrator">
        <xsl:if test="Illustrator/text()">
            <dcterms:contributor>
                <xsl:value-of select="."/>
            </dcterms:contributor>
            <!-- Could there be confusion here between illustrators and other kinds of contributors? -->
        </xsl:if>
    </xsl:template>
    <xsl:template match="Publisher">
        <dcterms:publisher>
            <xsl:value-of select="."/>
        </dcterms:publisher>
    </xsl:template>
    <xsl:template match="PublicationDate">
        <xsl:if test="PublicationDate/text()">
            <dc:date>
                <xsl:value-of select="."/>
            </dc:date>
        </xsl:if>
    </xsl:template>

    <!-- WEB RESOURCE TEMPLATES -->

    <xsl:template match="Title" mode="wr">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
