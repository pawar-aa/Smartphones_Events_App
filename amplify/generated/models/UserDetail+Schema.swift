// swiftlint:disable all
import Amplify
import Foundation

extension UserDetail {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case username
    case password
    case usertype
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userDetail = UserDetail.keys
    
    model.authRules = [
      rule(allow: .public, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "UserDetails"
    model.syncPluralName = "UserDetails"
    
    model.attributes(
      .primaryKey(fields: [userDetail.id])
    )
    
    model.fields(
      .field(userDetail.id, is: .required, ofType: .string),
      .field(userDetail.username, is: .optional, ofType: .string),
      .field(userDetail.password, is: .optional, ofType: .string),
      .field(userDetail.usertype, is: .optional, ofType: .string),
      .field(userDetail.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(userDetail.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension UserDetail: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}