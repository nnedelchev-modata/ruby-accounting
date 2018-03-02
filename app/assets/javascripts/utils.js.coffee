@amountFormat = (amount) ->
    Number(amount).toLocaleString() + ' лв.'

@statusFormat = (status) ->
    if status then "Да" else "Не"