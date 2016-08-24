//
//  Pokemon.swift
//  Pokedex
//
//  Created by SnehithNitin on 8/15/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import Foundation

class Pokemon{
    private var _name:String!
    private var _pokedexId:Int!
    private var _description:String!
    private var _type:String!
    private var _defence:String!
    private var _height:String!
    private var _weight:String!
    private var _attack:String!
    private var nextEvolutionTxt:String!
    
    var name:String{
        return _name
    }
    
    var pokedexId:Int{
        return _pokedexId
    }
    
    init(name:String,pokedexId:Int){
        self._name=name
        self._pokedexId=pokedexId
    }
}
