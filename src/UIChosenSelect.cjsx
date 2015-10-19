@UIChosenSelect = React.createClass
  propTypes:
    options: React.PropTypes.array

  getInitialState: ->
    selected: @props.value || []

  componentDidUpdate: ->
    # chosen doesn't refresh the options by itself, babysit it
    $(React.findDOMNode(@refs.select)).trigger 'chosen:updated'

  handleChange: (e) ->
    # force the update makes it so that we reset chosen to whatever
    # controlled value the parent dictated
    options = e.target.options
    selectedOptions = []

    for i in [0...options.length]
      if options[i].selected
        selectedOptions.push options[i].value

    @props.onChange(e) if @props.onChange
    @setState { selected: selectedOptions }
    @forceUpdate()

  componentWillReceiveProps: (newProps) ->
    if newProps.value and newProps.value isnt @state.selected
      @setState { selected: newProps.value }

  componentDidMount: ->
    props = @props
    select = $(React.findDOMNode(@refs.select))

    $(select).chosen(
      allow_single_deselect: props.allowSingleDeselect
      disable_search: props.disableSearch
      disable_search_threshold: props.disableSearchThreshold
      enable_split_word_search: props.enableSplitWordSearch
      inherit_select_classes: props.inheritSelectClasses
      max_selected_options: props.maxSelectedOptions
      no_results_text: props.noResultsText
      placeholder_text_multiple: props.placeholderTextMultiple
      placeholder_text_single: props.placeholderTextSingle
      search_contains: props.searchContains
      single_backstroke_delete: props.singleBackstrokeDelete
      width: props.width
      display_disabled_options: props.displayDisabledOptions
      display_selected_options: props.displaySelectedOptions)
      .on('chosen:maxselected', @props.onMaxSelected)
      .change @handleChange

  componentWillUnmount: ->
    React.unmountComponentAtNode(React.findDOMNode(@refs.select))
    $(React.findDOMNode(@refs.select)).remove()

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
    <select {...selectProps} value={@state.selected}>
      {@props.children}
      {@renderSelectOptions()}
    </select>
