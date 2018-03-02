@TodoForm = React.createClass
    getInitialState: ->
        name: ''
        status: 0
    handleChange: (e) ->
        name = e.target.name
        @setState "#{ name }": e.target.value
    handleSubmit: (e) ->
        e.preventDefault()
        $.post '', { item: @state }, (data) =>
            @props.handleNewRecord data
            @setState @getInitialState()
            , 'JSON'
    valid: ->
        @state.task
    render: ->
        React.DOM.form
            className: "form-inline"
            onSubmit: @handleSubmit
            React.DOM.div
                className: 'form-group'
            React.DOM.input
                type: 'text'
                className: 'form-control'
                placeholder: 'Задача'
                name: 'task'
                value: @state.task
                onChange: @handleChange
            React.DOM.button
                type: 'submit'
                className: 'btn btn-primary'
                disabled: !@valid()
                'Въведи'
        