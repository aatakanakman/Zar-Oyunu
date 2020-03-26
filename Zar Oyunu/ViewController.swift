//
//  ViewController.swift
//  Zar Oyunu
//
//  Created by Atakan AKMAN on 29.02.2020.
//  Copyright © 2020 Atakan AKMAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var birinciZarResmi: UIImageView!
    @IBOutlet weak var ikinciZarResmi: UIImageView!
    @IBOutlet weak var zarHiziniDegistirenSlider: UISlider!
    @IBOutlet weak var skorLabel: UILabel!
    @IBOutlet weak var turLabel: UILabel!
    
    
    var timer : Timer!  //Zaman değişkeni tanımladık, animasyon oluşturmak için gerekli.
    var birinciZarinRastgeleDegeri = 1
    var ikinciZarinRastgeleDegeri = 1
    
    var butonaBasildimi : Bool = false
    
    var skorSonucu : Int = 0
    var turSayisi : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        skorLabel.text = "000"
        turLabel.text = "000"
        
    }


    @IBAction func ZarAtButonunaBasildi(_ sender: Any) {
        
        if butonaBasildimi {
            skorHesapla()
        }
        else{
            oyunuBaslat()
        }
       
        
    }
    @objc  //Fonksiyonun swift dilinde karşılığı olmadıpı fakat bununla swift içinde objektif c olarak kullanmaya yarıyor.
    func zamanlayicininfonksiyonu(){
        birinciZarinRastgeleDegeri = Int.random(in: 1 ... 6 )
        ikinciZarinRastgeleDegeri = Int.random(in: 1 ... 6)
        
        
        birinciZarResmi.image = UIImage.init(named: "group_" + String(birinciZarinRastgeleDegeri))
        ikinciZarResmi.image = UIImage.init(named: "group_" + String(ikinciZarinRastgeleDegeri))
    }
    
    func skorHesapla(){
        butonaBasildimi = false
        timer.invalidate()
        
        // Skor hesabında 1. ve 2. zarın üstündeki değerler çarpılır.
        
        skorSonucu += birinciZarinRastgeleDegeri * ikinciZarinRastgeleDegeri
        skorLabel.text = "\(skorSonucu)"
        
    }
    func oyunuBaslat( ){
        turSayisi = turSayisi + 1
        turLabel.text = "\(turSayisi)"
        butonaBasildimi = true
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(zamanlayicininfonksiyonu), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    @IBAction func infoButonunaBasilsi(_ sender: Any) {
        let allertinfo = UIAlertController(title:"Bilgi", message:"Puanlama zar üstüne gelen sayıların çarpılması ile elde edilir", preferredStyle: .alert)
        let tamam = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
        
        allertinfo.addAction(tamam)
        self.present(allertinfo, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func restartButonunaBasildi(_ sender: Any) {
      
       /* let alert = UIAlertController(title: "Oyun Bitti", message: "Tebrikler", preferredStyle:.alert)
        
        let aksiyon = UIAlertAction(title: "Mükemmel ", style: .default) {(aksiyon) in
            self.yeniOyunBaslat(); // self kullanma amacım iki skopun arasından başka yerde de kullanmak.
            
            // alert aksiyonları nasıl tanımlanır ?
            alert.addAction(aksiyon)
            self.present(alert, animated: true, completion: nil)
            
        }
 */
        
        let alert = UIAlertController(title: "Oyun Bitti ", message: "Tebikler puanınız \(skorSonucu)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil) // tamam butonu tanımı
        alert.addAction(okButton)
        // action eklendi.
        // yapıları görüntülemede kullanılır.
        self.present(alert, animated: true, completion: nil)
        
        if okButton.isEnabled{
            
            skorLabel.text = "0"
            turLabel.text  = "0"
            skorSonucu = 0
            turSayisi  = 0
            butonaBasildimi = false
            
            
            birinciZarinRastgeleDegeri = 1
            ikinciZarinRastgeleDegeri = 1
            
            birinciZarResmi.image = UIImage.init(named: "group_" + String(birinciZarinRastgeleDegeri))
            ikinciZarResmi.image = UIImage.init(named: "group_" + String(ikinciZarinRastgeleDegeri))
            
            
            timer.invalidate() // timerı geçersiz kılma hazır fonksiyonu
            
        }
        
        
        }
    
    
    @IBAction func slider(_ sender: Any) {
        
        
        
        
        
        
    }
    
    
    
    }
    
    
    /*
    
    func yeniOyunBaslat(){
        
        
        skorLabel.text = "0"
        turLabel.text  = "0"
        skorSonucu = 0
        turSayisi  = 0
        butonaBasildimi = false
        
    
        birinciZarinRastgeleDegeri = 1
        ikinciZarinRastgeleDegeri = 1
        
        birinciZarResmi.image = UIImage.init(named: "group_" + String(birinciZarinRastgeleDegeri))
        ikinciZarResmi.image = UIImage.init(named: "group_" + String(ikinciZarinRastgeleDegeri))
        
        
        timer.invalidate() // timerı geçersiz kılma hazır fonksiyonu
        
        
        
    }
 */


    

    
    
    
    
    
    
    
    


