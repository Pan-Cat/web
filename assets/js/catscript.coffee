"use strict";

class CatScript
    @encodeString = "Meow"

    @encode: (input) ->
        result = []
        for v, i in input
            result.push(@encodeChar(v))
        return result.join(" ")

    @decode: (input) ->
        result = []
        input = input.trim().split(" ")
        for v, i in input
            result.push(@decodeChar(v))
        return result.join("")

    @encodeChar: (char) ->
        encode = ""
        code = char.charCodeAt(0)
        code = ('00' + code.toString(4)).slice(-4)
        for v, i in code
            times = parseInt(v, 10) + 1
            for j in [0...times] by 1
                encode += @encodeString[i]
        return encode

    @decodeChar: (char) ->
        lengthM = char.match(/M/g).length - 1
        lengthE = char.match(/e/g).length - 1
        lengthO = char.match(/o/g).length - 1
        lengthW = char.match(/w/g).length - 1
        code = parseInt("#{lengthM}#{lengthE}#{lengthO}#{lengthW}", 4)
        decode = String.fromCodePoint(code)
        return decode

# max: 125, min: 10

catScript = document.getElementById("catscript").innerHTML;
decode = CatScript.decode(catScript)
eval(decode)