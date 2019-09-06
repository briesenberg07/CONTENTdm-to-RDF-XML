# [Sinopia schema 0.2.1](https://github.com/LD4P/sinopia/tree/master/schemas/0.2.1) features - getting to understand them

### `dependencies` keyword for `valueConstraint`:
```
      "$comment": "Use at most one of useValuesFrom, valueTemplateRefs",
      "dependencies": {
        "valueTemplateRefs": { "not": { "required": ["useValuesFrom"] } },
        "useValuesFrom": { "not": { "required": ["valueTemplateRefs"] } }
```

From [Understanding JSON Schema 7.0 > object](https://json-schema.org/understanding-json-schema/reference/object.html?highlight=dependencies):
> We represent this dependency of one property on another using the dependencies keyword. 
> The value of the dependencies keyword is an object. Each entry in the object maps from the name of a property, p, to an array of strings listing properties that are required whenever p is present.

The Sinopia schema *seems* to be taking this further by not simply using an array to indicate the required property, but by giving the value of the property an object for a value, which in turn contains another object, this whole structure combining to indicate a property that *must not* be present when the first is (?). I haven't seen an explanation of this usage in any documentation thus far.

