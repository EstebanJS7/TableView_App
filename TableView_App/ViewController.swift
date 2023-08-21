//
//  ViewController.swift
//  TableView_App
//
//  Created by Esteban Jiménez on 2023-08-21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    struct Transferencia {
        let fecha: String
        let numero: Int
        let tipo: String
        let monto: Int
        let icono: String
    }

    // Crear un array de Transferencias
    var transferencias: [Transferencia] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        agregarTransferencia(fecha: "2023-08-21", numero: 12345, tipo: "Depósito", monto: 1000)
        agregarTransferencia(fecha: "2023-08-22", numero: 67890, tipo: "Extracción", monto: -500)
        
        //Personalizar las celdas
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
    
    func agregarTransferencia(fecha: String, numero: Int, tipo: String, monto: Int) {
        let icono = monto >= 0 ? "+" : "-"
        let transferencia = Transferencia(fecha: fecha, numero: numero, tipo: tipo, monto: monto, icono: icono)
        transferencias.append(transferencia)
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transferencias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: <#T##IndexPath#>) as? CustomTableViewCell
        let transferencia = transferencias[indexPath.row]
        let icon = transferencia.icono
        if icon == "+"{
            cell!.imgIcon?.image = UIImage(systemName: "plus.rectangle.fill")
        }
        
        return cell!
    }
}
