//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by SnehithNitin on 8/18/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon:Pokemon!
    @IBOutlet var pokemonName: UILabel!
    @IBOutlet var mainImg: UIImageView!
    @IBOutlet var descriptionLbl: UILabel!
    @IBOutlet var typeLbl: UILabel!
    @IBOutlet var defenceLbl: UILabel!
    @IBOutlet var heightLbl: UILabel!
    @IBOutlet var pokedexIdLbl: UILabel!
    @IBOutlet var weightLbl: UILabel!
    @IBOutlet var baseAttackLbl: UILabel!
    @IBOutlet var currentEvoImg: UIImageView!
    @IBOutlet var nextEvoImg: UIImageView!
    @IBOutlet var evoLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonName.text=pokemon.name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
