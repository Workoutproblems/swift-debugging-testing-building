import UIKit
import PlaygroundSupport

// Since dealing with HTTP is asynchronous, the Playground needs "indifinite execution"
// in order to get the response back and use it
PlaygroundPage.current.needsIndefiniteExecution = true

//   {json} Encoded -> Decodable -> Swift {}
struct InnovationIdea: Decodable {
    let title: String
    let description: String
    let isDraft: Bool
    let submittedBy: String
}

let url = URL(string: "https://andrewcbancroft.github.io/pluralsight/iosdpbp/InnovationIdeas.json")

let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    
    // json form is unformatted
    let json = String(data: data! ,encoding: .utf8)
    
    // init a JSON decoder, PropertyListDecoder, custom, ect..
    let decoder = JSONDecoder()
    
    // standard for any issues
    do {
        // using decoder.docode method: Decodable type IN THE STRUCTURE, array of objs [] and data required.
        let innovationIdeas = try decoder.decode([InnovationIdea].self, from: data!)
    } catch {
        print(error)
    }
}

task.resume()
