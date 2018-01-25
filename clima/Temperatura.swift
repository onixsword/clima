//
//  Temperatura.swift
//  clima
//
//  Created by Maestro on 24/01/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import Foundation

class Temperatura{
    
    var fecha: FechaSimple
    var temperatura: Int
    var estado: Int
    var lugar: String
    
    init(Ano: Int, Mes: Int, Dia: Int, Temp: Int, Estado: Int, Lugar: String) {
        self.fecha = FechaSimple(Ano: Ano, Mes: Mes, Dia: Dia)
        self.temperatura = Temp
        self.estado = Estado
        self.lugar = Lugar
    }
    
}
