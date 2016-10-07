//
//  SwiftyBase64Tests.swift
//  SwiftyBase64Tests
//
//  Created by Doug Richardson on 8/7/15.
//
//

import XCTest
import SwiftyBase64

class SwiftyBase64Tests: XCTestCase {
    
    // Test data generated using generate_binary_testfile.c like so:
    // gcc generate_binary_testfile.c && ./a.out <start> <end> | base64
    
    func testEmpty() {
        XCTAssertEqual(SwiftyBase64.EncodeString([]), "")
        XCTAssertEqual(SwiftyBase64.EncodeString([], alphabet:.URLAndFilenameSafe), "")
    }
    
    func testBase64OneByte() {
        XCTAssertEqual(SwiftyBase64.EncodeString([0]), "AA==")
        XCTAssertEqual(SwiftyBase64.EncodeString([0], alphabet:.URLAndFilenameSafe), "AA==")
    }
    
    func testBase64TwoBytes() {
        XCTAssertEqual(SwiftyBase64.EncodeString([0,0]), "AAA=")
        XCTAssertEqual(SwiftyBase64.EncodeString([0,0], alphabet:.URLAndFilenameSafe), "AAA=")
    }
    
    func testBase64ThreeBytes() {
        XCTAssertEqual(SwiftyBase64.EncodeString([0,0,0]), "AAAA")
        XCTAssertEqual(SwiftyBase64.EncodeString([0,0,0], alphabet:.URLAndFilenameSafe), "AAAA")
    }
    
    func test255() {
        XCTAssertEqual(SwiftyBase64.EncodeString([255]), "/w==")
        XCTAssertEqual(SwiftyBase64.EncodeString([255], alphabet:.URLAndFilenameSafe), "_w==")
    }
    
    func test254Thru255() {
        XCTAssertEqual(SwiftyBase64.EncodeString([254, 255]), "/v8=")
        XCTAssertEqual(SwiftyBase64.EncodeString([254, 255], alphabet:.URLAndFilenameSafe), "_v8=")
    }
    
    func testZeroThrough255() {
        // generated with generate_binary_testfile.c and base64 command line tool.
        let expectedStandard = "AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8gISIjJCUmJygpKissLS4vMDEyMzQ1Njc4OTo7PD0+P0BBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWltcXV5fYGFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6e3x9fn+AgYKDhIWGh4iJiouMjY6PkJGSk5SVlpeYmZqbnJ2en6ChoqOkpaanqKmqq6ytrq+wsbKztLW2t7i5uru8vb6/wMHCw8TFxsfIycrLzM3Oz9DR0tPU1dbX2Nna29zd3t/g4eLj5OXm5+jp6uvs7e7v8PHy8/T19vf4+fr7/P3+/w=="
        let expectedURLSafe = "AAECAwQFBgcICQoLDA0ODxAREhMUFRYXGBkaGxwdHh8gISIjJCUmJygpKissLS4vMDEyMzQ1Njc4OTo7PD0-P0BBQkNERUZHSElKS0xNTk9QUVJTVFVWV1hZWltcXV5fYGFiY2RlZmdoaWprbG1ub3BxcnN0dXZ3eHl6e3x9fn-AgYKDhIWGh4iJiouMjY6PkJGSk5SVlpeYmZqbnJ2en6ChoqOkpaanqKmqq6ytrq-wsbKztLW2t7i5uru8vb6_wMHCw8TFxsfIycrLzM3Oz9DR0tPU1dbX2Nna29zd3t_g4eLj5OXm5-jp6uvs7e7v8PHy8_T19vf4-fr7_P3-_w=="
        
        var b = [UInt8]()
        for i in 0...255 {
            b.append(UInt8(i))
        }
        
        XCTAssertEqual(SwiftyBase64.EncodeString(b), expectedStandard)
        XCTAssertEqual(SwiftyBase64.EncodeString(b, alphabet:.URLAndFilenameSafe), expectedURLSafe)
    }
    
    func testOneThrough255() {
        // generated with generate_binary_testfile.c and base64 command line tool.
        let expectedStandard = "AQIDBAUGBwgJCgsMDQ4PEBESExQVFhcYGRobHB0eHyAhIiMkJSYnKCkqKywtLi8wMTIzNDU2Nzg5Ojs8PT4/QEFCQ0RFRkdISUpLTE1OT1BRUlNUVVZXWFlaW1xdXl9gYWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXp7fH1+f4CBgoOEhYaHiImKi4yNjo+QkZKTlJWWl5iZmpucnZ6foKGio6SlpqeoqaqrrK2ur7CxsrO0tba3uLm6u7y9vr/AwcLDxMXGx8jJysvMzc7P0NHS09TV1tfY2drb3N3e3+Dh4uPk5ebn6Onq6+zt7u/w8fLz9PX29/j5+vv8/f7/"
        let expectedURLSafe = "AQIDBAUGBwgJCgsMDQ4PEBESExQVFhcYGRobHB0eHyAhIiMkJSYnKCkqKywtLi8wMTIzNDU2Nzg5Ojs8PT4_QEFCQ0RFRkdISUpLTE1OT1BRUlNUVVZXWFlaW1xdXl9gYWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXp7fH1-f4CBgoOEhYaHiImKi4yNjo-QkZKTlJWWl5iZmpucnZ6foKGio6SlpqeoqaqrrK2ur7CxsrO0tba3uLm6u7y9vr_AwcLDxMXGx8jJysvMzc7P0NHS09TV1tfY2drb3N3e3-Dh4uPk5ebn6Onq6-zt7u_w8fLz9PX29_j5-vv8_f7_"
        
        var b = [UInt8]()
        for i in 1...255 {
            b.append(UInt8(i))
        }
        
        XCTAssertEqual(SwiftyBase64.EncodeString(b), expectedStandard)
        XCTAssertEqual(SwiftyBase64.EncodeString(b, alphabet:.URLAndFilenameSafe), expectedURLSafe)
    }
    
    func testTwoThrough255() {
        // generated with generate_binary_testfile.c and base64 command line tool.
        let expectedStandard = "AgMEBQYHCAkKCwwNDg8QERITFBUWFxgZGhscHR4fICEiIyQlJicoKSorLC0uLzAxMjM0NTY3ODk6Ozw9Pj9AQUJDREVGR0hJSktMTU5PUFFSU1RVVldYWVpbXF1eX2BhYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5ent8fX5/gIGCg4SFhoeIiYqLjI2Oj5CRkpOUlZaXmJmam5ydnp+goaKjpKWmp6ipqqusra6vsLGys7S1tre4ubq7vL2+v8DBwsPExcbHyMnKy8zNzs/Q0dLT1NXW19jZ2tvc3d7f4OHi4+Tl5ufo6err7O3u7/Dx8vP09fb3+Pn6+/z9/v8="
        let expectedURLSafe = "AgMEBQYHCAkKCwwNDg8QERITFBUWFxgZGhscHR4fICEiIyQlJicoKSorLC0uLzAxMjM0NTY3ODk6Ozw9Pj9AQUJDREVGR0hJSktMTU5PUFFSU1RVVldYWVpbXF1eX2BhYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5ent8fX5_gIGCg4SFhoeIiYqLjI2Oj5CRkpOUlZaXmJmam5ydnp-goaKjpKWmp6ipqqusra6vsLGys7S1tre4ubq7vL2-v8DBwsPExcbHyMnKy8zNzs_Q0dLT1NXW19jZ2tvc3d7f4OHi4-Tl5ufo6err7O3u7_Dx8vP09fb3-Pn6-_z9_v8="
        
        var b = [UInt8]()
        for i in 2...255 {
            b.append(UInt8(i))
        }
        
        XCTAssertEqual(SwiftyBase64.EncodeString(b), expectedStandard)
        XCTAssertEqual(SwiftyBase64.EncodeString(b, alphabet:.URLAndFilenameSafe), expectedURLSafe)
    }
    
    func testPerformanceBase64() {
        var b = [UInt8]()
        for i in 0...(50*1024) {
            b.append(UInt8(i % 256))
        }
        
        self.measure() {
            _ = SwiftyBase64.Encode(b)
        }
    }
    
}
