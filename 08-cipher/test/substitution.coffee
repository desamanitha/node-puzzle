assert = require 'assert'
substitution = require '../lib/substitution'


describe '08-cipher/lib/substitution', ->

  it 'should encrypt/decrypt', ->
    assert.equal substitution.encrypt('hello there'), 'ᐈᐅᐌᐌᐏᐚ⊟ᐈᐅᐒᐅ'

  it 'should encrypt/decrypt for missing secrets', ->
    assert.equal substitution.encrypt('hello WYZ'), 'ᐈᐅᐌᐌᐏᐚWYZ'

  it 'should encrypt/decrypt handle null values', ->
    assert.equal substitution.encrypt(null), undefined

  it 'should decrypt', ->
    assert.equal substitution.decrypt('ᐈᐅᐌᐌᐏᐚ⊟ᐈᐅᐒᐅ'), 'hello there'


