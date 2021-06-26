//
//  PersonalGoals.swift
//  Laser
//
//  Created by Gustavo Kumasawa on 26/06/21.
//

import SwiftUI

struct SectionItemData: Identifiable {
    let id = UUID()
    var name: String
    var done: Bool = false
}

struct SectionData: Identifiable {
    let id = UUID()
    let title: String
    var items: [SectionItemData]
}

struct PersonalGoals: View {
    var sectionsData: [SectionData]
    
    struct ProgressBar: View {
        @Binding var value: Float
        
        var body: some View {
            ZStack(alignment: .leading) {
                Rectangle().frame(width: 89, height: 2)
                    .opacity(0.3)
                    .foregroundColor(Color("black"))
                
                Rectangle().frame(width: 89*CGFloat(value), height: 2)
                    .foregroundColor(Color("purple"))
                    .animation(.linear)
            }
            .cornerRadius(45.0)
        }
    }
    
    struct Section: View {
        @State var data: SectionData = SectionData(title: "", items: [])
        @State var progress: Float = 0.0
        
        struct SectionItemElement: View {
            @Binding var data: SectionItemData
            var onChange: () -> Void
            
            var body: some View {
                HStack(alignment: .center) {
                    Circle()
                        .strokeBorder(data.done ?  Color.clear : Color.white, lineWidth: 0.5)
                        .background(Circle().fill(data.done ? Color.purple : Color.clear))
                        .frame(width: 6, height: 6)
                        .padding(.trailing, 5)
                    
                    Text(data.name)
                        .font(.system(size: 6.9))
                }
                .onTapGesture {
                    data.done = !data.done
                    onChange()
                }
            }
        }
        
        func progressChange() {
            var totalDone: Int = 0
            
            data.items.forEach { item in
                if item.done {
                    totalDone += 1
                }
            }
            
            progress = Float(totalDone) / Float(data.items.count)
        }
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(data.title)
                    .font(.system(size: 7.55, weight: .semibold))
                    .padding(.bottom, 4.68)
                
                ProgressBar(value: $progress)
                    .padding(.bottom, 9)
                
                ForEach(Array(data.items.enumerated()), id: \.0) { i, item in
                    SectionItemElement(data: $data.items[i], onChange: progressChange)
                        .padding(.bottom, 5)
                }
            }
            .onAppear {
                progressChange()
            }
        }
    }
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("Suas metas pessoais")
                    .font(.system(size: 9.6, weight: .bold))
                    .padding(.bottom, 10)
                
                ForEach(Array(sectionsData.enumerated()), id: \.0) { i, item in
                    Section(data: item)
                    
                    if i != sectionsData.count-1 {
                        Rectangle()
                            .frame(width: 146, height: 1)
                            .background(Color(.white).opacity(0.01))
                            .padding(.vertical, 20)
                    }
                }
            }
            .padding(10)
        }
        .frame(width: 174, alignment: .topLeading)
        .background(Color("gray"))
        .cornerRadius(4.69)
    }
}

//struct PersonalGoals_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalGoals()
//    }
//}
