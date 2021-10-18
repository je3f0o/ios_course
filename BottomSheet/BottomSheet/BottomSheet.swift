//
//  BottomSheet.swift
//  BottomSheet
//
//  Created by Batkhishig on 2021.10.16.
//

import SwiftUI

struct BottomSheet: View {
    @State        private var offset        : CGFloat = 0
    @State        private var last_offset   : CGFloat = 0
    @GestureState private var gesture_offset: CGFloat = 0
    
    let max_offset: CGFloat = 200
    let min_offset: CGFloat = 320
    
    var body: some View {
        GeometryReader { proxy -> AnyView in
            let height = proxy.frame(in: .global).height
            
            let drag_gesture = DragGesture(coordinateSpace: .global)
                .updating($gesture_offset, body: { value, out, _ in
                    print("height", height)
                    print("value.height", value.translation.height)
                    
                    out = value.translation.height
                    DispatchQueue.main.async {
                        var _offset = gesture_offset + last_offset

                        if (_offset < -height + max_offset) {
                            _offset = -height + max_offset
                        } else if (_offset > 0) {
                            _offset = 0
                        }

                        offset = _offset
                    }
                })
                .onEnded { value in
                    last_offset = offset
                }
            
            return AnyView(
                VStack(spacing: 0) {
                    Color.red
                        .frame(maxWidth: .infinity)
                        .frame(height: 80)
                        .gesture(drag_gesture)

                    VStack {
                        //#5977DC
                        //#9261E2
                        Button(action: {

                        }, label: {
                            Text("Байршил заагч асаах")
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal, 52)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.3490196078, green: 0.4666666667, blue: 0.862745098, alpha: 1)), Color(#colorLiteral(red: 0.5725490196, green: 0.3803921569, blue: 0.8862745098, alpha: 1))]), startPoint: .leading, endPoint: .trailing)
                                )
                        })
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
                }
                .offset(y: height - min_offset)
                .offset(y: offset)
            )
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            BottomSheet()
        }
    }
}
