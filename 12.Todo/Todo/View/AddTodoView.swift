//
//  AddTodoView.swift
//  Todo
//
//  Created by ZUP-5876 on 13/07/22.
//

import SwiftUI

struct AddTodoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) private var viewContext

    @State private var name: String = ""
    @State private var priority: String = "Normal"
    @State private var showErrorMessage = false
    
    let priorities = ["High", "Normal", "Low"]
    
    private func save() {
        if name != "" {
            let todo = Item(context: viewContext)
            
            todo.name = name
            todo.priority = priority
            
            do{
                try viewContext.save()
            }catch {
                print("Error save")
            }
        } else {
            showErrorMessage = true
            return
        }
        presentationMode.wrappedValue.dismiss()
    }
    
    private func showAlert(title: String, message: String) -> Alert {
        return Alert(title: Text(title), message: Text(message), dismissButton: .default(Text("Ok")))
    }

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    TextField("Todo",text: $name)
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(9)
                    .font(.system(size: 24, weight: .bold, design: .default))

                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Button {
                        save()
                    } label: {
                        Text("Save")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(9)
                        .foregroundColor(Color.white)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
                
                Spacer()
            }
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            }))
            .alert(isPresented: $showErrorMessage){
                showAlert(title: "Invalid Name", message: "Make sure to enter something for\nthe new todo item.")
            }
        }
    }
}

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
