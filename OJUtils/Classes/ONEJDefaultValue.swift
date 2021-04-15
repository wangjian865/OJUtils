//
//  ONEJDefaultValue.swift
//  WJUtil
//
//  Created by wangjian01 on 2021/4/13.
//  Copyright © 2021 wangjian01. All rights reserved.
//
// propertyWrapper+Decoding协议进行json转模型
import Foundation

protocol DefaultValue {
    associatedtype value: Decodable
    static var defaultValue: value { get }
}
extension Bool: DefaultValue {
    static let defaultValue = false
}

@propertyWrapper
struct Default<T: DefaultValue> {
    
    var wrappedValue: T.value
}
extension Default: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.value.self)) ?? T.defaultValue
    }
}
//添加默认值实现
extension KeyedDecodingContainer {
    func decode<T>(
        _ type: Default<T>.Type,
        forKey key: Key
    ) throws -> Default<T> where T: DefaultValue {
        try decodeIfPresent(type, forKey: key) ?? Default(wrappedValue: T.defaultValue)
    }
}


//for example
struct Video: Decodable {
    enum State: String, Decodable {
        case streaming // 正在直播
        case archived  // 已完成
        case unKnowed
    }
    
    // ...
    @Default<State>
    var state: State
    
    func showLog() {
        print("state: \(state.rawValue)")
    }
}
extension Video.State: DefaultValue {
    struct Streaming: DefaultValue {
        static let defaultValue = Video.State.streaming
    }
    struct Archived: DefaultValue {
        static let defaultValue = Video.State.archived
    }
    
    static let defaultValue = Video.State.unKnowed
    
}
/*
 let jsonString =
 """
 {
     "state1": "streaming"
 }
 """
 let model = try JSONDecoder().decode(Video.self, from: jsonString.data(using: .utf8)!)
 **/

