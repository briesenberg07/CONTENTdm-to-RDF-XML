<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <GroupAndCount>
            <xsl:apply-templates select="metadata"/>
            <xsl:apply-templates select="metadata/record/RepositoryCollection"/>
        </GroupAndCount>
    </xsl:template>

    <xsl:template match="metadata">

        <CitationInformation>
            <stringCount>
                <xsl:value-of select="count(distinct-values(record/CitationInformation[text()]))"/>
            </stringCount>
            <xsl:for-each-group select="record" group-by="CitationInformation[text()]">
                <strings>
                    <xsl:value-of select="CitationInformation"/>
                </strings>
            </xsl:for-each-group>
        </CitationInformation>

        <RepositoryCollectionGuides>
            <GuideCount>
                <xsl:value-of select="count(distinct-values(record/repositoryCollectionGuide))"/>
            </GuideCount>
            <xsl:for-each-group select="record" group-by="repositoryCollectionGuide">
                <CollectionGuideURL>
                    <xsl:value-of select="repositoryCollectionGuide"/>
                </CollectionGuideURL>
            </xsl:for-each-group>
        </RepositoryCollectionGuides>

        <Agents>
            <Photographers>
                <PhotogCount>
                    <xsl:value-of
                        select="count(distinct-values(record/Photographer[text() and . != 'Unidentified' and . != 'unidentified']))"
                    />
                </PhotogCount>
                <xsl:for-each-group select="record"
                    group-by="Photographer[text() and . != 'Unidentified' and . != 'unidentified']">
                    <Photographer>
                        <xsl:value-of select="Photographer"/>
                    </Photographer>
                </xsl:for-each-group>
            </Photographers>
        </Agents>

        <originalCreators>
            <creatorCount>
                <xsl:value-of select="count(distinct-values(record/OriginalCreator[text()]))"/>
            </creatorCount>
            <xsl:for-each-group select="record" group-by="OriginalCreator[text()]">
                <OriginalCreator>
                    <xsl:value-of select="OriginalCreator"/>
                </OriginalCreator>
            </xsl:for-each-group>
        </originalCreators>

        <ObjectTypes>
            <!-- Tokenize and break apart multiple values? 
            How do these values work? "Photograph image", two different things or one thing
            (photograph) modified by (image)? -->
            <ObjectTypeCount>
                <xsl:value-of select="count(distinct-values(record/ObjectType))"/>
            </ObjectTypeCount>
            <xsl:for-each-group select="record" group-by="ObjectType">
                <ObjectType>
                    <xsl:value-of select="ObjectType"/>
                </ObjectType>
            </xsl:for-each-group>
        </ObjectTypes>

        <Locations>
            <LocationsDepicted>
                <LocDepCount>
                    <xsl:value-of select="count(distinct-values(record/LocationDepicted))"/>
                </LocDepCount>
                <xsl:for-each-group select="record" group-by="LocationDepicted">
                    <LocationDepicted>
                        <!-- Would be good to add a count after each string? 
                        (Here and elsewhere) -->
                        <xsl:value-of select="LocationDepicted"/>
                    </LocationDepicted>
                </xsl:for-each-group>
            </LocationsDepicted>
            <StudioLocations>
                <StuLocCount>
                    <xsl:value-of select="count(distinct-values(record/StudioLocation))"/>
                </StuLocCount>
                <xsl:for-each-group select="record" group-by="StudioLocation">
                    <StudioLocation>
                        <xsl:value-of select="StudioLocation"/>
                    </StudioLocation>
                </xsl:for-each-group>
            </StudioLocations>
        </Locations>

        <collections>
            <digitalCollections>
                <digiCollVariants>
                    <xsl:value-of select="count(distinct-values(record/DigitalCollection))"/>
                </digiCollVariants>
                <xsl:for-each-group select="record" group-by="DigitalCollection">
                    <digiCollStrings>
                        <xsl:value-of select="DigitalCollection"/>
                    </digiCollStrings>
                </xsl:for-each-group>
            </digitalCollections>

            <physicalCollections>
                <phCollVariants>
                    <xsl:value-of select="count(distinct-values(record/RepositoryCollection))"/>
                </phCollVariants>
                <xsl:for-each-group select="record" group-by="RepositoryCollection">
                    <repositoryCollectionStrings>
                        <xsl:value-of select="RepositoryCollection"/>
                    </repositoryCollectionStrings>
                </xsl:for-each-group>
            </physicalCollections>

        </collections>

    </xsl:template>


    <!-- Use regex, something? to count only distinct 'PH COLL' numeric values.
                Need regex because PH COLL might be PH Coll, etc.
                For hupy, LOTS of variant text strings for identical PH COLLs -->
    <!-- Do I need to put the matching-substring and non-matching-substring into variables, that may then be processed by group-by, for-each, etc.? -->

    <xsl:template match="metadata/record/RepositoryCollection">
        <xsl:analyze-string select="." regex="\.*[p][h]\s+[c][o][l][l]\s+(\d+)\s*" flags="i">
            <xsl:matching-substring>
                <xsl:for-each-group select="." group-by="(regex-group(1))">
                    <xsl:for-each select="distinct-values(regex-group(1))">
                        <numberedColl>
                            <xsl:value-of select="."/>
                        </numberedColl>
                    </xsl:for-each>
                </xsl:for-each-group>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <xsl:for-each-group select="." group-by=".">
                    <otherColl>
                        <xsl:value-of select="distinct-values(.)"/>
                    </otherColl>
                </xsl:for-each-group>
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>

</xsl:stylesheet>
