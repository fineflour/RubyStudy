@Categories = React.createClass
  getInitialState: ->
    categories: @props.data

  getDefaultProps: ->
    categories: []

  addCategory: (category) ->
    categories = React.addons.update(@state.categories, { $push: [category] })
    @setState categories: categories

  deleteCategory: (category) ->
    index = @state.categories.indexOf category
    categories = React.addons.update(@state.categories, { $splice: [[index, 1]] })
    @replaceState categories: categories

  updateCategory: (category, data) ->
    index = @state.categories.indexOf category 
    categories = React.addons.update(@state.categories, { $splice: [[index, 1, data]] })
    @replaceState categories: categories

  render: ->
    React.DOM.div
      className: 'categories'
      React.DOM.h2
        className: 'title'
        'Categories'
      React.DOM.div
      React.createElement CategoryForm, handleNewCategory: @addCategory
      React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'English'
            React.DOM.th null, 'Korean'
            React.DOM.th null, 'Category Group'
            React.DOM.th null, 'Action'
        React.DOM.tbody null,
          for category in @state.categories
            React.createElement Category, key: category.id, category: category, handleNewCategory: @addCategory, handleDeleteCategory: @deleteCategory, handleEditCategory: @updateCategory
