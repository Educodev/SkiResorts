//
//  DetailView.swift
//  SkiResorts
//
//  Created by Eduardo Herrera on 25/7/22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var back
    
    let place: Place
    
    let heightHeader: CGFloat = UIScreen.main.bounds.height/3
    @State var titleButtomSelected = ""
    @State var addFavorite = false
    
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Color.white
            
            ScrollView(showsIndicators: false) {
                VStack {
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .global).minY
                        
                        
                        Image(place.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width,
                                   height: offset > 0 ? heightHeader+offset : heightHeader)
                            .clipped()
                            .offset(y: -offset)
                        
                    }
                    .frame(height: heightHeader)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(place.country)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                            
                            Text(place.province + ", " + place.country)
                                .font(.caption)
                                .bold()
                                .foregroundColor(.gray)
                            
                            
                            Spacer()
                            
                            HStack(spacing: 8) {
                                RatingsView(percentage: place.ratings/(place.reviews*5)*100)
                                    .frame(width: UIScreen.main.bounds.width/5)
                                
                                Text(String(place.ratings))
                                    .bold()
                                    .font(.caption2)
                                    .foregroundColor(.blue)
                            }
                            
                            
                        }
                        .padding()
                        
                        Text(place.title)
                            .font(.largeTitle)
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(.blue)
                       
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack(spacing: 32) {
                                let titleButtons = ["Overview", "Reviews", "Forecast", "Tracks"]
                                
                                ForEach(titleButtons, id: \.self) { title in
                                    Button {
                                        titleButtomSelected = title
                                    } label: {
                                        Text(title)
                                            .bold()
                                            .foregroundColor(titleButtomSelected == title ? .black:.gray)
                                    }
                                     

                                    
                                }
                            }
                            .padding(.horizontal)
                            .onAppear {
                                titleButtomSelected = "Overview"
                            }
                        }
                        
                        Text(place.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(8)
                            .padding(.horizontal)
                        
                        
                        HStack(spacing: 32) {
                            HStack {
                                Image(systemName: "snowflake")
                                    .foregroundColor(.blue)
                                
                                
                                Text(String(place.snowLevel) + " cm")
                                    .font(.caption)
                                    .foregroundColor(.black)
                                    .bold()
                                
                            }
                            
                            HStack {
                                Image(systemName: "circle")
                                    .foregroundColor(.blue)
                                
                                Text(String(place.snowLevel) + " km")
                                    .font(.caption)
                                    .foregroundColor(.black)
                                    .bold()
                                + Text(" of open pistes")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .bold()
                                
                            }
                            
                            

                        }
                        .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                let imagesName = ["one", "two", "three", "four", "five"]
                                
                                ForEach(imagesName, id: \.self) { name in
                                 Image(name)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
                                        .cornerRadius(16)
                                }
                                .shadow(color: .gray.opacity(0.3), radius: 10, x: 1, y: 10)
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 32    )
                            .onAppear {
                                titleButtomSelected = "Overview"
                            }
                        }
                    }
                    .background(Color.white)
                    .cornerRadius(16)
                    .offset(y: -32)
                }
                
            }
            
            
            //NavigationBar
            LinearGradient(colors: [.black.opacity(0.5), .clear], startPoint: .top, endPoint: .bottom)
                .frame(height: 100)
            
            
            HStack {
                Button {
                    back.callAsFunction()
                } label: {
                    Image(systemName: "arrow.backward")
                }
                
                Spacer()
                
                Button {
                    addFavorite.toggle()
                } label: {
                    Image(systemName: addFavorite ? "heart.fill":"heart")
                        .foregroundColor(addFavorite ? .red:.white)
                }

            }
            .padding()
            .padding(.top, 24)
            .imageScale(.large)
            .foregroundColor(.white)
        }
        .ignoresSafeArea(.all, edges: .top)
        
        
    }
}

