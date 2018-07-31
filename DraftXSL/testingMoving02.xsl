<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dct="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/" xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    version="2.0" xmlns:rel="http://id.loc.gov/vocabulary/relators/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/" xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:foaf="http://xmlns.com/foaf/0.1/">

    <xsl:output indent="yes"/>

    <!-- template for result documents -->
    <xsl:template match="/">
        <xsl:result-document href="XslOutput/sourceResource.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="metadata" mode="sr"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="XslOutput/webResource.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="metadata" mode="wr"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="XslOutput/aggregation.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="metadata" mode="agg"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="XslOutput/rights.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="metadata" mode="rights"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="XslOutput/agents.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="metadata" mode="agent"/>
            </rdf:RDF>
        </xsl:result-document>
        <xsl:result-document href="XslOutput/collection.rdf">
            <rdf:RDF>
                <xsl:apply-templates select="metadata" mode="collection"/>
            </rdf:RDF>
        </xsl:result-document>
    </xsl:template>

    <!-- template for source resource file -->
    <xsl:template match="metadata" mode="sr">
        <xsl:apply-templates select="record" mode="sr"/>
    </xsl:template>

    <!-- template for web resource file -->
    <xsl:template match="metadata" mode="wr">
        <xsl:apply-templates select="record" mode="wr"/>
    </xsl:template>

    <!-- template for aggregation file -->
    <xsl:template match="metadata" mode="agg">
        <xsl:apply-templates select="record" mode="agg"/>
    </xsl:template>

    <!-- template for agent file -->
    <xsl:template match="metadata" mode="agent">
        <xsl:for-each-group select="record" group-by="Photographer[text() != '' and text() != 'Unidentified' and text() != 'unidentified']">
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/Agent"/>
            </rdf:Description>
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <dpla:providedLabel>
                    <xsl:value-of select="current-grouping-key()"/>
                </dpla:providedLabel>
            </rdf:Description>
        </xsl:for-each-group>
        <xsl:for-each-group select="record" group-by="Repository[text() != '']">
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/Agent"/>
            </rdf:Description>
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <dpla:providedLabel>
                    <xsl:value-of select="current-grouping-key()"/>
                </dpla:providedLabel>
            </rdf:Description>
        </xsl:for-each-group>
        <xsl:for-each-group select="record" group-by="StudioName[text() != '']">
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/Agent"/>
            </rdf:Description>
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <dpla:providedLabel>
                    <xsl:value-of select="current-grouping-key()"/>
                </dpla:providedLabel>
            </rdf:Description>
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <dct:description>Studio</dct:description>
            </rdf:Description>
            <rdf:Description
                rdf:about="{concat('http://doi.org/10.6069/uwlib.55.A.3.6#',translate(current-grouping-key(),' '',''.',''))}">
                <foaf:based_near>
                    <xsl:value-of select="StudioLocation"/>
                </foaf:based_near>
            </rdf:Description>
        </xsl:for-each-group>
    </xsl:template>

    <!-- template for rights file -->
    <xsl:template match="metadata" mode="rights">
        <xsl:for-each-group select="record" group-by="Restrictions">
            <rdf:Description rdf:about="http://doi.org/10.6069/uwlib.55.A.3.5#restrictions">
                <rdf:type rdf:resource="http://purl.org/dc/terms/RightsStatement"/>
            </rdf:Description>
            <rdf:Description rdf:about="http://doi.org/10.6069/uwlib.55.A.3.5#restrictions">
                <skos:prefLabel>
                    <xsl:value-of select="current-grouping-key()"/>
                </skos:prefLabel>
            </rdf:Description>
        </xsl:for-each-group>
        <xsl:for-each-group select="record" group-by="OrderingInformation">
            <rdf:Description rdf:about="http://doi.org/10.6069/uwlib.55.A.3.5#orderingInformation">
                <rdf:type rdf:resource="http://purl.org/dc/terms/RightsStatement"/>
            </rdf:Description>
            <rdf:Description rdf:about="http://doi.org/10.6069/uwlib.55.A.3.5#orderingInformation">
                <skos:note>
                    <xsl:value-of select="current-grouping-key()"/>
                </skos:note>
            </rdf:Description>
        </xsl:for-each-group>
    </xsl:template>

    <!-- template for collection file -->
    <xsl:template match="metadata" mode="collection">
        <xsl:for-each-group select="record" group-by="RepositoryCollection">
            <rdf:Description
                rdf:about="http://doi.org/10.6069/uwlib.55.A.3.4#{translate(current-grouping-key(),' ','')}">
                <rdf:type rdf:resource="http://purl.org/dc/dcmitype/Collection"/>
            </rdf:Description>
            <rdf:Description
                rdf:about="http://doi.org/10.6069/uwlib.55.A.3.4#{translate(current-grouping-key(),' ','')}">
                <dct:title>
                    <xsl:value-of select="current-grouping-key()"/>
                </dct:title>
            </rdf:Description>
        </xsl:for-each-group>
        <xsl:for-each-group select="record" group-by="DigitalCollection">
            <rdf:Description
                rdf:about="http://doi.org/10.6069/uwlib.55.A.3.4#{translate(current-grouping-key(),' ','')}">
                <rdf:type rdf:resource="http://purl.org/dc/dcmitype/Collection"/>
            </rdf:Description>
            <rdf:Description
                rdf:about="http://doi.org/10.6069/uwlib.55.A.3.4#{translate(current-grouping-key(),' ','')}">
                <dct:title>
                    <xsl:value-of select="current-grouping-key()"/>
                </dct:title>
            </rdf:Description>
        </xsl:for-each-group>
    </xsl:template>

    <!-- sub-template for source resource file -->
    <xsl:template match="record" mode="sr">
        <!-- below require simple outputs of literals or URIs already in XML metadata or in this transform -->
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{cdmnumber}">
            <xsl:apply-templates select="Title"/>
        </rdf:Description>
        <xsl:apply-templates select="Notes"/>
        <xsl:apply-templates select="NegativeNumber"/>
        <xsl:apply-templates select="ObjectType"/>
        <xsl:apply-templates select="PhysicalDescription"/>
        <xsl:apply-templates select="PhotographersReferenceNumber"/>
        <!-- below require nodes with locally minted IRIs -->
        <xsl:apply-templates select="Photographer"/>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{cdmnumber}">
            <xsl:apply-templates select="Repository" mode="sr"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{cdmnumber}">
            <xsl:apply-templates select="RepositoryCollection"/>
        </rdf:Description>
        <xsl:apply-templates select="StudioName"/>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="Type"/>
        </rdf:Description>
        <!-- below require blank nodes -->
        <xsl:apply-templates select="DateEdtf">
            <xsl:with-param name="dateID" select="concat('D', generate-id())"/>
        </xsl:apply-templates>
        <xsl:apply-templates select="SubjectsLctgm"/>
        <xsl:apply-templates select="SubjectsLcsh"/>
        <xsl:apply-templates select="LocationDepicted">
            <xsl:with-param name="locID" select="concat('L', generate-id())"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- sub-template for web resource file -->
    <xsl:template match="record" mode="wr">
        <!-- below require simple outputs of literals or URIs already in XML metadata or in this transform -->
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/WebResource"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="Title"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="OrderNumber"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="DigitalReproductionInformation"/>
        </rdf:Description>
        <!-- below require nodes with locally minted IRIs -->
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="DigitalCollection"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="OrderingInformation"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="RightsUri"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.3#cdm{cdmnumber}">
            <xsl:apply-templates select="Restrictions"/>
        </rdf:Description>
        <!-- Are any blank nodes required here? -->

    </xsl:template>

    <!-- sub-template for aggregation file -->
    <xsl:template match="record" mode="agg">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.2#cdm{cdmnumber}">
            <rdf:type rdf:resource="http://www.openarchives.org/ore/terms/Aggregation"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.2#cdm{cdmnumber}">
            <xsl:apply-templates select="Repository" mode="agg"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.2#cdm{cdmnumber}">
            <xsl:apply-templates select="Restrictions"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.2#cdm{cdmnumber}">
            <xsl:apply-templates select="ItemURL"/>
        </rdf:Description>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.2#cdm{cdmnumber}">
            <xsl:apply-templates select="OrderingInformation"/>
        </rdf:Description>
    </xsl:template>

    <!-- templates by CONTENTdm element -->
    <xsl:template match="Title">
        <dct:title>
            <xsl:value-of select="."/>
        </dct:title>
    </xsl:template>
    <xsl:template match="Photographer">
        <xsl:if test="(text()) and (. != 'Unidentified') and (. != 'unidentified')">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{cdmnumber}">
                <rel:pht
                    rdf:resource="{concat('https:/doi.org/10.6069/uwlib.55.A.3.6#',translate(.,' '',''.',''))}"
                />
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="RepositoryCollection">
        <dct:isPartOf
            rdf:resource="{concat('https:/doi.org/10.6069/uwlib.55.A.3.4#',translate(.,' ',''))}"/>
    </xsl:template>
    <xsl:template match="DateEdtf">
        <xsl:param name="dateID"/>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{../cdmnumber}">
            <dct:date rdf:nodeID="{$dateID}"/>
        </rdf:Description>
        <rdf:Description rdf:nodeID="{$dateID}">
            <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/TimeSpan"/>
        </rdf:Description>
        <rdf:Description rdf:nodeID="{$dateID}">
            <skos:prefLabel>
                <xsl:value-of select="."/>
            </skos:prefLabel>
        </rdf:Description>
        <rdf:Description rdf:nodeID="{$dateID}">
            <dpla:providedLabel>
                <xsl:value-of select="following-sibling::Date"/>
            </dpla:providedLabel>
        </rdf:Description>
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
                        rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{../cdmnumber}">
                        <dct:description>
                            <xsl:value-of select="."/>
                        </dct:description>
                    </rdf:Description>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xsl:template match="SubjectsLctgm">
        <xsl:if test="text()">
            <xsl:choose>
                <xsl:when test="contains(., ';')">
                    <xsl:call-template name="SubjectsLctgm">
                        <xsl:with-param name="Tokens" select="tokenize(., ';')"/>
                        <xsl:with-param name="CdmNumber" select="../cdmnumber"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="lctgmID" select="concat('S1', generate-id())"/>
                    <rdf:Description
                        rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{../cdmnumber}">
                        <dct:subject rdf:nodeID="{$lctgmID}"/>
                    </rdf:Description>
                    <rdf:Description rdf:nodeID="{$lctgmID}">
                        <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
                    </rdf:Description>
                    <rdf:Description rdf:nodeID="{$lctgmID}">
                        <skos:inScheme rdf:resource="http://id.loc.gov/vocabulary/graphicMaterials"
                        />
                    </rdf:Description>
                    <rdf:Description rdf:nodeID="{$lctgmID}">
                        <dpla:providedLabel>
                            <xsl:value-of select="."/>
                        </dpla:providedLabel>
                    </rdf:Description>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xsl:template match="SubjectsLcsh">
        <xsl:if test="text()">
        <xsl:choose>
            <xsl:when test="contains(., ';')">
                <xsl:call-template name="SubjectsLcsh">
                    <xsl:with-param name="Tokens" select="tokenize(., ';')"/>
                    <xsl:with-param name="CdmNumber" select="../cdmnumber"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="lcshID" select="concat('S2', generate-id())"/>
                <rdf:Description
                    rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{../cdmnumber}">
                    <dct:subject rdf:nodeID="{$lcshID}"/>
                </rdf:Description>
                <rdf:Description rdf:nodeID="{$lcshID}">
                    <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
                </rdf:Description>
                <rdf:Description rdf:nodeID="{$lcshID}">
                    <skos:inScheme rdf:resource="http://id.loc.gov/authorities/subjects"/>
                </rdf:Description>
                <rdf:Description rdf:nodeID="{$lcshID}">
                    <dpla:providedLabel>
                        <xsl:value-of select="."/>
                    </dpla:providedLabel>
                </rdf:Description>
            </xsl:otherwise>
        </xsl:choose>
        </xsl:if>
    </xsl:template>
    <xsl:template match="LocationDepicted">
        <xsl:param name="locID"/>
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{../cdmnumber}">
            <dct:spatial rdf:nodeID="{$locID}"/>
        </rdf:Description>
        <rdf:Description rdf:nodeID="{$locID}">
            <rdf:type rdf:resource="http://www.europeana.eu/schemas/edm/Place"/>
        </rdf:Description>
        <rdf:Description rdf:nodeID="{$locID}">
            <dpla:providedLabel>
                <xsl:value-of select="."/>
            </dpla:providedLabel>
        </rdf:Description>
    </xsl:template>
    <xsl:template match="DigitalCollection">
        <dct:isPartOf
            rdf:resource="{translate(concat('https:/doi.org/10.6069/uwlib.55.A.3.4#',.),' ','')}"/>
    </xsl:template>
    <xsl:template match="OrderNumber">
        <dct:identifier>
            <xsl:value-of select="."/>
        </dct:identifier>
    </xsl:template>
    <xsl:template match="OrderingInformation">
        <edm:rights rdf:resource="https://doi.org/10.6069/uwlib.55.A.3.5#orderingInformation"/>
    </xsl:template>
    <xsl:template match="NegativeNumber">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{../cdmnumber}">
                <dct:identifier>
                    <xsl:value-of select="."/>
                </dct:identifier>
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="Repository" mode="sr">
        <dct:rightsHolder
            rdf:resource="{concat('https:/doi.org/10.6069/uwlib.55.A.3.6#',translate(.,' '',''.',''))}"
        />
    </xsl:template>
    <xsl:template match="Repository" mode="agg">
        <edm:provider
            rdf:resource="{concat('https:/doi.org/10.6069/uwlib.55.A.3.6#',translate(.,' '',''.',''))}"
        />
    </xsl:template>
    <xsl:template match="ObjectType">
        <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{../cdmnumber}">
            <dc:type>
                <xsl:value-of select="translate(., 'image', 'Image')"/>
            </dc:type>
        </rdf:Description>
    </xsl:template>
    <xsl:template match="PhysicalDescription">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{cdmnumber}">
                <dct:extent>
                    <xsl:value-of select="."/>
                </dct:extent>
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="DigitalReproductionInformation">
        <dct:description>
            <xsl:value-of select="."/>
        </dct:description>
    </xsl:template>
    <xsl:template match="StudioName">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{cdmnumber}">
                <dct:contributor
                    rdf:resource="{concat('https:/doi.org/10.6069/uwlib.55.A.3.6#',translate(.,' '',''.',''))}"
                />
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="PhotographersReferenceNumber">
        <xsl:if test="text()">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{cdmnumber}">
                <dct:identifier>
                    <xsl:value-of select="."/>
                </dct:identifier>
            </rdf:Description>
        </xsl:if>
    </xsl:template>
    <xsl:template match="RightsUri">
        <edm:rights rdf:resource="{.}"/>
    </xsl:template>
    <xsl:template match="Type">
        <!-- only one DCMI type is enumerated in AYP metadata, this template may need to be expanded for use with metadata from other collections -->
        <xsl:choose>
            <xsl:when
                test=". = 'StillImage' or . = 'Stillimage' or . = 'stillimage' or . = 'still image' or . = 'Still Image'">
                <dct:type rdf:resource="http://purl.org/dc/dcmitype/StillImage"/>
            </xsl:when>
            <xsl:otherwise>UNACCOUNTED-FOR DCMI TYPE!</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="Restrictions">
        <edm:rights rdf:resource="https://doi.org/10.6069/uwlib.55.A.3.5#restrictions"/>
    </xsl:template>
    <xsl:template match="ItemURL">
        <edm:isShownAt rdf:resource="{.}"/>
    </xsl:template>

    <!-- named templates -->
    <xsl:template name="Notes">
        <xsl:param name="Tokens"/>
        <xsl:param name="CdmNumber"/>
        <xsl:for-each select="$Tokens">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{$CdmNumber}">
                <dct:description>
                    <xsl:value-of select="."/>
                </dct:description>
            </rdf:Description>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="SubjectsLctgm">
        <xsl:param name="Tokens"/>
        <xsl:param name="CdmNumber"/>
        <xsl:variable name="lctgmID" select="concat('S1', generate-id())"/>
        <xsl:for-each select="$Tokens">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{$CdmNumber}">
                <dct:subject rdf:nodeID="{concat($lctgmID, position())}"/>
            </rdf:Description>
            <rdf:Description rdf:nodeID="{concat($lctgmID, position())}">
                <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
            </rdf:Description>
            <rdf:Description rdf:nodeID="{concat($lctgmID, position())}">
                <skos:inScheme rdf:resource="http://id.loc.gov/authorities/subjects"/>
            </rdf:Description>
            <rdf:Description rdf:nodeID="{concat($lctgmID, position())}">
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                </dpla:providedLabel>
            </rdf:Description>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="SubjectsLcsh">
        <xsl:param name="Tokens"/>
        <xsl:param name="CdmNumber"/>
        <xsl:variable name="lcshID" select="concat('S2', generate-id())"/>
        <xsl:for-each select="$Tokens">
            <rdf:Description rdf:about="https://doi.org/10.6069/uwlib.55.A.3.1#cdm{$CdmNumber}">
                <dct:subject rdf:nodeID="{concat($lcshID, position())}"/>
            </rdf:Description>
            <rdf:Description rdf:nodeID="{concat($lcshID, position())}">
                <rdf:type rdf:resource="http://www.w3.org/2004/02/skos/core#Concept"/>
            </rdf:Description>
            <rdf:Description rdf:nodeID="{concat($lcshID, position())}">
                <skos:inScheme rdf:resource="http://id.loc.gov/authorities/subjects"/>
            </rdf:Description>
            <rdf:Description rdf:nodeID="{concat($lcshID, position())}">
                <dpla:providedLabel>
                    <xsl:value-of select="."/>
                </dpla:providedLabel>
            </rdf:Description>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
