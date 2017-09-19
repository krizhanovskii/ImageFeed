//
//  DataBaseConfiguration.swift
//  KKImageFeed
//
//  Created by Krizhanovskii on 9/19/17.
//  Copyright © 2017 krizhanovskii. All rights reserved.
//

import Foundation
import CoreData
import RealmSwift
import SWSkelethon

class DataBaseConfiguration {
    
    //SET new value
    static let dbVersion: UInt64 = 1
    
    static func configure() {
        var config = Realm.Configuration (
            schemaVersion: dbVersion,
            
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 2) {
                    //migrate

                }
                if (oldSchemaVersion < 3) {
                    //migrate

                }
        },
            deleteRealmIfMigrationNeeded:true
        )
        
        
        config.fileURL = config.fileURL!.deletingLastPathComponent()
            .appendingPathComponent("imageFeed.realm")
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
        // force change
        _ = try? Realm()
        
    }
    
}
