# Build your comprehensive validation function here!
# Feel free to use any third party librarys from NPM (http://npmjs.org) for data validation.

exports.validate = (data) ->

  if data?
    if data.id == undefined or data.id == null or Number.isInteger(data.id) isnt true or data.id < 0 then return false
    if data.name == undefined or data.name == null or typeof data.name != "string" or data.name.length > 63 then return false

    if !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test data.email or data.email.length > 255  then return false
    if data.taxRate < 0 or data.taxRate > 1 or typeof data.taxRate != "number" then return false

    if data.interests.length > 4 then return false

    if !Array.isArray(data.interests) then return false

    for interests in data.interests

        if interests.length > 31 or typeof interests != "string" then return false

    if data.favouriteColour?
        favColour = data.favouriteColour.toUpperCase()
        if !/(^#[0-9A-F]{6}$)|(^#[0-9A-F]{3}$)/.test favColour then return false
    return true
  else
    return false

