//
//  Block.swift
//  BlockChainTest
//
//  Created by John Jones on 05/12/2017.
//  Copyright © 2017 William Hill. All rights reserved.
//

import Foundation

class Block {
    var index: UInt?
    var previousHash: String?
    var timestamp: Double?
    var data: String?
    var hash: String?

    func calculateHash(index: UInt, previousHash: String, timestamp: Double, data: String) -> String {
        return sha512Hex(string: previousHash+data)
    }

    
    init(index: UInt, previousHash: String, data: String) {
        self.index = index
        self.previousHash = previousHash
        self.data = data
        self.timestamp = NSDate().timeIntervalSince1970
        self.hash = calculateHash(index: index, previousHash: previousHash, timestamp: timestamp!, data: data)
    }
    
    func getGenesisBlock(data: String) -> Block {
        return Block(index: 0, previousHash: "0", data: data)
    }
    
    /* sha functions */
    
    func sha512Hex( string: String) -> String {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        if let data = string.data(using: String.Encoding.utf8) {
            let value =  data as NSData
            CC_SHA512(value.bytes, CC_LONG(data.count), &digest)
            
        }
        var digestHex = ""
        for index in 0..<Int(CC_SHA512_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    
    
    func sha512(string: String) -> [UInt8] {
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        let data = string.data(using: String.Encoding.utf8 , allowLossyConversion: true)
        let value =  data! as NSData
        CC_SHA512(value.bytes, CC_LONG(value.length), &digest)
        
        return digest
    }
    
    func sha512Base64(string: String) -> String {
        let digest = NSMutableData(length: Int(CC_SHA512_DIGEST_LENGTH))!
        if let data = string.data(using: String.Encoding.utf8) {
            
            let value =  data as NSData
            let uint8Pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: digest.length)
            CC_SHA512(value.bytes, CC_LONG(data.count), uint8Pointer)
            
        }
        return digest.base64EncodedString(options: NSData.Base64EncodingOptions([]))
    }
}
