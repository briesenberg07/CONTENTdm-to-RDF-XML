<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">

    <xsl:output indent="yes"/>

    <xsl:template match="/">
        <GroupAndCount>
            <xsl:apply-templates select="metadata"/>
        </GroupAndCount>
    </xsl:template>

    <xsl:template match="metadata">

        <CitationInformation>
            <stringCount>
                <xsl:value-of select="count(distinct-values(record/CitationInformation))"/>
            </stringCount>
            <xsl:for-each-group select="record" group-by="CitationInformation">
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

        <originalCreators>
            <creatorCount>
                <xsl:value-of select="count(distinct-values(record/OriginalCreator))"/>
            </creatorCount>
            <xsl:for-each-group select="record" group-by="OriginalCreator">
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
                <!-- Use regex, etc. to count only distinct 'PH COLL' numeric values.
                For hupy, LOTS of variant text strings for identical PH COLLs
                See below -->
                <phCollVariants>
                    <xsl:value-of select="count(distinct-values(record/RepositoryCollection))"/>
                </phCollVariants>
                <xsl:for-each-group select="record" group-by="RepositoryCollection">
                    <repositoryCollectionStrings>
                        <xsl:value-of select="RepositoryCollection"/>
                    </repositoryCollectionStrings>
                </xsl:for-each-group>
                <!-- This does not work 
                <phCollNumbers>
                    <xsl:value-of select="count(distinct-values(contains(record/RepositoryCollection, 'PH COLL')))"/>
                </phCollNumbers>
                -->
            </physicalCollections>
        </collections>

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

    </xsl:template>

</xsl:stylesheet>
