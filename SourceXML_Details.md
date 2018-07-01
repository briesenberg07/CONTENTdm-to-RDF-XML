- The XML metadata files used for transformation are currently accessible only to collaborators at the University of Washington. 

# Cleaning exported Historical Children's Literature metadata  
- We used metadata exported from the [University of Washington's Historical online Children's Historical Literature Collection](http://content.lib.washington.edu/childrensweb/index.html) as raw material to create an RDF dataset describing selected physical items and digital surrogates from the collection. A first step in using this exported metadata was data cleaning.  
 
### Notes:

- I am using find/replace all functions in [Notepad++](https://notepad-plus-plus.org/) for data cleaning--this process could most likely be improved significantly with other tools and techniques.
- Enter one space before and after search/replace strings for #1
- Search and replace strings are given in the order of operations
---
1. ` &amp; ` --> ` and ` (See notes)
2. `&quot;` --> `"`
3. `&lt;br&gt;` --> ` ` (one space)
4. `&amp;lt;br&amp;gt;` --> ` ` (one space)
5. `<Category>br&amp</Category>` --> ` ` (one space)
6. `&amp</Category>` --> `</Category>`
7. `<Category>lt</Category>` --> DELETE
8. `<Category>gt</Category>` --> DELETE
9. `&` --> DELETE
