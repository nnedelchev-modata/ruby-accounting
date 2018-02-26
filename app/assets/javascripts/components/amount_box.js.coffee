@AmountBox = React.createClass
    render: ->
        React.DOM.div
            className: 'col-md-4'
            React.DOM.div
                className: "panel panel-#{@props.type}"
                React.DOM.div
                  className: 'panel-heading text-center'
                  @props.text
                React.DOM.div
                  className: 'panel-body text-center'
                  amountFormat(@props.amount)