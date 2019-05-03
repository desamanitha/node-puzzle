assert   = require 'assert'
{validate} = require '../lib'


describe '07-validation', ->

  it 'should return `true` for valid data', ->
    assert validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: name', ->
    assert !validate
      id: 1
      name: 2 # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: email', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar@baz.com' # <--- problem
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: id', ->
    assert !validate
      id: -5 # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: favouriteColour', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccffx' # <--- problem
      interests: ["cycling", "programming"]

 # !!!!!
 # Add more tests for different data that users might try to provide!
 # !!!!!

  it 'should return `false` for invalid data: idIsString', ->
    assert !validate
      id: "1"  # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: idIsNegative', ->
    assert !validate
      id: "-1"  # <--- problem
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: idIsNull', ->
    assert !validate
      id: null
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: idIsUndefined', ->
    assert !validate
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: nameNull', ->
    assert !validate
      id: 1
      name: null  # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: nameLength > 63', ->
    assert !validate
      id: 1
      name: 'JoraChaituAnithaHari VihaanRajeshMohanKir anCharanDesamsralarobe' # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `true` for valid data: nameLength = 63', ->
    assert validate
      id: 1
      name: 'JoraChaituAnithaHari VihaanRajeshMohanKir anCharanDesamsralarob' # <--- problem
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: taxRate < 0', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: -0.2 # <--- problem
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: taxRate > 1', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 1.01 # <--- problem
      favouriteColour: '#ff6'
      interests: ["cycling", "programming"]

  it 'should return `false` for invalid data: moreThan4Interests', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programming" , "listeningMusic", "painting" , "vacation"] # <--- problem

  it 'should return `false` for invalid data: interestsNotArray', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: "cycling" # <--- problem

  it 'should return `false` for invalid data: lengthOfAnArrayElementIs>31', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: ["cycling", "programmingReadingPaintingDancing"] # <--- problem

  it 'should return `false` for invalid data: interestsNotString', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'foo@bar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: [ 1234 , 4567 ] # <--- problem

  it 'should return `false` for invalid data: EmailLength > 255', ->
    assert !validate
      id: 1
      name: 'John Doe'
      email: 'fooboofaaboofoofaa@barfarbarfarbarfarbarfarbarfarbarfarcomfooboofaaboofoofaabarfarbarfarbarfarbarfarbarfarbarfarcomfooboofaaboofoofaabarfarbarfarbarfarbarfarbarfarbarfarcomfooboofaaboofoofaabarfarbarfarbarfarbarfarbarfarbarfar.com'
      taxRate: 0.1
      favouriteColour: '#ccccff'
      interests: [ 1234 , 4567 ] # <--- problem

