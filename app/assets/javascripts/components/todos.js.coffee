@Todos = React.createClass
    getInitialState: ->
        items: @props.data
    getDefaultState: ->
        items: []
    updateTask: (item, data) ->
        index = @state.items.indexOf item
        items = React.addons.update(@state.items, { $splice: [[index, 1, data]] })
        @replaceState items: items
    undoneTask: (item, data) ->
        index = @state.items.indexOf item
        items = React.addons.update(@state.items, { $splice: [[index, 1, data]]})
        @replaceState items: items
    render: ->
        React.DOM.div
            className: 'records col-md-8 col-md-offset-2'
            React.DOM.h1
                className: "title"
                "Задачи"
            React.DOM.hr null
            React.createElement TodoForm, handleNewRecord: @addRecord
            React.DOM.table
                className: 'table table-striped table-hover table-responsive'
                React.DOM.thead null,
                    React.DOM.tr 
                        className: "text-center"
                        React.DOM.th
                            className: "text-center"
                            'Задача'
                        React.DOM.th
                            className: "text-center"
                            'Изпълнена'
                        React.DOM.th
                            className: "text-center"
                            "Дата"
                        React.DOM.th
                            className: "text-center"
                            "Действия"
                React.DOM.tbody
                    className: "text-center"
                    for item in @state.items
                        React.createElement Todo, key: item.id, item: item, handleDone: @updateTask, handleUnDone: @undoneTask