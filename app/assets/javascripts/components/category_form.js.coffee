@CategoryForm = React.createClass
  getInitialState: ->
    name_eng: ''
    name_ko: ''
    ctype: ''

  valid: ->
    @state.name_eng && @state.name_ko && @state.ctype

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
        React.DOM.input
          #multiple: false
          type: 'text'
          className: 'form-control'
          placeholder: 'Category Type'
          name: 'ctpye'
          value: @state.c_type
          onChange: @handleChange
         #option: (value: c.category, key: c.id) for c in @state.category
      React.DOM.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        onClick: @handleNewCategory
        'Create Category'
