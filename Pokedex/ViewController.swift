//
//  ViewController.swift
//  Pokedex
//
//  Created by SnehithNitin on 8/15/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView:UICollectionView!
    
    var pokemon=[Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        
        parsePokemonCSV()
    }
    
    func parsePokemonCSV(){
        
        let path=NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do{
            let csv=try CSV(contentsOfURL: path )
            let rows=csv.rows
            for row in rows{
                let pokeID=Int(row["id"]!)!
                let name=row["identifier"]!
                let poke=Pokemon(name: name, pokedexId: pokeID)
                pokemon.append(poke)
            }
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 718
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
            
            //let pokemon=Pokemon(name: "num:\(indexPath.row)",pokedexId: indexPath.row)
            //cell.configureCell(pokemon)
            
            let poke=pokemon[indexPath.row]
            cell.configureCell(poke)
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        /////
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(105, 105)
    }



}

