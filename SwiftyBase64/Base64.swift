//
//  Base64.swift
//  SwiftyBase64
//
//  Created by Doug Richardson on 8/7/15.
//
//

/**
    Base64 Alphabet to use during encoding.

    - Standard: The standard Base64 encoding, defined in RFC 4648 section 4.
    - URLAndFilenameSafe: The base64url encoding, defined in RFC 4648 section 5.
*/
public enum Alphabet {
    /// The standard Base64 alphabet
    case Standard
    
    /// The URL and Filename Safe Base64 alphabet
    case URLAndFilenameSafe
}

/**
    Encode a [UInt8] byte array as a Base64 String.

    :param: bytes Bytes to encode.
    :param: alphabet The Base64 alphabet to encode with.
    :returns: A String of the encoded bytes.
*/
public func EncodeString(bytes : [UInt8], alphabet : Alphabet = .Standard) -> String {
    let encoded = Encode(bytes, alphabet : alphabet)
    var result = String()
    for b in encoded {
        result.append(UnicodeScalar(b))
    }
    return result
}

/// Get the encoding table for the alphabet.
private func tableForAlphabet(alphabet : Alphabet) -> [UInt8] {
    switch alphabet {
    case .Standard:
        return StandardAlphabet
    case .URLAndFilenameSafe:
        return URLAndFilenameSafeAlphabet
    }
}

/**
    Use the Base64 algorithm as decribed by RFC 4648 section 4 to
    encode the input bytes. The alphabet specifies the translation
    table to use. RFC 4648 defines two such alphabets:

    - Standard (section 4)
    - URL and Filename Safe (section 5)

    :param: bytes Bytes to encode.
    :param: alphabet The Base64 alphabet to encode with.
    :returns: Base64 encoded ASCII bytes.
*/
public func Encode(bytes : [UInt8], alphabet : Alphabet = .Standard) -> [UInt8] {
    var encoded : [UInt8] = []
    
    var b = bytes[0..<bytes.count]
    
    //
    let table = tableForAlphabet(alphabet)
    let padding = table[64]
    
    for ; b.count >= 3; b = b[3..<b.count] {
        let one = b[0] >> 2
        let two = ((b[0] & 0b11) << 4) | ((b[1] & 0b11110000) >> 4)
        let three = ((b[1] & 0b00001111) << 2) | ((b[2] & 0b11000000) >> 6)
        let four = b[2] & 0b00111111
        
        encoded.append(table[Int(one)])
        encoded.append(table[Int(two)])
        encoded.append(table[Int(three)])
        encoded.append(table[Int(four)])
    }
    
    if b.count == 2 {
        // (3) The final quantum of encoding input is exactly 16 bits; here, the
        // final unit of encoded output will be three characters followed by
        // one "=" padding character.
        let one = b[0] >> 2
        let two = ((b[0] & 0b11) << 4) | ((b[1] & 0b11110000) >> 4)
        let three = ((b[1] & 0b00001111) << 2)
        encoded.append(table[Int(one)])
        encoded.append(table[Int(two)])
        encoded.append(table[Int(three)])
        encoded.append(padding)
    } else if b.count == 1 {
        // (2) The final quantum of encoding input is exactly 8 bits; here, the
        // final unit of encoded output will be two characters followed by
        // two "=" padding characters.
        let one = b[0] >> 2
        let two = ((b[0] & 0b11) << 4)
        encoded.append(table[Int(one)])
        encoded.append(table[Int(two)])
        encoded.append(padding)
        encoded.append(padding)
    } else {
        // (1) The final quantum of encoding input is an integral multiple of 24
        // bits; here, the final unit of encoded output will be an integral
        // multiple of 4 characters with no "=" padding.
        assert(b.count == 0)
    }
    
    return encoded
}