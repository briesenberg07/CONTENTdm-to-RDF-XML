# CLEANING EXPORTED CONTENTdm METADATA  

### Notes:  
The data cleaning process needs improvement. Currently using [Notepad++](https://notepad-plus-plus.org/) find/replace functions. Exported character strings and replacement values are given below in the order processed.   
  
`Exported character string` --> `Replacement value`
---------------------------------------------------
1. ` &amp; ` --> ` and ` (one space on each side for both searched and replaced values here) 
2. `&quot;` --> `"`
3. `&lt;br&gt;` --> one space
4. `&amp;lt;br&amp;gt;`  --> one space
5. `<Category>br&amp</Category>` --> delete
6. `&amp</Category>` --> `</Category>`
7. `<Category>lt</Category>` --> delete
8. `<Category>gt</Category>` --> delete
9. `&amp;lt;br&amp;gt;` --> one space
10. `&` --> delete
