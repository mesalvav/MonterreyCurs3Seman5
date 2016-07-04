//
//  LibroTableViewController.swift
//  LibroTableVista
//
//  Created by Mario E Salvatierra V on 6/30/16.
//  Copyright © 2016 Dunas. All rights reserved.
//

import UIKit
import CoreData

class LibroTableViewController: UITableViewController {

     var mislibros: [UnLibro] = [UnLibro]()
    var contexto: NSManagedObjectContext? = nil
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mis libros favoritos"
        self.contexto = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
//        let libroEntidad = NSEntityDescription.entityForName("UnLibro", inManagedObjectContext: self.contexto!)
//        
//        let peticion = libroEntidad?.managedObjectModel.fetchRequestTemplateForName("petLibros")
//        do {
//            let librosEntidad = try self.contexto?.executeFetchRequest(peticion!)
//            
//            for librox in librosEntidad! {
//                let titulox = librox.valueForKey("titulo") as! String
//                print("de DB titulox es \(titulox)")
//                let isbnx = librox.valueForKey("isbn") as! String
//                print("de DB ISBNx es \(isbnx)")
//                let autorx = librox.valueForKeyPath("tiene.nombre") as? String
//                print("de DB autorx es \(autorx)")
//                
//            }
//        } catch _ {}
//        ////autores
//        let autorEntidad = NSEntityDescription.entityForName("Autores", inManagedObjectContext: self.contexto!)
//        
//        let peticion2 = autorEntidad?.managedObjectModel.fetchRequestTemplateForName("petAutores")
//        do {
//            let autoresEntidad = try self.contexto?.executeFetchRequest(peticion2!)
//            
//            for autorx in autoresEntidad! {
//                
//                let nombrex = autorx.valueForKey("nombre") as! String
//                //print("de DB autorx es \(nombrex)")
//                
//            }
//        } catch _ {}
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let libroEntidad = NSEntityDescription.entityForName("UnLibro", inManagedObjectContext: self.contexto!)
        
        let peticion = libroEntidad?.managedObjectModel.fetchRequestTemplateForName("petLibros")
        var contarLibros = 0
        do {
             let librosEntidad = try self.contexto?.executeFetchRequest(peticion!)
            
                if librosEntidad != nil {
                    contarLibros = (librosEntidad?.count)!
                }
            
        } catch _ {}
        
        //return mislibros.count
        return contarLibros
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IdentCelda", forIndexPath: indexPath)
        
        // Configure the cell...
        //cell.textLabel?.text = self.mislibros[indexPath.row].titulo
        //cell.imageView?.image = self.mislibros[indexPath.row].portada
        let libroEntidad = NSEntityDescription.entityForName("UnLibro", inManagedObjectContext: self.contexto!)
        
        let peticion = libroEntidad?.managedObjectModel.fetchRequestTemplateForName("petLibros")
        var librosEntidad: [AnyObject]? = nil
        do {
            librosEntidad = try self.contexto?.executeFetchRequest(peticion!)
            if librosEntidad != nil {
               
                let librox = librosEntidad![indexPath.row]
                
                let titulox = librox.valueForKey("titulo") as! String
               // print("de DB titulox es \(titulox)")
                cell.textLabel?.text = titulox
                
                }
            } catch _ {}
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    @IBAction func goBack(segue: UIStoryboardSegue) {
        //print("someone unwound")
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            if segue.identifier == "DetalleSegue" {
                let mostrarDetalle = segue.destinationViewController as! DetallesViewController
            
                let ip = self.tableView.indexPathForSelectedRow?.row
                
                let libroEntidad = NSEntityDescription.entityForName("UnLibro", inManagedObjectContext: self.contexto!)
                let peticion = libroEntidad?.managedObjectModel.fetchRequestTemplateForName("petLibros")
                var librosEntidad: [AnyObject]? = nil
                var libroSeleccionado: UnLibro? = nil
                do {
                    librosEntidad = try self.contexto?.executeFetchRequest(peticion!)
                    if librosEntidad != nil {
                        
                        let librox = librosEntidad![ip!]
                        
                        let titulox = librox.valueForKey("titulo") as! String
                        print("de DB titulox es \(titulox)")
                        let isbnx = librox.valueForKey("isbn") as! String
                        print("de DB ISBNx es \(isbnx)")
                        let autorx = librox.valueForKeyPath("tiene.nombre") as? String
                        print("de DB autorx es \(autorx)")
                        let imaDatax = librox.valueForKey("portada") as? NSData
                        var imax:UIImage? = nil
                            if imaDatax != nil {
                                imax = UIImage(data: imaDatax!)
                            }
                        libroSeleccionado = UnLibro(titulo: titulox, autores: autorx!, portada: imax, ISBN: isbnx)
                    }
                } catch _ {}
                
               // mostrarDetalle.elLibro = mislibros[(ip?.row)!]
                mostrarDetalle.elLibro = libroSeleccionado
                }
        }
    

}
