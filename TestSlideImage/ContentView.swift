//
//  ContentView.swift
//  TestSlideImage
//
//  Created by Thanh Sau on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    var imageURL = [URL](repeating: URL(string: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, count: 1000)
    
    var configLayout = [
        GridItem(.flexible())
    ]
    
    @State var startLocation: CGPoint = CGPoint()
    
    @State var selectedImage: Int = 0
    
    @State var showSelectImage: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            VStack {
                Button("Select") {
                    showSelectImage.toggle()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray)
            .fullScreenCover(isPresented: $showSelectImage) {
                ZLPhotoPicker { assets in
                    print("picker assest success: \(assets.count)")
                    showSelectImage = false
                } onCancel: {
                    print("cancel")
                    showSelectImage = false
                }

            }
            
//            VStack {
//                ScrollViewReader { scrollView in
//                    ScrollView(.horizontal) {
//                        LazyHGrid(rows: configLayout) {
//                            ForEach(imageURL.indices, id: \.self) { index in
//                                ZStack {
////                                    AsyncImage(url: imageURL[index])
//                                    Image("test")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: size.width, height: size.height)
//                                        .clipped()
//
//                                    Text("\(index)")
//                                }
//                                .id(index)
//                                .gesture(
//                                    DragGesture()
//                                        .onChanged({ value in
//                                            startLocation = value.startLocation
//                                        })
//                                        .onEnded({ value in
//                                            if value.location.x > startLocation.x {
//                                                selectedImage -= 1
//                                            } else {
//                                                selectedImage += 1
//                                            }
//                                        })
//                                )
//                            }
//                        }
//                        .onChange(of: selectedImage) { _ in
//                            withAnimation (.easeInOut(duration: 0.3)) {
//                                scrollView.scrollTo(selectedImage)
//                            }
//                        }
//                    }
//
//                }
////                .environment(\.isScrollEnabled, false)
//                .scrollingDisabled(true)
//            }
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
