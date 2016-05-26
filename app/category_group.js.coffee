DOM = React.DOM
ListOfCountries= [
  {"value":"D","key":"Disease"},
  {"value":"H","key":"Herbe"},
]
FormSelect = React.createClass
  displayName: 'Form Select'

  componentDidUpdate: ->
    @updateChosen()

  componentDidMount: ->
    @initializeChosen()

  getInitialState: ->
    value: @props.initialValue || ''
    disabled: @props.disabled

  initializeChosen: ->
    @selectDOMSelector().chosen(@props).change(@onChange)

  updateChosen: ->
    @selectDOMSelector().trigger('chosen:updated')

  selectDOMSelector: ->
    $(React.findDOMNode(@refs.select))

  onChange: (event) ->
    value = event.target.value
    @props.onChange(@props.name, value)
    @setState value: value

  enable: ->
    @setState disabled: false

  disable: ->
    @setState disabled: true

  blankOption: ->
    DOM.option
      key: 'blankOption'
      value: ''
      @props.blankPrompt

  optionComponent: (option) ->
    DOM.option
      key: "option-#{option.key}"
      value: option.value
      option.key

  selectBox: ->
    DOM.select
      ref: 'select'
      id: @props.id
      name: @props.name
      required: @props.required
      disabled: @state.disabled
      value: @state.value
      onChange: @onChange
      @blankOption() if @props.blankPossible
      for option in @props.options
        @optionComponent(option)

  render: ->
    @selectBox()

formSelect = React.createFactory(FormSelect)

$ ->
  ReactDOM.render(formSelect(
    id: "countries"
    name: "countries"
    blankPossible: true
    options: ListOfCountries
    onChange: (name, value) ->
      console.log(value)
  ), document.getElementById("reactContainer"))
