//
//  ColorPicker.swift
//  ToDo
//
//  Created by Begum Unal on 6.11.2022.
//

import SwiftUI

struct ColorPicker: View {
    let colors = [Color.red, Color.orange, Color.green, Color.blue, Color.purple]
    @Binding var selectedColor: Color
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                
                Image(systemName: selectedColor == color ? ConstantsModel.Icons.recordCircleFill : ConstantsModel.Icons.circleFill)
                    .foregroundColor(color)
                    .font(.system(size: 16))
                    .clipShape(Circle())
                    .onTapGesture {
                        selectedColor = color
                    }
            }
        }.background(Color.canvasColor)
    }
}

struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker(selectedColor: .constant(.blue))
    }
}
