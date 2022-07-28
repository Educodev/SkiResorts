

import SwiftUI

struct RatingsView: View {
    
    let percentage: Double
    var mainColor: Color = .blue
    var secundaryColor: Color = .gray.opacity(0.5)
    var addBorders: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.frame(in: .global).width
            let height = proxy.frame(in: .global).height
            
            ZStack(alignment: .leading) {
                secundaryColor
                
                mainColor
                    .frame(width: (width)*percentage/100, height: height)
                
                if addBorders {
                    HStack(spacing: 1) {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            .foregroundColor(mainColor)
            .frame(width: width, height: height)
            .mask {
                HStack(spacing: 1) {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
    }
}


