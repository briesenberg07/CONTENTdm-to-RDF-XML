# Source XML files
- Metadata exported from the [University of Washington's Historical Children's Literature digital collection](http://content.lib.washington.edu/childrensweb/index.html) was used as the source XML file for transformation. CONTENTdm export settings were as follows:
  - XML > Custom XML > Include all page-level metadata
  - Repeating fields: Repeat fields that use identical XML tags
  - Controlled vocabulary: Repeat fields that contain multiple terms
- Source XML is currently available only to project contributors at the University of Washington Libraries. Please contact [Ben Riesenberg](mailto:ries07@uw.edu) for more information.

## Cleaning exported metadata  
- I used find/replace functions in [Notepad++](https://notepad-plus-plus.org/) for data cleaning, but this process could most likely be improved significantly with other tools and techniques for future transformations.  

### Search and replace strings are given here in the order of operations
---
1. ` &amp; ` --> ` and ` (Ensure that the search and replace strings begin and end with one space)
2. `&quot;` --> `"`
3. `&lt;br&gt;` --> (Replace with one space)
4. `&amp;lt;br&amp;gt;` --> (Replace with one space)
5. `<Category>br&amp</Category>` --> (Replace with one space)
6. `&amp</Category>` --> `</Category>`
7. `<Category>lt</Category>` --> DELETE
8. `<Category>gt</Category>` --> DELETE
9. `&` --> DELETE
---
### _Next:_
[About the XSL Transform](XSL_Details.md)

