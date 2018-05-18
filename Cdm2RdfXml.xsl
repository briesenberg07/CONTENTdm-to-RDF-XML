<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:hclsr="https://doi.org/10.70027/uwlib.55.A.2.1#" 
    xmlns:dct="http://purl.org/dc/terms/" version="2.0" 
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" 
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dpla="http://dp.la/about/map"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#">

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
            <xsl:apply-templates select="Printer"/>
            <!-- 
            <xsl:apply-templates select="ImageProductionProcess"/>
            Need appropriate property -->
            <xsl:apply-templates select="Notes"/>
            <xsl:apply-templates select="ContextualNotes"/>
            <xsl:apply-templates select="Language"/>
            <xsl:apply-templates select="SubjectsLCSH"/>
            <xsl:apply-templates select="Category"/>
            <xsl:apply-templates select="RepositoryCollection"/>
        </rdf:Description>
    </xsl:template>

    <xsl:template match="record[contains(CdmFileName, '.cpd')]" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.2#{CdmNumber}wr" 
            rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/WebResource">
            <!-- Add RDF types here -->
            <dct:title>
                <xsl:apply-templates select="Title" mode="wr"/>
            </dct:title>
            <!-- Do WebResources call for a title? -->
        </rdf:Description>
    </xsl:template>

    <!-- SOURCE RESOURCE TEMPLATES -->

    <xsl:template match="Title">
        <dct:title>
            <xsl:value-of select="."/>
        </dct:title>
    </xsl:template>
    <xsl:template match="UniformTitle">
        <xsl:if test="text()">
            <dct:alternative>
                <xsl:value-of select="."/>
            </dct:alternative>
        </xsl:if>
    </xsl:template>
    <xsl:template match="AlternateTitle">
        <xsl:if test="text()">
            <dct:alternative>
                <xsl:value-of select="."/>
            </dct:alternative>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Author">
        <xsl:if test="text()">
            <dct:creator>
                <edm:Agent>
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                    <skos:note>Author</skos:note>
                </edm:Agent>
            </dct:creator>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Illustrator">
        <xsl:if test="text()">
            <dct:contributor>
                <edm:Agent>
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                    <skos:note>Illustrator</skos:note>
                </edm:Agent>
            </dct:contributor>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Publisher">
        <dct:publisher>
            <edm:Agent>
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                </dpla:providedLabel>
                <foaf:basedNear>
                    <edm:Place>
                        <dpla:providedLabel>
                            <xsl:value-of select="../PublisherLocation"/>
                        </dpla:providedLabel>
                    </edm:Place>
                    <!-- TENTATIVELY CHANGING TO edm:place/dpla:providedLabel FROM dpla:place/rdfs:label -->
                </foaf:basedNear>
            </edm:Agent>
        </dct:publisher>
    </xsl:template>
    <xsl:template match="PublicationDate">
        <xsl:if test="text()">
            <dc:date>
                <edm:TimeSpan>
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                    <edm:begin rdf:datatype="http://id.loc.gov/datatypes/edtf/EDTF-level0">
                        <xsl:value-of select="../EarliestDate"/>
                    </edm:begin>
                    <edm:end rdf:datatype="http://id.loc.gov/datatypes/edtf/EDTF-level0">
                        <xsl:value-of select="../LatestDate"/>
                    </edm:end>
                </edm:TimeSpan>
            </dc:date>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Printer">
        <xsl:if test="text()">
            <dct:contributor>
                <edm:Agent>
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                    <skos:note>Printer</skos:note>
                </edm:Agent>
            </dct:contributor>
        </xsl:if>
    </xsl:template>
    <!-- NOT USING edm:hasType for this(?); need to find appropriate property
    <xsl:template match="ImageProductionProcess">
        <xsl:if test="text()">
            <edm:hasType>
                <xsl:value-of select="."/>
            </edm:hasType>
        </xsl:if>
    </xsl:template>
    -->
    <xsl:template match="Notes">
        <xsl:if test="text()">
            <dct:description>
                <xsl:value-of select="."/>
            </dct:description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ContextualNotes">
        <xsl:if test="text()">
            <dct:description>
                <xsl:value-of select="."/>
            </dct:description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Language">
        <dct:language>
            <xsl:value-of select="."/>
        </dct:language>
    </xsl:template>
    <xsl:template match="SubjectsLCSH">
        <dct:subject>
            <skos:Concept>
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                    <!-- Values here need to be broken into child elements using ; as delimiter; see GitHub issue -->
                    <!-- Will need conversion to URI? -->
                </dpla:providedLabel>
                <skos:inScheme>http://id.loc.gov/authorities/subjects</skos:inScheme>
            </skos:Concept>
        </dct:subject>
    </xsl:template>
    <xsl:template match="Category">
        <xsl:if test="text()">
            <edm:hasType>
                <xsl:value-of select="."/>
                <!-- Will need conversion to URI -->
            </edm:hasType>
        </xsl:if>
    </xsl:template>
    <xsl:template match="RepositoryCollection">
            <dct:isPartOf>
                <!-- Class needed here? -->
                <xsl:value-of select="."/>
            </dct:isPartOf>
    </xsl:template>

    <!-- WEB RESOURCE TEMPLATES -->

    <xsl:template match="Title" mode="wr">
        <xsl:value-of select="."/>
    </xsl:template>

</xsl:stylesheet>
