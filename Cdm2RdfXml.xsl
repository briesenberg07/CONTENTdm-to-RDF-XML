<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:hclsr="https://doi.org/10.70027/uwlib.55.A.2.1#" xmlns:dct="http://purl.org/dc/terms/"
    version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dpla="http://dp.la/about/map/" xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:bf="http://id.loc.gov/ontologies/bibframe/"
    xmlns:ore="http://www.openarchives.org/ore/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="metadata"/>
    </xsl:template>
    <xsl:template match="metadata">
        <xsl:result-document href="hcl_SourceResource.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="record[contains(CdmFileName, '.cpd')]" mode="sr"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="hcl_Aggregation.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="record[contains(CdmFileName, '.cpd')]" mode="ag"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="hcl_WebResource.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="record[contains(CdmFileName, '.cpd')]" mode="wr"/>
            </rdf:RDF>
        </xsl:result-document>
    </xsl:template>

    <!-- SOURCE RESOURCE TEMPLATE -->
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
            <xsl:apply-templates select="ImageProductionProcess"/>
            <xsl:apply-templates select="Notes"/>
            <xsl:apply-templates select="ContextualNotes"/>
            <xsl:apply-templates select="SubjectsLCSH"/>
            <!-- <xsl:apply-templates select="Category"/> -->
            <xsl:apply-templates select="Language"/>
            <xsl:apply-templates select="Repository"/>
            <xsl:apply-templates select="RepositoryCollection"/>
            <xsl:apply-templates select="PhysicalDescription"/>
            <xsl:apply-templates select="Acquisition"/>
            <xsl:apply-templates select="OclcNumber"/>
        </rdf:Description>
    </xsl:template>

    <!-- AGGREGATION TEMPLATE -->
    <xsl:template match="record[contains(CdmFileName, '.cpd')]" mode="ag">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.2#{CdmNumber}ag">
            <rdf:type rdf:resource="http://www.openarchives.org/ore/terms/Aggregation"/>
            <edm:dataProvider>
                <edm:Agent>
                    <dpla:providedLabel>University of Washington Libraries</dpla:providedLabel>
                    <!-- <skos:exactMatch>NEED URI HERE</skos:exactMatch> -->
                </edm:Agent>
            </edm:dataProvider>
            <edm:rights>https://doi.org/10.70027/uwlib.55.A.2.4</edm:rights>
            <edm:isShownAt>https://doi.org/10.70027/uwlib.55.A.2.3#<xsl:value-of
                    select="../CdmNumber"/></edm:isShownAt>
            <!-- Not pushing Cdm number through here for some reason. -->
            <edm:aggregatedCHO>https://doi.org/10.70027/uwlib.55.A.2.1#<xsl:value-of
                    select="../CdmNumber"/></edm:aggregatedCHO>
            <!-- Not pushing Cdm number through here for some reason. -->
        </rdf:Description>
    </xsl:template>

    <!-- WEB RESOURCE TEMPLATE -->
    <xsl:template match="record[contains(CdmFileName, '.cpd')]" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.70027/uwlib.55.A.2.3#{CdmNumber}wr">
            <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/WebResource"/>
            <xsl:apply-templates select="Title"/>
            <xsl:apply-templates select="UniformTitle"/>
            <xsl:apply-templates select="AlternateTitle"/>
            <!-- <dc:format></dc:format>
            <dct:format></dct:format>
            Need MIME types, etc. for format properties here -->
            <xsl:apply-templates select="DigitalCollection"/>
            <xsl:apply-templates select="DigitalReproductionInformation"/>
            <edm:rights>https://doi.org/10.70027/uwlib.55.A.2.4</edm:rights>
            <dct:source>https://doi.org/10.70027/uwlib.55.A.2.1#<xsl:value-of select="../CdmNumber"
                /></dct:source>
        </rdf:Description>
    </xsl:template>

    <!-- ELEMENT TEMPLATES -->
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
    <xsl:template match="ImageProductionProcess">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:Label>
                        <xsl:value-of select="."/>
                    </rdfs:Label>
                    <bf:noteType>Image production process</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Notes">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:Label>
                        <xsl:value-of select="."/>
                    </rdfs:Label>
                    <bf:noteType>Notes</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ContextualNotes">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:Label>
                        <xsl:value-of select="."/>
                    </rdfs:Label>
                    <bf:noteType>Contextual notes</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
    <xsl:template match="SubjectsLCSH">
        <xsl:choose>
            <xsl:when test="contains(., ';')">
                <xsl:for-each select="tokenize(., '; ')">
                    <dct:subject>
                        <skos:Concept>
                            <dpla:providedLabel>
                                <xsl:value-of select="."/>
                            </dpla:providedLabel>
                            <skos:inScheme>http://id.loc.gov/authorities/subjects</skos:inScheme>
                        </skos:Concept>
                    </dct:subject>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <dct:subject>
                    <skos:Concept>
                        <dpla:providedLabel>
                            <xsl:value-of select="."/>
                        </dpla:providedLabel>
                        <skos:inScheme>http://id.loc.gov/authorities/subjects</skos:inScheme>
                    </skos:Concept>
                </dct:subject>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- <xsl:template match="Category">
        <xsl:if test="text()">
        </xsl:if>
    </xsl:template> 
    Needs rdf property -->
    <xsl:template match="Language">
        <dct:language>
            <dct:LinguisticSystem>
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                </dpla:providedLabel>
            </dct:LinguisticSystem>
        </dct:language>
    </xsl:template>
    <xsl:template match="Repository">
        <dct:rightsHolder>
            <edm:Agent>
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                </dpla:providedLabel>
            </edm:Agent>
        </dct:rightsHolder>
    </xsl:template>
    <xsl:template match="RepositoryCollection">
        <dct:isPartOf>
            <dcmitype:Collection>
                <dct:title>
                    <xsl:value-of select="."/>
                </dct:title>
            </dcmitype:Collection>
        </dct:isPartOf>
    </xsl:template>
    <xsl:template match="PhysicalDescription">
        <dct:extent>
            <xsl:value-of select="."/>
        </dct:extent>
        <dcmitype>StillImage</dcmitype>
        <dcmitype>Text</dcmitype>
        <dct:hasFormat>https://doi.org/10.70027/uwlib.55.A.2.3#<xsl:value-of select="../CdmNumber"
            /></dct:hasFormat>
    </xsl:template>
    <xsl:template match="Acquisition">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:Label>
                        <xsl:value-of select="."/>
                    </rdfs:Label>
                    <bf:noteType>Acquisition</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
    <xsl:template match="OclcNumber">
        <xsl:if test="text()">
            <dct:identifier>
                <xsl:value-of select="."/>
            </dct:identifier>
        </xsl:if>
    </xsl:template>
    <xsl:template match="DigitalCollection">
        <dct:isPartOf>
            <dcmitype:Collection>
                <dct:title>
                    <xsl:value-of select="."/>
                </dct:title>
                <edm:isShownAt>http://content.lib.washington.edu/childrensweb/index.html</edm:isShownAt>
            </dcmitype:Collection>
        </dct:isPartOf>
    </xsl:template>
    <xsl:template match="DigitalReproductionInformation">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:Label>
                        <xsl:value-of select="."/>
                    </rdfs:Label>
                    <bf:noteType>Digital reproduction information</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
