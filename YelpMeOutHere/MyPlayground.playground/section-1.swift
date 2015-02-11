// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let r = Range(start: str.startIndex, end: str.endIndex)
str.rangeOfString("ello", options: NSStringCompareOptions.CaseInsensitiveSearch, range: r, locale: nil)?.isEmpty