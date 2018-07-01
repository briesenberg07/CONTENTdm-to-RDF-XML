# XSL transform file
- While the source XML included records for both individual page items as well as compound documents (CPDs) containing multiple pages, this transform was created to process only records for CPDs. 
- The majority of values for the RDF properties used in the dataset were pushed through from values in the source XML. However, a number of values were hard-coded into the transform. These values may need to be altered in order to reuse the transform or portions of it. They include:  

  - **Output to the source resource file:**
    - dct:language > dct:LinguisticSystem > skos:exactMatch > [http://id.loc.gov/vocabulary/iso639-2/eng](http://id.loc.gov/vocabulary/iso639-2/eng)
	- dct:isPartOf > [https://doi.org/10.6069/uwlib.55.A.2.6#physical](https://doi.org/10.6069/uwlib.55.A.2.6#physical)
	- dct:type > [http://purl.org/dc/dcmitype/StillImage](http://purl.org/dc/dcmitype/StillImage)
	- dct:type > [http://purl.org/dc/dcmitype/Text](http://purl.org/dc/dcmitype/Text)
	- dct:hasFormat > (Links to corresponding web resource)  
	
  - **Output to the aggregation file:**
    - edm:dataProvider > edm:Agent > 
	  - dpla:providedLabel > University of Washington Libraries
	  - skos:exactMatch > [http://id.loc.gov/authorities/names/n79056337](http://id.loc.gov/authorities/names/n79056337)
	- edm:rights > (Links to rights file)  
	
  - **Output to the web resource file:**
    - dc:format > "application/cpd (CONTENTdm compound document)"
	- dct:isPartOf > [https://doi.org/10.6069/uwlib.55.A.2.6#digital](https://doi.org/10.6069/uwlib.55.A.2.6#digital)
	- edm:rights > (Links to rights file)
	
### _Next:_
[List of Resources](ResourceList.md)
