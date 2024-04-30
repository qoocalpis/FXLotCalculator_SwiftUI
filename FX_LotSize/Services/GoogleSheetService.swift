import Foundation

@MainActor
class GoogleSheetService: ObservableObject{
    /// private constructor
    private init() {}
    
    /// the one and only instance of this singleton
    static let instance = GoogleSheetService()
    
    @Published var list = [GoogleSheetAPIModel]()
    @Published var date = AppConstants.strEmpty
    @Published var now: Date?
    
    func callGoogleSheetAPI() async -> Bool {
        print("callGoogleSheetAPI")
        
        now = Date()
        let outputFormat = DateFormatter()
        outputFormat.dateFormat = "yyyy/MM/dd H:m"
        date = outputFormat.string(from: now!)
        
        let apiKey = "AIzaSyA0w_ZecwgQJ9XHcrfsxLpW92i_FacfzRU"
        let spreadsheetId = "1URRKa2jW3WMx34GgtDUU21kCYMKvdlG5fKmWwPUSnTE"
        let range = "finance"
        let url = "https://sheets.googleapis.com/v4/spreadsheets/\(spreadsheetId)/values/\(range)?key=\(apiKey)"
        
        list.removeAll()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
            let decodedData = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            let values = decodedData["values"] as! [[String]]
            
            for value in values {
                let currencyPair = value[0]
                let price = value[1]
                let currencyCode = value[2]
                
                var formattedPrice = ""
                if let parsedPrice = Double(price) {
                    if currencyPair == "XAU/USD" {
                        formattedPrice = String(format: "%.2f", parsedPrice)
                    } else {
                        switch currencyPair.suffix(3) {
                        case "JPY":
                            formattedPrice = String(format: "%.3f", parsedPrice)
                        default:
                            formattedPrice = String(format: "%.5f", parsedPrice)
                        }
                    }
                }
                let model = GoogleSheetAPIModel(currencyPair: currencyPair, rate: formattedPrice, currencyCode: currencyCode)
                list.append(model)
            }
            return true
        } catch {
            print("Error: \(error)")
            return false
        }
    }
}
