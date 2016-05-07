//
//  ModeloBD.swift
//  Tienda
//
//  Created by Alvaro Lopez on 6/5/16.
//  Copyright © 2016 Alvaro Lopez. All rights reserved.
//
import UIKit

let sharedInstance = ModeloBD()

class ModeloBD: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> ModeloBD
    {
        if(sharedInstance.database == nil)
        {
            sharedInstance.database = FMDatabase(path: Utilities.getPath("Tienda.db"))
        }
        
        return sharedInstance
    }
    
    func getAllArticles() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM articulos ORDER BY nombre", withArgumentsInArray: nil)
        let arrDataArticulos : NSMutableArray = NSMutableArray()
        
        if (resultSet != nil) {
            
            print("llena la madre")
            while resultSet.next() {
                let articulosInfo : ArticulosData = ArticulosData()
                articulosInfo.idArticulo = resultSet.stringForColumn("id")
                print(resultSet.stringForColumn("id"))
                
                articulosInfo.dsArticulo = resultSet.stringForColumn("nombre")
                print(resultSet.stringForColumn("nombre"))
                
                articulosInfo.valArticulo = resultSet.stringForColumn("precio")
                print(resultSet.stringForColumn("precio"))

                articulosInfo.exitArticulo = resultSet.stringForColumn("cantidad")
                print(resultSet.stringForColumn("cantidad"))

                arrDataArticulos.addObject(articulosInfo)
            }
        }else{
        
            print("vacia la madre")
        }
        
        sharedInstance.database!.close()
        return arrDataArticulos
    }
    
}