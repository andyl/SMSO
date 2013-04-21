#= require calculator

describe "Calculator", ->
  it "adds digits", ->
    expect(new Calculator().add(2,2)).toBe(44)
  it "adds more digits", ->
    expect(new Calculator().add(4,4)).toBe(8)
  it "adds more digits", ->
    expect(new Calculator().add(4,2)).toBe(6)
