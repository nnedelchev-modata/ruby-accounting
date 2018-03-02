@Todo = React.createClass
    handleDone: (e) ->
        e.preventDefault()
        data =
            name: e.target.value
            status: 1
        $.ajax
            method: 'GET'
            url: "/todos/#{ @props.item.id }"
            dataType: 'JSON'
            data:
                item: data
            success: (data) =>
                @props.handleDone @props.item, data
    handleUnDone: (e) ->
        e.preventDefault()
        data = 
            name: e.target.value
            status: 0
        $.ajax
            method: 'GET'
            url: "/todos/undone/#{ @props.item.id }"
            dataType: 'JSON'
            data:
                item: data
            success: (data) =>
                @props.handleUnDone @props.item, data
    render: ->
        React.DOM.tr null,
            React.DOM.td null, @props.item.name
            React.DOM.td null, statusFormat(@props.item.status)
            React.DOM.td null, @props.item.updated_at
            React.DOM.td null,
                if !@props.item.status
                    React.DOM.a
                        className: "btn btn-warning"
                        onClick: @handleDone
                        value: @props.item.name
                        "Готово"
                else
                    React.DOM.a
                        className: "btn btn-info"
                        onClick: @handleUnDone
                        value: @props.item.name
                        "Отново"
