@UISelect = React.createClass
  propTypes:
    options: React.PropTypes.array

  getInitialState: ->
    selected: @props.value || []

  handleChange: (e) ->
    options = e.target.options
    selectedOptions = []

    for i in [0...options.length]
      if options[i].selected
        selectedOptions.push options[i].value

    @props.onChange(e) if @props.onChange
    @setState { selected: selectedOptions }
    @forceUpdate()

  componentWillReceiveProps: (newProps) ->
    if newProps.value isnt @state.selected
      @setState { selected: newProps.value }

  renderOption: (option) ->
    <option key={option.value} value={option.value}>{option.label}</option>

  renderSelectOptions: ->
    if @props.options
      ops = @props.options.map (option) =>
        if option.type == 'group'
          <optgroup label={option.name}>
            {
              option.items.map((item) =>
                @renderOption(item))
            }
          </optgroup>
        else
          @renderOption option

  render: ->
    selectProps = $.extend({}, @props, ref: 'select')
    <select {...selectProps} value={@state.selected} onChange=@handleChange>
      {@props.children}
      {@renderSelectOptions()}
    </select>
