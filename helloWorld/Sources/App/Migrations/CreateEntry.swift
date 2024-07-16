//
//  File.swift
//  
//
//  Created by Jungjin Park on 2024-07-16.
//

import Fluent

struct CreateEntry: Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("entries")
            .id()
            .field("title", .string, .required)
            .field("content", .string, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("entries").delete()
    }
}
