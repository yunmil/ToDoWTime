//
//  TDTButtonView.swift
//  To Do with Time
//
//  Created by Yunmi Lee on 7/14/23.
//

import SwiftUI

struct TDTButtonView: View {
    
    let title: String
    let background: Color
    let foreground: Color
    let action: ()->Void //action that takes no argument & returning void
    
    var body: some View {
        Button {
            //Action
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                    .opacity(0.6)
                
                Text(title)
                    .foregroundColor(foreground)
                    .bold()
            }
        }
        .padding()
    }
}

struct TDTButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TDTButtonView(title: "Value", background: .pink, foreground: .white) {
            //Action
        }
    }
}
