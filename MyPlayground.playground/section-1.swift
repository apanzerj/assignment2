// Playground - noun: a place where people can play

import UIKit



var str = ["101 Booze Street", "San Francisco Cral, 93827","Balls"]
var foo = str.reduce("") { (U,T) -> NSString in
    if (U == ""){ return T}
    return U + "\n" + T
}
println(foo)

var bob = "foo"
bob += "foo"
var foob = "asdfasdfasdf"
foob = foob.substringToIndex(foob.endIndex.predecessor())
println(foob)
