//
//  DetallesViewController.swift
//  LibroTableVista
//
//  Created by Mario E Salvatierra V on 7/1/16.
//  Copyright © 2016 Dunas. All rights reserved.
//

import UIKit

class DetallesViewController: UIViewController {
    
    var elLibro: UnLibro!
    
    @IBOutlet weak var tituloTextView: UITextView!
    @IBOutlet weak var autorTextView: UITextView!
    @IBOutlet weak var portadaImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tituloz = elLibro.titulo + elLibro.autores
        print(tituloz)
        
        tituloTextView.text = elLibro.titulo
        autorTextView.text = elLibro.autores
        portadaImageView.image = elLibro.portada
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
