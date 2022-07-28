//
//  Model.swift
//  SkiResorts
//
//  Created by Eduardo Herrera on 11/7/22.
//

import SwiftUI

struct Place: Identifiable {
    let id = UUID()
    let imageName: String
    let country: String
    let description: String
    let province: String
    let title: String
    let ratings: Double
    let reviews: Double
    let snowLevel: Double
    let distance: Double
  
}


struct Model {

    let places = [Place(imageName: "Img2", country: "Alemania", description: "Donec interdum malesuada ultricies. Aliquam vitae metus tristique, varius justo eget, tincidunt nunc. Vivamus ac augue gravida, sagittis nibh eu, faucibus eros. consectetur finibus, ex sapien mattis augue, id egestas nibh risus at lectus. Cras vulputate massa non placerat suscipit. Quisque aliquam ut elit ac tincidunt. Curabitur viverra egestas nisi.", province: "Baviera", title: "Oberstdorf", ratings: 30, reviews: 12, snowLevel: 160, distance: 180),
                  Place(imageName: "Img1", country: "Italia", description: "Donec interdum malesuada ultricies. Aliquam vitae metus tristique, varius justo eget, tincidunt nunc. Vivamus ac augue gravida, sagittis nibh eu, faucibus.", province: "Belluno", title: "Cortina d'Ampezzo", ratings: 20.5, reviews: 6, snowLevel: 120, distance: 117),
                  Place(imageName: "Img3", country: "Francia", description: "Donec interdum malesuada ultricies. Aliquam vitae metus tristique, varius justo eget, tincidunt nunc. Vivamus ac augue gravida, sagittis nibh eu, faucibus eros. Pellentesque laoreet, erat vel consectetur finibus, ex sapien mattis augue, id egestas nibh risus at lectus. Cras vulputate massa non placerat suscipit. Quisque aliquam ut elit ac tincidunt. Curabitur libero mi, cursus et nulla facilisis, viverra egestas nisi.", province: "Saboya", title: "Tignes", ratings: 38, reviews: 10, snowLevel: 100, distance: 150),
                  Place(imageName: "Img4", country: "España", description: "Donec interdum malesuada ultricies. Aliquam vitae metus tristique, varius justo eget, tincidunt nunc. Quisque aliquam ut elit ac tincidunt. Curabitur libero mi, cursus et nulla facilisis, viverra egestas nisi.", province: "Granada", title: "Sierra Nevada Granada", ratings: 5, reviews: 1, snowLevel: 175, distance: 200)]
    
    
}
