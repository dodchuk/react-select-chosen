# React Chosen Select Component

[React](http://facebook.github.io/react/) wrapper for [Chosen](http://harvesthq.github.io/chosen/) jQuery.

Please refer to [Chosen](http://harvesthq.github.io/chosen/)'s API. It's pretty much the same, except:
- Every Chosen option employs camelCase, e.g. disable_search_threshold -> disableSearchThreshold.

## Usage: 

#### Options data:
``` coffee
options = [
  {
    value: 'one'
    label: 'One'
  }
  {
    value: 'two'
    label: 'Two'
  }
  {
    type: 'group'
    name: 'Group 1'
    items: [
      {
        value: 'three'
        label: 'Three'
      }
      {
        value: 'four'
        label: 'Four'
      }
    ]
  }
  {
    type: 'group'
    name: 'Group 2'
    items: [
      {
        value: 'five'
        label: 'Five'
      }
      {
        value: 'six'
        label: 'Six'
      }
    ]
  }
]
```

With options array: 
``` html
<UIChosenSelect value={@state.currentNumber} options={options} onChange={@doSomething} />
```

Without options array:
``` html
<UIChosenSelect value={@state.yourMom} onChange={@doSomething}>
  <option value="Fat">Fat</option>
  <option value="Skinny">Skinny</option>
</UIChosenSelect>
```

You can also mix it.
In this case, first comes `<option>`, then `{options}` array.
``` html
<UIChosenSelect value={@state.homieName} options={options} onChange={@doSomething}>
  <option value="Sergii">Sergii</option>
  <option value="Max">Max</option>
  <option value="Pavel">Pavel</option>
</UIChosenSelect>
```

`<optgroup>` is supported as usual :heart:
``` html
<UIChosenSelect value={@state.currentNumber} onChange={@doSomething}>
  <optgroup label="Group 1">
    <option value="one">One</option>
    <option value="two">Two</option>
  </optgroup>
</UIChosenSelect>
```



#### Handle Changes
``` coffee
doSomething: (e) ->
  # e.target.options[e.target.selectedIndex].text - option label text, just in case
  # e.target.value - option value
  @setState
    yourMom: e.target.value
```


## License
WTFPL
