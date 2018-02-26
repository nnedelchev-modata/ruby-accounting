@Records = React.createClass
    getInitialState: ->
      records: @props.data
    getDefaultProps: ->
      records: []
    addRecord: (record) ->
      records = React.addons.update(@state.records, { $push: [record] } )
      @setState records: records
    credits: ->
      credits = @state.records.filter (val) -> val.amount >= 0
      credits.reduce ((prev, curr) ->
        prev + parseFloat(curr.amount)
      ), 0
    debits: ->
      debits = @state.records.filter (val) -> val.amount < 0
      debits.reduce ((prev, curr) ->
        prev + parseFloat(curr.amount)
      ), 0
    balance: ->
      @debits() + @credits()
    deleteRecord: (record) ->
      index = @state.records.indexOf record
      records = React.addons.update(@state.records, { $splice: [[index, 1]]})
      @replaceState records: records
    updateRecord: (record, data) ->
      index = @state.records.indexOf record
      records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
      @replaceState records: records
    searchForm: (searchTerm) ->
      if !!searchTerm
        filteredRecords = @state.records.filter (val) -> ~val.title.indexOf searchTerm
        @replaceState records: filteredRecords
      else
        @replaceState records: @props.data
    render: ->
      React.DOM.div
        className: 'records col-md-8 col-md-offset-2'
        React.DOM.h2
          className: 'title'
          'Суми'
          React.DOM.hr null
          React.DOM.div
            className: 'row'
            React.createElement AmountBox, type: 'success', amount: @credits(), text: 'Кредит'
            React.createElement AmountBox, type: 'danger', amount: @debits(), text: 'Дебит'
            React.createElement AmountBox, type: 'info', amount: @balance(), text: 'Баланс'
        React.DOM.div
          className: 'col-md-12 col-md-offeset-1 pull-right'
          React.createElement RecordForm, handleNewRecord: @addRecord
          React.DOM.hr null
        React.DOM.div
          className: 'col-md-12 pull-left'
          React.createElement SearchFilter, handleSearch: @searchForm
        React.DOM.table
          className: 'table table-striped table-hover table-responsive'
          React.DOM.thead null,
            React.DOM.tr 
              className: "text-center"
              React.DOM.th
                className: "text-center"
                'Заглавие'
              React.DOM.th
                className: "text-center"
                'Дата'
              React.DOM.th
                className: "text-center"
                'Сума'
              React.DOM.th
                className: "text-center"
                'Контрол'
          React.DOM.tbody
            className: "text-center"
            for record in @state.records
              React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord