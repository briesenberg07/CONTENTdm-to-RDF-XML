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
                <xsl:apply-templates select="record" mode="sr"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="../../../Work/BMR_CaMS/AYP_XSLOutput/Ayp_WebResource.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="record" mode="wr"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="../../../Work/BMR_CaMS/AYP_XSLOutput/Ayp_Aggregation.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="record" mode="ag"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="../../../Work/BMR_CaMS/AYP_XSLOutput/Ayp_Agent.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="record" mode="agt"/>
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
        <xsl:apply-templates select="Title" mode="sr"/>
        <xsl:apply-templates select="Photographer" mode="sr"/>
        <xsl:apply-templates select="DateEdtf"/>
        <xsl:apply-templates select="Notes"/>
        <xsl:apply-templates select="SubjectsLcsh"/>
        <xsl:apply-templates select="Repository" mode="sr"/>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}">
            <dct:isPartOf rdf:resource="https://doi.org/10.6069/uwlib.TBD_Coll#physical"/>
        </rdf:Description>
        <xsl:apply-templates select="PhysicalDescription"/>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}">
            <dct:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}">
            <dct:hasFormat rdf:resource="https://doi.org/10.6069/uwlib.TBD_WR#cdm{cdmnumber}"/>
        </rdf:Description>
        <xsl:apply-templates select="Acquisition"/>
    </xsl:template>

    <!-- WEB RESOURCE TEMPLATE -->
    <xsl:template match="record" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_WR#cdm{cdmnumber}">
            <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/WebResource"/>
            <xsl:apply-templates select="Title" mode="wr"/>
            <xsl:apply-templates select="UniformTitle"/>
            <xsl:apply-templates select="AlternateTitle"/>
            <dc:format>application/cpd (CONTENTdm compound document)</dc:format>
            <dct:isPartOf rdf:resource="https://doi.org/10.6069/uwlib.TBD_Coll#digital"/>
            <xsl:apply-templates select="DigitalReproductionInformation"/>
            <edm:rights rdf:resource="https://doi.org/10.6069/uwlib.TBD_Rights"/>
            <dct:source rdf:resource="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}"/>
        </rdf:Description>
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
            <edm:aggregatedCHO rdf:resource="https://doi.org/10.6069/uwlib.TBD_SR#cdm{cdmnumber}"/>
        </rdf:Description>
    </xsl:template>

    <!-- AGENT TEMPLATE -->
    <xsl:template match="record" mode="agt">
        <xsl:apply-templates select="Photographer" mode="agt"/>
        <xsl:apply-templates select="Repository" mode="agt"/>
    </xsl:template>

    <!-- ELEMENT TEMPLATES -->
    <xsl:template match="Title" mode="sr">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{../cdmnumber}">
            <dct:title>
                <xsl:value-of select="."/>
            </dct:title>
        </rdf:Description>
    </xsl:template>
    <xsl:template match="Title" mode="wr">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_WR#cdm{../cdmnumber}">
            <dct:title>
                <xsl:value-of select="."/>
            </dct:title>
        </rdf:Description>
    </xsl:template>
    <xsl:template match="Photographer" mode="sr">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{../cdmnumber}">
                <dct:creator
                    resource="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(../Photographer, ' ,.', '')}"
                />
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Photographer" mode="agt">
        <xsl:if test="text()">
            <rdf:Description
                rdf:about="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(., ' ,.', '')}">
                <rdf:type resource="http://www.europeana.eu/schemas/edm/Agent"/>
            </rdf:Description>
            <rdf:Description
                rdf:about="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(., ' ,.', '')}">
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                </dpla:providedLabel>
            </rdf:Description>
            <rdf:Description
                rdf:about="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(., ' ,.', '')}">
                <skos:note>
                    <xsl:value-of select="name()"/>
                </skos:note>
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="DateEdtf">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{../cdmnumber}">
                <dc:date rdf:datatype="http://id.loc.gov/datatypes/edtf/EDTF-level0">
                    <xsl:value-of select="."/>
                </dc:date>
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Notes">
        <xsl:if test="text()">
            <xsl:choose>
                <xsl:when test="contains(., '&lt;br&gt;&lt;br&gt;')">
                    <xsl:call-template name="Notes">
                        <xsl:with-param name="CdmNumber" select="../cdmnumber"/>
                        <xsl:with-param name="Tokens" select="tokenize(., '&lt;br&gt;&lt;br&gt;')"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <rdf:Description
                        rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{../cdmnumber}">
                        <skos:note>
                            <xsl:value-of select="."/>
                        </skos:note>
                    </rdf:Description>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <!-- SubjectsLcsh needs more work. PROBABLY need to create blank nodes to express skos:inScheme, etc. -->
    <xsl:template match="SubjectsLcsh">
        <xsl:if test="text()">
            <xsl:choose>
                <xsl:when test="contains(., '; ')">
                    <xsl:call-template name="SubjectsLcsh">
                        <xsl:with-param name="CdmNumber" select="../cdmnumber"/>
                        <xsl:with-param name="Tokens" select="tokenize(., '; ')"/>
                        <!-- Curious to see that it was okay to use the same param names here as above -->
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <rdf:Description
                        rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{../cdmnumber}">
                        <dct:subject>
                            <xsl:value-of select="."/>
                        </dct:subject>
                    </rdf:Description>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Repository" mode="sr">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{../cdmnumber}">
                <dct:rightsHolder
                    resource="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(../Repository, ', ', '')}"
                />
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Repository" mode="agt">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(../Repository, ', ', '')}">
                <rdf:type resource="http://www.europeana.eu/schemas/edm/Agent"/>
            </rdf:Description>
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(../Repository, ', ', '')}">
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                </dpla:providedLabel>
            </rdf:Description>
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.6#{translate(../Repository, ', ', '')}">
                <skos:note>
                    <xsl:value-of select="name()"/>
                </skos:note>
            </rdf:Description>
        </xsl:if>
        <!-- <edm:Agent>
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                </edm:Agent> -->
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

    <!-- NAMED TEMPLATES -->
    <xsl:template name="Notes">
        <xsl:param name="Tokens"/>
        <xsl:param name="CdmNumber"/>
        <xsl:for-each select="$Tokens">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{$CdmNumber}">
                <skos:note>
                    <xsl:value-of select="."/>
                </skos:note>
            </rdf:Description>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="SubjectsLcsh">
        <xsl:param name="Tokens"/>
        <xsl:param name="CdmNumber"/>
        <xsl:for-each select="$Tokens">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.TBD_SR#cdm{$CdmNumber}">
                <dct:subject>
                    <xsl:value-of select="."/>
                </dct:subject>
            </rdf:Description>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
