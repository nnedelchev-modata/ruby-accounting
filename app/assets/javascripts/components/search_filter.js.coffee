@SearchFilter = React.createClass
    getInitialState: ->
        search: ''
    handleChange: (e) ->
      @setState search: e.target.value
      @props.handleSearch e.target.value
    render: ->
            React.DOM.form
                className: 'form-inline'
                React.DOM.div
                    className: "form-group"
                    React.DOM.input
                        type: 'text'
                        className: 'form-control'
                        placeholder: 'Търси .....'
                        name: 'search'
                        value: @state.search
                        onChange: @handleChange