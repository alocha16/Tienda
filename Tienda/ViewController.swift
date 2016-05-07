//
//  ViewController.swift
//  Tienda
//
//  Created by Alvaro Lopez on 6/5/16.
//  Copyright © 2016 Alvaro Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var tableArticulos: UITableView!
    var arrayDataArticulos:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllDataArticles()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //funciones mias
    
    func getAllDataArticles(){
    arrayDataArticulos = NSMutableArray()
    arrayDataArticulos = ModeloBD.getInstance().getAllArticles()
    tableArticulos.reloadData()
    
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDataArticulos.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let myCell:CellArticulos = tableView.dequeueReusableCellWithIdentifier("myCell") as! CellArticulos
        
        let articulo: ArticulosData = arrayDataArticulos.objectAtIndex(indexPath.row) as! ArticulosData
        
        myCell.lbTitulo.text = articulo.dsArticulo
        myCell.lbPrecio.text = articulo.valArticulo
        myCell.lbExistencia.text = articulo.exitArticulo
        return myCell
        
    }
    
    
    
}

