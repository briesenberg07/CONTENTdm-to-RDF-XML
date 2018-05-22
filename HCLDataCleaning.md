# Cleaning exported HCL metadata
--------
### Notes:
- I am using find/replace all functions in [Notepad++](https://notepad-plus-plus.org/) for data cleaning--this process needs improvement.
- Enter one space before and after search/replace strings for #1
- Search and replace strings are given in the order of operations

Note: 
Instead of deleting <br> equivalents, replace with one space?
--------

1. ` &amp; ` --> ` and ` (See notes)
2. `&quot;` --> `"`
3. `&lt;br&gt;` --> ` ` (one space)
4. `&amp;lt;br&amp;gt;` --> ` ` (one space)
5. `<Category>br&amp</Category>` --> ` ` (one space)
6. `&amp</Category>` --> `</Category>`
7. `<Category>lt</Category>` --> DELETE
8. `<Category>gt</Category>` --> DELETE
9. `&amp;lt;br&amp;gt;` --> ` ` (one space)
10. `&` --> DELETE
