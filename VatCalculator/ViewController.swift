//
//  ViewController.swift
//  VatCalculator
//
//  Created by Dario Balzamo on 29/05/24.
//

// UIKIT è un framework, ovvero una cartella in cui sono presenti tool di design per la UI
import UIKit


// UIViewController è l'oggetto che gestisce la view, controlla la scena
class ViewController: UIViewController {
    
    /** IBOutlet: Interface Builder Outlet
     è una variabile che rappresenta un collegamento tra un componente della scena (view) e il controller (code).
     NOTA: se si vuole rinominare gli outlet, bisogna prima scollegare gli elementi.
     */
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var calculateButton: UIButton!
    
    var priceNumber: Double?
    
    /** Ereditiamo dalla superclasse UIViewController la property view (oggetto di tipo
     UIView) avente proprietà e metodi.La view ci permette di modificare la view
     controllata dal ViewController.
     */
    
    // Questo metodo viene richiamato prima che la scena compaia sul device.
    override func viewDidLoad() 
    {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        // Grazie alle Outlet, posso gestire l'aspetto e il contenuto degli elementi presenti all'interno di una scena
        self.resultLabel.text = "0.00 $"
        self.resultView.isHidden = true
        self.calculateButton.isHidden = true
    }
    
    
    /** IBAction: Interface Builder Action
     è un metodo (collegamento tra un componente e il codice) che si attiva quando cattura un evento
     su un elemento interattivo.
     Ad es: un button presente in una scena (elemento interattivo), quando l'utente click un button
     viene generato un evento, quest'ultimo viene propagato al view controller che lo elaborerà.
     Il metodo riceve in input un parametro sender, ovvero colui che genera l'evento.
     */
    @IBAction func calculatorButton(_ sender: UIButton) 
    {
        // controllo che priceNumber non sia nulla
        guard let number = priceNumber else {
            return
        }
        
        //Calcolo l'iva sul prezzo
        let finalPrice = number + (number * 0.22)
        self.resultLabel.text = "\(finalPrice)"
        self.resultView.isHidden = false
    }

    
    @IBAction func priceTextField(_ sender: UITextField) {
        // Controllo se il testo è presente nel textField o se e di tipo numerico
        guard let text = sender.text,
        let number = Double.init(text)
        else {
            // caso in cui se il text è nil o stringa
            print("E' un campo numerico!")
            self.calculateButton.isHidden = true
            self.resultView.isHidden = true
            return
        }
            
        guard number != 0.0 else {
            print("Il campo deve essere diverso da zero")
            self.calculateButton.isHidden = true
            self.resultView.isHidden = true
            return
        }
        
        self.calculateButton.isHidden = false
        self.priceNumber = number
    }
    
}
