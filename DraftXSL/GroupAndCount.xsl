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

        <Collections>
            <DigitalCollections>
                <DigiCollCount>
                    <xsl:value-of select="count(distinct-values(record/DigitalCollection))"/>
                </DigiCollCount>
                <xsl:for-each-group select="record" group-by="DigitalCollection">
                    <DigitalCollection>
                        <xsl:value-of select="DigitalCollection"/>
                    </DigitalCollection>
                </xsl:for-each-group>
            </DigitalCollections>
            <PhysicalCollections>
                <PhysicalCollCount>
                    <xsl:value-of select="count(distinct-values(record/RepositoryCollection))"/>
                </PhysicalCollCount>
                <xsl:for-each-group select="record" group-by="RepositoryCollection">
                    <RepositoryCollection>
                        <xsl:value-of select="RepositoryCollection"/>
                    </RepositoryCollection>
                </xsl:for-each-group>
            </PhysicalCollections>
        </Collections>

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
