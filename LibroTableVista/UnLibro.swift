//
//  UnLibro.swift
//  LibroTableVista
//
//  Created by Mario E Salvatierra V on 6/30/16.
//  Copyright © 2016 Dunas. All rights reserved.
//

import Foundation
import UIKit

struct UnLibro {
    
    var titulo: String
    var autores: String
    var portada: UIImage?
    var isbn: String
    
    init(titulo: String, autores: String, portada: UIImage?, ISBN: String) {
        
        self.titulo = titulo
        self.autores = autores
        self.portada = portada
        self.isbn = ISBN
    }
}