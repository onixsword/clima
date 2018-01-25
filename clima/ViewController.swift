//
//  ViewController.swift
//  clima
//
//  Created by Maestro on 24/01/18.
//  Copyright © 2018 alumno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Lista
    var Fechas: [Temperatura] = []
    
    //Labels
    @IBOutlet weak var lbl_Fecha: UILabel!
    @IBOutlet weak var lbl_Hora: UILabel!
    @IBOutlet weak var lbl_Temperatura: UILabel!
    @IBOutlet weak var vw_Estado: UIView!
    @IBOutlet weak var lbl_Lugar: UILabel!
    
    //Clones
    @IBOutlet weak var lbl_Fecha_Clone: UILabel!
    @IBOutlet weak var lbl_Hora_Clone: UILabel!
    @IBOutlet weak var lbl_Temperatura_Clone: UILabel!
    @IBOutlet weak var lbl_Lugar_Clone: UILabel!
    
    //Spaces
    var EstadoSize: CGSize?
    var EstadoSpace: CGPoint?
    
    //hoy
    var hoy = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_Hora.text = "\(Int(round(drand48()*23))) : \(Int(round(drand48()*59)))"
        lbl_Hora_Clone.text = lbl_Hora.text
        
        //Temperatura
        Fechas.append(Temperatura(Ano: 2018, Mes: 01, Dia: 23, Temp: 18, Estado: 1, Lugar: "Ciudad Obregon"))
        Fechas.append(Temperatura(Ano: 2018, Mes: 01, Dia: 24, Temp: 20, Estado: 1, Lugar: "Ciudad Obregon"))
        Fechas.append(Temperatura(Ano: 2018, Mes: 01, Dia: 25, Temp: 22, Estado: 1, Lugar: "Ciudad Obregon"))
        Fechas.append(Temperatura(Ano: 2018, Mes: 01, Dia: 26, Temp: 18, Estado: 1, Lugar: "Ciudad Obregon"))
        
        //Labels
        lbl_Fecha.text = "\(Fechas[hoy].fecha.Dia) / \(Fechas[hoy].fecha.Mes) / \(Fechas[hoy].fecha.Ano)"
        lbl_Temperatura.text = "\(Fechas[hoy].temperatura)"
        lbl_Lugar.text = "\(Fechas[hoy].lugar)"
        
        //Clones
        /*lbl_Hora_Clone.alpha = 0
        lbl_Fecha_Clone.alpha = 0
        lbl_Lugar_Clone.alpha = 0
        lbl_Temperatura_Clone.alpha = 0*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        EstadoSize = CGSize(width: vw_Estado.bounds.width, height: vw_Estado.bounds.height)
        EstadoSpace = CGPoint(x: vw_Estado.center.x, y: vw_Estado.center.y)
        
        //clones
        lbl_Fecha_Clone.center.x -= self.view.bounds.width
        lbl_Hora_Clone.center.x -= self.view.bounds.width
        lbl_Temperatura_Clone.center.x -= self.view.bounds.width
        lbl_Lugar_Clone.center.x -= self.view.bounds.width
    }
    
    func cambiarEstado(estado: Int){
        
    }

    @IBAction func slide1(_ sender: Any) {
        self.hoy += 1
        
        self.lbl_Fecha_Clone.text = "\(self.Fechas[self.hoy].fecha.Dia) / \(self.Fechas[self.hoy].fecha.Mes) / \(self.Fechas[self.hoy].fecha.Ano)"
        self.lbl_Temperatura_Clone.text = "\(self.Fechas[self.hoy].temperatura)"
        self.lbl_Lugar_Clone.text = "\(self.Fechas[self.hoy].lugar)"
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.lbl_Fecha.center.x += self.view.bounds.width
            self.lbl_Fecha_Clone.center.x = self.view.bounds.width/2
        }, completion: {_ in
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                self.lbl_Hora.center.x += self.view.bounds.width
                self.lbl_Hora_Clone.center.x = self.view.bounds.width/2
            }, completion: {_ in
                UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                    self.lbl_Temperatura.center.x += self.view.bounds.width
                    self.lbl_Temperatura_Clone.center.x = self.view.bounds.width/2
                }, completion: {_ in
                    self.cambiarEstado(estado: self.hoy)
                    self.lbl_Fecha.text = "\(self.Fechas[self.hoy].fecha.Dia) / \(self.Fechas[self.hoy].fecha.Mes) / \(self.Fechas[self.hoy].fecha.Ano)"
                    self.lbl_Temperatura.text = "\(self.Fechas[self.hoy].temperatura)"
                    self.lbl_Lugar.text = "\(self.Fechas[self.hoy].lugar)"
                    
                    //lugares
                    self.lbl_Fecha.center.x = self.view.bounds.width/2
                    self.lbl_Hora.center.x = self.view.bounds.width/2
                    self.lbl_Temperatura.center.x = self.view.bounds.width/2
                    
                    //clones lugares
                    self.lbl_Fecha_Clone.center.x = -self.view.bounds.width/2
                    self.lbl_Hora_Clone.center.x = -self.view.bounds.width/2
                    self.lbl_Temperatura_Clone.center.x = -self.view.bounds.width/2
                })
            })
        })
    }
    
    @IBAction func slideIzquierda(_ sender: Any) {
        
    }
}

