//
//  ContentView.swift
//  Todo
//
//  Created by ZUP-5876 on 13/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false

    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.id, ascending: false)],
        animation: .default)
    private var items: FetchedResults<Item>

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(items, id: \.self) { item in
                        HStack{
                            Text(item.name!)
                            
                            Spacer()
                            
                            Text(item.priority!)
                        }
    //                    NavigationLink {
    //                        Text("Item at \(item.name!)")
    //                    } label: {
    //                        Text(item.name!)
    //                    }
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationBarTitle("Todo", displayMode: .inline)
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                        Button(action: {
                    showingAddTodoView.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
            )
                
                if items.count == 0 {
                    EmptyListView()
                }
            }
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView()
                    .environment(\.managedObjectContext, viewContext)
            })
            .overlay(
                ZStack{
                    Group {
                      Circle()
                            .fill(Color.blue)
                        .opacity(self.animatingButton ? 0.2 : 0)
                        //.scaleEffect(self.animatingButton ? 1 : 0)
                        .frame(width: 68, height: 68, alignment: .center)
                      Circle()
                        .fill(Color.blue)
                        .opacity(self.animatingButton ? 0.15 : 0)
                        //.scaleEffect(self.animatingButton ? 1 : 0)
                        .frame(width: 88, height: 88, alignment: .center)
                    }
                    //.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
                    
                    Button(action: {
                      self.showingAddTodoView.toggle()
                    }) {
                      Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .background(Circle().fill(Color("ColorBase")))
                        .frame(width: 48, height: 48, alignment: .center)
                    } //: BUTTON
                      .accentColor(Color.blue)
                      .onAppear(perform: {
                         self.animatingButton.toggle()
                      })
                }
                .padding(.bottom, 15)
                .padding(.trailing, 15)
                , alignment: .bottomTrailing

            )
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
