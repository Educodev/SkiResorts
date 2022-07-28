//
//  CardView.swift
//  SkiResorts
//
//  Created by Eduardo Herrera on 11/7/22.
//

import SwiftUI

struct CardView: View {
    let place: Place
    @State var showDetailView = false
    
    var body: some View {
        Button {
            showDetailView.toggle()
        } label: {
            GeometryReader { proxy in
                let heightImgCover = proxy.frame(in: .global).height/1.50
                let width = proxy.frame(in: .global).width
                let heightInfo:CGFloat = proxy.frame(in: .global).height - heightImgCover
                
                VStack(alignment: .leading) {
                    Image(place.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: heightImgCover)
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(place.title)
                            .bold()
                            .font(.system(size: 12))
                            .frame(height: heightInfo/2, alignment: .top)
                            .multilineTextAlignment(.leading )
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        
                        HStack(spacing: 4) {
                            
                            RatingsView(percentage: place.ratings/(place.reviews*5)*100)
                                .frame(width: width/2)
                                
                            
                            Text(String(place.ratings))
                                .bold()
                                .font(.caption2)
                            
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                    }
                    
                    
                }
                
            }
            .background(.white)

        }
        .fullScreenCover(isPresented: $showDetailView) {
            DetailView(place: place)
        }

    }
}












