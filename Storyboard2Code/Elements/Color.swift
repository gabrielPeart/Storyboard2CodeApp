import Foundation

public enum Color: AttributeCreatable {
  case redGreenBlueRepresentation(key:String, red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
  case whiteAlphaRepresentation(key: String, white: CGFloat, alpha: CGFloat)
  case stringRepresentation(key: String, string: String)
  case notSupported
  
  public var key: String {
    switch self {
    case .redGreenBlueRepresentation(let key, _, _, _, _): return key
    case .whiteAlphaRepresentation(let key, _, _): return key
    case .stringRepresentation(let key, _): return key
    default: return "Not Supported"
    }
  }
  
  public init(dict: [String : String]) {
    if let redString = dict["red"],
      let greenString = dict["green"],
      let blueString = dict["blue"],
      let alphaString = dict["alpha"],
      let red = Float(redString),
      let green = Float(greenString),
      let blue = Float(blueString),
      let alpha = Float(alphaString) {
      
      self = .redGreenBlueRepresentation(key: dict["key"]!, red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
      
    } else if let whiteString = dict["white"],
      let alphaString = dict["alpha"],
      let white = Float(whiteString),
      let alpha = Float(alphaString) {
      
      self = .whiteAlphaRepresentation(key: dict["key"]!, white: CGFloat(white), alpha: CGFloat(alpha))
      
    } else if let string = dict["cocoaTouchSystemColor"] {
      self = .stringRepresentation(key: dict["key"]!, string: string)
    } else {
      self = .notSupported
    }
  }
}

extension Color: AttributeCodeGeneratable {
  public var codeString: String {
    switch self {
    case .redGreenBlueRepresentation(_, let red, let green, let blue, let alpha):
      return String(format: "UIColor(colorLiteralRed: %.3lf, green: %.3lf, blue: %.3lf, alpha: %.3lf)", red, green, blue, alpha)
    case .whiteAlphaRepresentation(_, let white, let alpha):
      return String(format: "UIColor(white: %.3lf, alpha: %.3lf)", white, alpha)
    case .stringRepresentation(_, let string):
      return "UIColor.\(string)()"
    default:
      return "Not implemented yet"
    }
  }
}
