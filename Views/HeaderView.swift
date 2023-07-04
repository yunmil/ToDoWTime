//
//  HeaderView.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 7/2/23.
//

import SwiftUI



struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                .opacity(0.6)
           
            VStack {
                Text(title)
                    .foregroundColor(Color.blue)
                    .bold()
                    .font(.system(size: 35))
                    //.opacity(0.9)
                Text(subtitle)
                    .foregroundColor(Color.blue)
                    .font(.system(size: 20))
                    .opacity(0.6)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .yellow)
    }
}
