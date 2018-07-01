# Converting Exported CONTENTdm Metadata to RDF/XML Data Files 
- The [XSL transform](Cdm2RdfXml.xsl) here was used to convert metadata exported from CONTENTdm to three RDF/XML data files as part of a capstone project for the University of Washington iSchool's MLIS program.  
- RDF properties and classes from the **[Digital Public Library of America's](https://dp.la/) [Metadata Application Profile, version 5](https://pro.dp.la/hubs/metadata-application-profile)** served as the primary template for the creation of the dataset, with the addition of other classes and properties from vocabularies such as **[BIBFRAME](https://www.loc.gov/bibframe/)** when needed. The XSL transform here outputs values to three RDF files: source resource, aggregation, and web resource, but in it's current version the published dataset also includes collection and rights-statement files.  
- A document detailing the mapping of CONTENTdm metadata fields to selected RDF properties is available **[here](https://docs.google.com/spreadsheets/d/1Pax7Z1V5FjiuATyD0Cv1RY24w4TKs3s7oQmEwMSy8aA/edit?usp=sharing)**.
- This capstone project built on the work of an iSchool capstone group from 2017 who digitized 40 volumes from the Historical Children's Literature collection. Their excellent work can be seen **[here](http://viclit.omeka.net/)**.
- Many thanks to my project sponsor, Metadata/Cataloging Librarian Theo Gerontakos at the University of Washington Libraries. He provided essential guidance on mapping of CONTENTdm metadata to RDF properties, XSL work, and the project as a whole.
- For more information please contact [Ben Riesenberg](mailto:ries07@uw.edu).

### _Next:_
[About Source XML](SourceXML_Details.md)
