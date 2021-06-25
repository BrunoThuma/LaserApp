import Foundation

struct WorkspaceElement: Codable, Identifiable {
    
    var position: CGPoint
    var content: String
    var date: Date
    var type: ElementType
    let id: UUID
    
    init(id: UUID = UUID(), date: Date, position: CGPoint, text: String = "Write in me!", type: ElementType) {
        self.position = position
        self.content = text
        self.date = date
        self.id = id
        self.type = type
    }
    
    // enum com string -> consegue converter a entrada para o nome dos cases
    enum ElementType: String, Codable {
        case postIt
        case note
        case video
        
    }
}
