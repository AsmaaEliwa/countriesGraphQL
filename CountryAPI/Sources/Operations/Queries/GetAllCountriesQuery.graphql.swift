// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllCountriesQuery: GraphQLQuery {
  public static let operationName: String = "GetAllCountries"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllCountries { countries { __typename name emoji } }"#
    ))

  public init() {}

  public struct Data: CountryAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("countries", [Country?]?.self),
    ] }

    public var countries: [Country?]? { __data["countries"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: CountryAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { CountryAPI.Objects.Country }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String?.self),
        .field("emoji", String?.self),
      ] }

      public var name: String? { __data["name"] }
      public var emoji: String? { __data["emoji"] }
    }
  }
}
