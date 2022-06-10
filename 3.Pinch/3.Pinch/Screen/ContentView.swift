//
//  ContentView.swift
//  3.Pinch
//
//  Created by ZUP-5876 on 09/06/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: Porperty

    @State private var isAnimating = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false

    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 1

    // MARK: Function

    func resetImageoffset() {
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    func currentPage() -> String {
      return pages[pageIndex - 1].imageName
    }
    
    // MARK: View

    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .opacity(isAnimating ? 1 : 0)
                    .scaleEffect(imageScale)
                // MARK: 1.Tap gesture
                    .onTapGesture(count: 2) {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            withAnimation(.spring()) {
                                resetImageoffset()
                            }
                        }
                    }
                // MARK: 2.Drag gesture
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageoffset()
                                }
                            }
                    )
                // MARK: - 3. MAGNIFICATION
                    .gesture(
                        MagnificationGesture()
                            .onChanged({ value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    }else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            })
                            .onEnded({ _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                }else if imageScale <= 1 {
                                    resetImageoffset()
                                }
                            })
                    )
            } // : ZStack
            .navigationTitle("Pinch e Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            // MARK: info Panel
            .overlay(
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                ,alignment: .top
            )
            // MARK: - CONTROLS
            .overlay(
                Group {
                    HStack {
                        // SCALE DOWN
                        Button {
                            if imageScale > 1 {
                                imageScale -= 1
                                
                                if imageScale <= 1{
                                    resetImageoffset()
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        // Reset
                        Button {
                            resetImageoffset()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        // SCALE UP
                        Button {
                            if imageScale < 5 {
                                imageScale += 1
                                
                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    }// : CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(30)
                , alignment: .bottom
            )
            // MARK: - DRAWER
                  .overlay(
                    HStack(spacing: 12) {
                      // MARK: - DRAWER HANDLE
                      Image(systemName: isDrawerOpen ? "chevron.compact.right" :  "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                          withAnimation(.easeOut) {
                            isDrawerOpen.toggle()
                          }
                        })
                      
                      // MARK: - THUMBNAILS
                      ForEach(pages) { item in
                        Image(item.thumbnailName)
                          .resizable()
                          .scaledToFit()
                          .frame(width: 80)
                          .cornerRadius(8)
                          .shadow(radius: 4)
                          .opacity(isDrawerOpen ? 1 : 0)
                          .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                          .onTapGesture(perform: {
                            isAnimating = true
                            pageIndex = item.id
                          })
                      }
                      
                      Spacer()
                    } //: DRAWER
                      .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                      .background(.ultraThinMaterial)
                      .cornerRadius(12)
                      .opacity(isAnimating ? 1 : 0)
                      .frame(width: 260)
                      .padding(.top, UIScreen.main.bounds.height / 12)
                      .offset(x: isDrawerOpen ? 20 : 215)
                    , alignment: .topTrailing
                  )
        } // : NavigationView
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            
    }
}
