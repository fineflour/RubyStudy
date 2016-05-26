@Category= React.createClass
  getInitialState: ->
    edit: false

  handleToggle: (e) ->
    e.preventDefault()
    @setState edit: !@state.edit

  handleDelete: (e) ->
    e.preventDefault()
    # yeah... jQuery doesn't have a $.delete shortcut method
    x = confirm("Are you sure you want to delete?")
    $.ajax if x
      method: 'DELETE'
      url: "/categories/#{ @props.category.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeleteCategory @props.category

  handleEdit: (e) ->
    e.preventDefault()
    data =
      name_eng: ReactDOM.findDOMNode(@refs.name_eng).value
      name_ko: ReactDOM.findDOMNode(@refs.name_ko).value
      cgroup: ReactDOM.findDOMNode(@refs.cgroup).value
    # jQuery doesn't have a $.put shortcut method either
    $.ajax
      method: 'PUT'
      url: "/categories/#{ @props.category.id }"
      dataType: 'JSON'
      data:
        category: data
      success: (data) =>
        @setState edit: false
        @props.handleEditCategory @props.category, data

  categoryRow: ->
    React.DOM.tr null,
      React.DOM.td null, @props.category.name_eng
      React.DOM.td null, @props.category.name_ko
      React.DOM.td null, @props.category.cgroup
      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleToggle
          'Edit'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleDelete
          'Delete'

  categoryForm: ->
    React.DOM.tr null,
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.category.name_eng
          ref: 'name_eng'
      React.DOM.td null,
        React.DOM.input
          className: 'form-control'
          type: 'text'
          defaultValue: @props.category.name_ko
          ref: 'name_ko'
      React.DOM.td null,
        React.DOM.select
          multiple: false
          className: 'form-control'
          name: 'cgroup'
          onChange: @handleChange
          defaultValue: @props.category.cgroup
          ref: 'cgroup'
          React.DOM.option(value: cgroup, key: cgroup, "#{cgroup}" ) for cgroup in ['Formular', 'Disease']

      React.DOM.td null,
        React.DOM.a
          className: 'btn btn-default'
          onClick: @handleEdit
          'Update'
        React.DOM.a
          className: 'btn btn-danger'
          onClick: @handleToggle
          'Cancel'

  render: ->
    if @state.edit
      @categoryForm()
    else
      @categoryRow()
