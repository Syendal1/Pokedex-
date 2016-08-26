//
//  Pokemon.swift
//  Pokedex
//
//  Created by SnehithNitin on 8/15/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon{
    private var _name:String!
    private var _pokedexId:Int!
    private var _description:String!
    private var _type:String!
    private var _defence:String!
    private var _height:String!
    private var _weight:String!
    private var _attack:String!
    private var _nextEvolutionTxt:String!
    private var _pokemonUrl:String!
    
    var name:String{
        return _name
    }
    
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name:String,pokedexId:Int){
        self._name=name
        self._pokedexId=pokedexId
        
        _pokemonUrl="\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete){
        let url=NSURL(string: _pokemonUrl)!
        
        Alamofire.request(.GET, url).responseJSON { (response) in
            if let JSON=response.result.value{
                print(JSON)
            }
        }
        
    }
}
