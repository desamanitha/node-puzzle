
alphabet0 = 'ᐁᐂᐃᐄᐅᐆᐇᐈᐉᐊᐋᐌᐍᐎᐏᐐᐑᐒᐓ⊟ᐔᐕᐖᐗᐘᐙᐚᐛᐜᐝᐞᐟ⋇⋈⋉⋊⋋⋌⊏⊐'
alphabet1 = 'abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ'


exports.encrypt = (string) ->
  result = ''
  if string == null
    return;
  else
    alphbet0Length = alphabet0.length
    for char in string
      index = alphabet1.indexOf char
      if index < alphbet0Length - 1
        result += alphabet0[index]
      else
       result += char
  return result


exports.decrypt = (string) ->
  result = ''
  for char in string
    index = alphabet0.indexOf char
    if index is -1
      result += char
    else
      result += alphabet1[index]

  return result
