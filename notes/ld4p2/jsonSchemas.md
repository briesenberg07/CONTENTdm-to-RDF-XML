# Some questions about [Sinopia schema 0.2.1](https://github.com/LD4P/sinopia/tree/master/schemas/0.2.1) features

### `dependencies` keyword for `valueConstraint` [LINE 172](https://github.com/LD4P/sinopia/blob/c6b65051e4a041537ede07c7b732ebdd6c8adaca/schemas/0.2.1/property-template.json#L172):
```
      "$comment": "Use at most one of useValuesFrom, valueTemplateRefs",
      "dependencies": {
        "valueTemplateRefs": { "not": { "required": ["useValuesFrom"] } },
        "useValuesFrom": { "not": { "required": ["valueTemplateRefs"] } }
```

From [Understanding JSON Schema 7.0 > object](https://json-schema.org/understanding-json-schema/reference/object.html?highlight=dependencies):
> We represent this dependency of one property on another using the dependencies keyword.
> The value of the dependencies keyword is an object. Each entry in the object maps from the name of a property, p, to an array of strings listing properties that are required whenever p is present.

The Sinopia schema *seems* to be taking this further by not simply using an array to indicate the required property, but by giving the value of the property an object for a value, which in turn contains another object, this whole structure combining to indicate a property that *must not* be present when the first is ~~(?**Q1**?)~~. *I haven't seen an explanation of this usage in any JSON Schema documentation so far.* This pattern (`{ "not" { "required": ["X"] } }`) shows up in other places as well.

If `valueConstraint` includes the `valueTemplateRefs` property, it \[must not ~~?/need not?~~ \] contain the `useValuesFrom` property. If it contains `useValuesFrom`, it \[must not ~~?/need not?~~ \] contain the `valueTemplateRefs` property.

### `allOf` keyword and definitions for property-template.json [starts LINE 178](https://github.com/LD4P/sinopia/blob/c6b65051e4a041537ede07c7b732ebdd6c8adaca/schemas/0.2.1/property-template.json#L178)

So this applies to *everything in this schema module (a.k.a. this document)* (?).

#### Lookup properties

```
{
  "if": {
    "properties": {
      "type": { "const": "lookup" }
    }
  },
  "then": {
    "$comment": "forbid resourceTemplates and require valueConstraint.useValuesFrom",
    "allOf": [
      { "not": { "required": ["resourceTemplates"] } },
      { "$ref": "#/definitions/requires-valueConstraint-useValuesFrom" }
    ]
  }
},
```
If a property is a lookup (is `"type": "lookup"`) then it *may not* include a `resourceTemplates` property ~~(or it simply *isn't required?* **Q2**?)~~. Also, per the referenced definition...
```
"requires-valueConstraint-useValuesFrom": {
  "required": ["valueConstraint"],
  "properties": {
    "valueConstraint" : {
      "required": ["useValuesFrom"]
    }
  }
},
```
...lookup properties require a `valueConstraint` and the `valueConstraint` in turn requires `useValuesFrom`.

#### Properties with resource (URI/IRI values)

```
{
  "if": {
    "properties": {
      "type": { "const": "resource" }
    }
  },
  "then": {
    "$comment": "require valueConstraint.valueTemplateRefs and forbid defaults",
    "allOf": [
      { "$ref": "#/definitions/requires-valueConstraint-valueTemplateRefs-forbids-defaults" }
    ]
  }
},
```
If a property will have a resource value (is `"type": "resource"`), then per the referenced definition...
```
"requires-valueConstraint-valueTemplateRefs-forbids-defaults": {
  "required": ["valueConstraint"],
  "properties": {
    "valueConstraint" : {
      "allOf": [
        { "required": ["valueTemplateRefs"] },
        { "not": { "required": [ "defaults" ] } }
      ]
    }
  }
},
```
...`valueConstraint` is required, and it in turn requires `valueTemplateRefs` and must not have defaults. ~~(Or defaults are simply *not required*?**Q3**?)~~

#### Properties with literal values

```
{
  "if": {
    "properties": {
      "type": { "const": "literal" }
    }
  },
  "then": {
    "$comment": "forbid resourceTemplates, valueConstraint.useValuesFrom and valueConstraint.valueTemplateRefs",
    "allOf": [
      { "not": { "required": ["resourceTemplates"] } },
      { "$ref": "#/definitions/valueConstraint-requires-neither-templateRefs-nor-valuesFrom" }
    ]
  }
}
```
If a property will have a literal value (is `"type": "literal"`), then per the referenced definition...
```
"valueConstraint-requires-neither-templateRefs-nor-valuesFrom": {
  "properties": {
    "valueConstraint" : {
      "allOf": [
        { "not": { "required": [ "useValuesFrom" ] } },
        { "not": { "required": [ "valueTemplateRefs" ] } }
      ]
    }
  }
}
```
...its `valueConstraint` may not include `useValuesFrom` or `valueTemplateRefs`. ~~(Or these are simply *not required*?**Q4**?)~~
