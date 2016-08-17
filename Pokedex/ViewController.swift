//
//  ViewController.swift
//  Pokedex
//
//  Created by SnehithNitin on 8/15/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet var musicBtn: UIButton!
    @IBOutlet var searchBar: UISearchBar!
    var pokemon=[Pokemon]()
    var filteredPokemon=[Pokemon]()
    var audioPlayer:AVAudioPlayer!
    var inSearchMode=false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        searchBar.delegate=self
        
        parsePokemonCSV()
        playMusic()
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
    
    func playMusic(){
        let path=NSBundle.mainBundle().pathForResource("music", ofType: "mp3")
        let urlPath=NSURL(fileURLWithPath: path!)
        do{
            try audioPlayer=AVAudioPlayer(contentsOfURL: urlPath)
            audioPlayer.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func musicControl(sender: AnyObject) {
        if audioPlayer.playing{
            audioPlayer.stop()
            musicBtn.alpha=0.3
        }else{
            audioPlayer.play()
            musicBtn.alpha=1
        }
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode{
            return filteredPokemon.count
        }
        return pokemon.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
            
            //let pokemon=Pokemon(name: "num:\(indexPath.row)",pokedexId: indexPath.row)
            //cell.configureCell(pokemon)
            
            let poke:Pokemon!
            if inSearchMode{
                poke=filteredPokemon[indexPath.row]
            }
            else{
                poke=pokemon[indexPath.row]
            }
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
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text==nil||searchBar==""{
            inSearchMode=false
        }else{
            inSearchMode=true
            let searchItem=searchBar.text!.lowercaseString
            filteredPokemon=pokemon.filter({$0.name.rangeOfString(searchItem) != nil})
            collectionView.reloadData()
        }
    }



}

