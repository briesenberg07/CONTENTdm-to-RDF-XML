<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dct="http://purl.org/dc/terms/"
    version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dpla="http://dp.la/about/map/" xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:bf="http://id.loc.gov/ontologies/bibframe/"
    xmlns:ore="http://www.openarchives.org/ore/terms/" xmlns:dcmitype="http://purl.org/dc/dcmitype/">
    <!-- xmlns:hclsr="https://doi.org/10.6069/uwlib.55.A.2.1#"
    I am not clear on the function of this namespace in the original transform. 
    Do we need equivalent here? -->
    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="metadata"/>
    </xsl:template>

    <xsl:template match="metadata">
        <xsl:result-document href="../../../Work/BMR_CaMS/AYP_XSLOutput/Ayp_SourceResource.rdf">
            <rdf:RDF>
                <xsl:apply-templates mode="sr"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="../../../Work/BMR_CaMS/AYP_XSLOutput/Ayp_Aggregation.rdf">
            <rdf:RDF>
                <xsl:apply-templates mode="ag"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="../../../Work/BMR_CaMS/AYP_XSLOutput/Ayp_WebResource.rdf">
            <rdf:RDF>
                <xsl:apply-templates mode="wr"/>
            </rdf:RDF>
        </xsl:result-document>
    </xsl:template>

    <!-- SOURCE RESOURCE TEMPLATE -->
    <xsl:template match="record" mode="sr">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}">
            <!-- Here and elsewhere, DOIs containing 'TBD' will need to be replaced with finalized DOIs -->
            <rdf:type rdf:resource="http://purl.org/dc/terms/BibliographicResource"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}">
            <rdf:type rdf:resource="http://dp.la/about/map/SourceResource"/>
        </rdf:Description>
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
        <xsl:apply-templates select="Category"/>
        <xsl:apply-templates select="Language"/>
        <xsl:apply-templates select="Repository"/>
        <dct:isPartOf rdf:resource="https://doi.org/10.6069/uwlib.TBD_Coll#physical"/>
        <xsl:apply-templates select="PhysicalDescription"/>
        <dct:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
        <dct:type rdf:resource="http://purl.org/dc/dcmitype/Text"/>
        <dct:hasFormat rdf:resource="https://doi.org/10.6069/uwlib.TBD_WR#cdm{cdmnumber}"/>
        <xsl:apply-templates select="Acquisition"/>
        <xsl:apply-templates select="OclcNumber"/>
    </xsl:template>

    <!-- AGGREGATION TEMPLATE -->
    <xsl:template match="record" mode="ag">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_Ag#cdm{cdmnumber}">
            <rdf:type rdf:resource="http://www.openarchives.org/ore/terms/Aggregation"/>
            <edm:dataProvider>
                <edm:Agent>
                    <dpla:providedLabel>University of Washington Libraries</dpla:providedLabel>
                    <skos:exactMatch rdf:resource="http://id.loc.gov/authorities/names/n79056337"/>
                </edm:Agent>
            </edm:dataProvider>
            <edm:rights rdf:resource="https://doi.org/10.6069/uwlib.TBD_Rights"/>
            <edm:isShownAt
                rdf:resource="http://digitalcollections.lib.washington.edu/cdm/ref/collection/childrens/id/{cdmnumber}"/>
            <edm:aggregatedCHO rdf:resource="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}"
            />
        </rdf:Description>
    </xsl:template>

    <!-- WEB RESOURCE TEMPLATE -->
    <xsl:template match="record" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_WR#cdm{cdmnumber}">
            <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/WebResource"/>
            <xsl:apply-templates select="Title"/>
            <xsl:apply-templates select="UniformTitle"/>
            <xsl:apply-templates select="AlternateTitle"/>
            <dc:format>application/cpd (CONTENTdm compound document)</dc:format>
            <dct:isPartOf rdf:resource="https://doi.org/10.6069/uwlib.TBD_Coll#digital"/>
            <xsl:apply-templates select="DigitalReproductionInformation"/>
            <edm:rights rdf:resource="https://doi.org/10.6069/uwlib.TBD_Rights"/>
            <dct:source rdf:resource="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}"/>
        </rdf:Description>
    </xsl:template>

    <!-- ELEMENT TEMPLATES -->
    <xsl:template match="Title" mode="sr">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}">
            <!-- Title element template is used for both SR and WR. How to make DOI different for each? Two moded templates? -->
            <dct:title>
                <xsl:value-of select="."/>
            </dct:title>
        </rdf:Description>
    </xsl:template>
    <xsl:template match="Title" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_WR#cdm{cdmnumber}">
            <!-- Attempting two moded Title templates -->
            <dct:title>
                <xsl:value-of select="."/>
            </dct:title>
        </rdf:Description>
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
        <xsl:if test="text()">
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
        </xsl:if>
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
                    <rdfs:label>
                        <xsl:value-of select="."/>
                    </rdfs:label>
                    <bf:noteType>Image production process</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Notes">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:label>
                        <xsl:value-of select="."/>
                    </rdfs:label>
                    <bf:noteType>General</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ContextualNotes">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:label>
                        <xsl:value-of select="."/>
                    </rdfs:label>
                    <bf:noteType>Contextual</bf:noteType>
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
                            <skos:inScheme rdf:resource="http://id.loc.gov/authorities/subjects"/>
                        </skos:Concept>
                    </dct:subject>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="text()">
                    <dct:subject>
                        <skos:Concept>
                            <dpla:providedLabel>
                                <xsl:value-of select="."/>
                            </dpla:providedLabel>
                            <skos:inScheme rdf:resource="http://id.loc.gov/authorities/subjects"/>
                        </skos:Concept>
                    </dct:subject>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="Category">
        <xsl:if test="text()">
            <edm:hasType
                rdf:resource="https://doi.org/10.6069/uwlib.TBD_UWVocabs#{lower-case(translate(.,' ',''))}"
            />
            <!-- Not sure if Category element is used for AYP collection. If so, are UW vocabs published? -->
        </xsl:if>
    </xsl:template>
    <xsl:template match="Language">
        <xsl:if test="text()">
            <dct:language>
                <dct:LinguisticSystem>
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                    <skos:exactMatch rdf:resource="http://id.loc.gov/vocabulary/iso639-2/eng"/>
                </dct:LinguisticSystem>
            </dct:language>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Repository">
        <xsl:if test="text()">
            <dct:rightsHolder>
                <edm:Agent>
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                </edm:Agent>
            </dct:rightsHolder>
        </xsl:if>
    </xsl:template>
    <xsl:template match="PhysicalDescription">
        <xsl:if test="text()">
            <dct:extent>
                <xsl:value-of select="."/>
            </dct:extent>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Acquisition">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:label>
                        <xsl:value-of select="."/>
                    </rdfs:label>
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
    <xsl:template match="DigitalReproductionInformation">
        <xsl:if test="text()">
            <bf:note>
                <bf:Note>
                    <rdfs:label>
                        <xsl:value-of select="."/>
                    </rdfs:label>
                    <bf:noteType>Digital reproduction information</bf:noteType>
                </bf:Note>
            </bf:note>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
