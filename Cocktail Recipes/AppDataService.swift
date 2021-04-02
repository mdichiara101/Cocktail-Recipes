//
//  File.swift
//  Cocktail Recipes
//
//  Created by Michael Dichiara on 4/1/21.
//

import Foundation

let Gresults = [Drink]()

protocol  DataService{
    func getDrinks(completion: @escaping ([Drink]) -> Void)
    
    func getRandomDrink(completion: @escaping ([Drink]) -> Void)
}

class AppDataService: DataService {
    
    
    func getDrinks(completion: @escaping ([Drink]) -> Void) {
        var results = [Drink]()
        
        for letter in "abcdefghijklmnopqrstuvwxyz" {
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=\(letter)")
        //https://www.thecocktaildb.com/api/json/v1/1/random.php
        else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
              do {
                let decodedResponse = try JSONDecoder().decode(Drinks.self, from: data)
                DispatchQueue.main.async {
                        results += decodedResponse.drinks
                        completion(results)
                 }
              } /*catch let jsonError as NSError {
                print("JSON decode failed: \(jsonError.localizedDescription)")
              } */
              catch DecodingError.keyNotFound(let key, let context) {
                  Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
              } catch DecodingError.valueNotFound(let type, let context) {
                  Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
              } catch DecodingError.typeMismatch(let type, let context) {
                  Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
              } catch DecodingError.dataCorrupted(let context) {
                  Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
              } catch let error as NSError {
                  NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
              }
              return
            }
            
    print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        
    }.resume()
    
    }
    }
    
    
    func getRandomDrink(completion: @escaping ([Drink]) -> Void) {
        
        
        
        
        guard let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/random.php")
    
        else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
              do {
                let decodedResponse = try JSONDecoder().decode(Drinks.self, from: data)
                DispatchQueue.main.async {
                        
                        completion(decodedResponse.drinks)
                 }
              } /*catch let jsonError as NSError {
                print("JSON decode failed: \(jsonError.localizedDescription)")
              } */
              catch DecodingError.keyNotFound(let key, let context) {
                  Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
              } catch DecodingError.valueNotFound(let type, let context) {
                  Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
              } catch DecodingError.typeMismatch(let type, let context) {
                  Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
              } catch DecodingError.dataCorrupted(let context) {
                  Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
              } catch let error as NSError {
                  NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
              }
              return
            }
            
    print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        
    }.resume()
    
    
    }
    
    
}

