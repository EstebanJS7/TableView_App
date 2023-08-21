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
        
        agregarTransferencia(fecha: "18-ago-2023", numero: 2508757, tipo: "Transferencia Enviada SPI", monto: -25000)
        agregarTransferencia(fecha: "18-ago-2023", numero: 2546123, tipo: "Retiro de efectivo en ATM", monto: -150000)
        agregarTransferencia(fecha: "18-ago-2023", numero: 2546123, tipo: "Retiro de efectivo en ATM", monto: -150000)
        agregarTransferencia(fecha: "18-ago-2023", numero: 2546123, tipo: "Retiro de efectivo en ATM", monto: -150000)
        agregarTransferencia(fecha: "18-ago-2023", numero: 2508757, tipo: "Transferencia Enviada SPI", monto: -850000)
        agregarTransferencia(fecha: "18-ago-2023", numero: 2546123, tipo: "Transferencia Recibida SPI", monto: 150000)
        agregarTransferencia(fecha: "18-ago-2023", numero: 2508757, tipo: "Deposito en Efectivo ATM", monto: 850000)
        
        //Personalizar las celdas
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        
    }
    
    func agregarTransferencia(fecha: String, numero: Int, tipo: String, monto: Int) {
        let icono = monto >= 0 ? "+" : "-"
        let transferencia = Transferencia(fecha: fecha, numero: numero, tipo: tipo, monto: monto, icono: icono)
        transferencias.append(transferencia)
    }
    
    func addSpaceIfNotNegative(_ input: String) -> String {
        var result = input
        
        if let firstCharacter = input.first, firstCharacter != "-" {
            result.insert(" ", at: result.startIndex)
        }
        
        return result
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transferencias.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? CustomTableViewCell
        let transferencia = transferencias[indexPath.row]
        let icon = transferencia.icono
        if icon == "+"{
            cell!.imgIcon?.image = UIImage(named: "plus")
        }else{
            cell!.imgIcon?.image = UIImage(named: "minus")
        }
        let numero = String(transferencia.numero)
        let fecha = transferencia.fecha
        let monto = transferencia.monto
        let tipo = transferencia.tipo
        
        cell!.lDateN?.text = "\(fecha) - \(numero)"
        if monto < 0 {
            cell!.lMonto?.textColor = .black
        }
        let montoStr = addSpaceIfNotNegative(String(monto))
        cell!.lMonto?.text = "Gs. \(montoStr)"
        cell!.lNombre.text = tipo
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}
