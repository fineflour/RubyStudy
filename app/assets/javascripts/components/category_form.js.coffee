@CategoryForm = React.createClass
  getInitialState: ->
    name_eng: ''
    name_ko: ''
    cgroup: ''

  valid: ->
    @state.name_eng && @state.name_ko && @state.cgroup

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { category: @state }, (data) =>
      @props.handleNewCategory data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form
      className: 'form-inline'
      onSubmit: @handleSubmit
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'English'
          name: 'name_eng'
          value: @state.name_eng
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Korean'
          name: 'name_ko'
          value: @state.name_ko
          onChange: @handleChange
      React.DOM.div
        className: 'form-group'
        React.DOM.select
          multiple: false
          #options: #[{value: F label: "F"}, {value: D label: "D"}]
          className: 'form-control'
          #placeholder: 'Category Group'
          name: 'cgroup'
          onChange: @handleChange
          #options: (value: c key: c) for c in ['H', 'D']
          value: @state.cgroup
          React.DOM.option(value: cgroup, key: cgroup, "#{cgroup}" ) for cgroup in ['Select a group', 'Formular', 'Disease']

      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        onClick: @handleNewCategory
        'Create Category'
