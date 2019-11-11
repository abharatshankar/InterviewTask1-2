

import Foundation
struct Json4Swift_Base : Codable {
	let name : String?
	let topLevelDomain : [String]?
	let alpha2Code : String?
	let alpha3Code : String?
	let callingCodes : [String]?
	let capital : String?
	let altSpellings : [String]?
	let region : String?
	let subregion : String?
	let population : Int?
	let latlng : [Double]?
	let demonym : String?
	let area : Double?
	let gini : Double?
	let timezones : [String]?
	let borders : [String]?
	let nativeName : String?
	let numericCode : String?
	let currencies : [Currencies]?
	let languages : [Languages]?
	let translations : Translations?
	let flag : String?
	let regionalBlocs : [RegionalBlocs]?
	let cioc : String?

	enum CodingKeys: String, CodingKey {

		case name = "name"
		case topLevelDomain = "topLevelDomain"
		case alpha2Code = "alpha2Code"
		case alpha3Code = "alpha3Code"
		case callingCodes = "callingCodes"
		case capital = "capital"
		case altSpellings = "altSpellings"
		case region = "region"
		case subregion = "subregion"
		case population = "population"
		case latlng = "latlng"
		case demonym = "demonym"
		case area = "area"
		case gini = "gini"
		case timezones = "timezones"
		case borders = "borders"
		case nativeName = "nativeName"
		case numericCode = "numericCode"
		case currencies = "currencies"
		case languages = "languages"
		case translations = "translations"
		case flag = "flag"
		case regionalBlocs = "regionalBlocs"
		case cioc = "cioc"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		topLevelDomain = try values.decodeIfPresent([String].self, forKey: .topLevelDomain)
		alpha2Code = try values.decodeIfPresent(String.self, forKey: .alpha2Code)
		alpha3Code = try values.decodeIfPresent(String.self, forKey: .alpha3Code)
		callingCodes = try values.decodeIfPresent([String].self, forKey: .callingCodes)
		capital = try values.decodeIfPresent(String.self, forKey: .capital)
		altSpellings = try values.decodeIfPresent([String].self, forKey: .altSpellings)
		region = try values.decodeIfPresent(String.self, forKey: .region)
		subregion = try values.decodeIfPresent(String.self, forKey: .subregion)
		population = try values.decodeIfPresent(Int.self, forKey: .population)
		latlng = try values.decodeIfPresent([Double].self, forKey: .latlng)
		demonym = try values.decodeIfPresent(String.self, forKey: .demonym)
		area = try values.decodeIfPresent(Double.self, forKey: .area)
		gini = try values.decodeIfPresent(Double.self, forKey: .gini)
		timezones = try values.decodeIfPresent([String].self, forKey: .timezones)
		borders = try values.decodeIfPresent([String].self, forKey: .borders)
		nativeName = try values.decodeIfPresent(String.self, forKey: .nativeName)
		numericCode = try values.decodeIfPresent(String.self, forKey: .numericCode)
		currencies = try values.decodeIfPresent([Currencies].self, forKey: .currencies)
		languages = try values.decodeIfPresent([Languages].self, forKey: .languages)
		translations = try values.decodeIfPresent(Translations.self, forKey: .translations)
		flag = try values.decodeIfPresent(String.self, forKey: .flag)
		regionalBlocs = try values.decodeIfPresent([RegionalBlocs].self, forKey: .regionalBlocs)
		cioc = try values.decodeIfPresent(String.self, forKey: .cioc)
	}

}

struct Currencies : Codable {
    let code : String?
    let name : String?
    let symbol : String?

    enum CodingKeys: String, CodingKey {

        case code = "code"
        case name = "name"
        case symbol = "symbol"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
    }

}

struct Languages : Codable {
    let iso639_1 : String?
    let iso639_2 : String?
    let name : String?
    let nativeName : String?

    enum CodingKeys: String, CodingKey {

        case iso639_1 = "iso639_1"
        case iso639_2 = "iso639_2"
        case name = "name"
        case nativeName = "nativeName"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        iso639_1 = try values.decodeIfPresent(String.self, forKey: .iso639_1)
        iso639_2 = try values.decodeIfPresent(String.self, forKey: .iso639_2)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        nativeName = try values.decodeIfPresent(String.self, forKey: .nativeName)
    }

}


struct RegionalBlocs : Codable {
    let acronym : String?
    let name : String?
    let otherAcronyms : [String]?
    let otherNames : [String]?

    enum CodingKeys: String, CodingKey {

        case acronym = "acronym"
        case name = "name"
        case otherAcronyms = "otherAcronyms"
        case otherNames = "otherNames"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        acronym = try values.decodeIfPresent(String.self, forKey: .acronym)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        otherAcronyms = try values.decodeIfPresent([String].self, forKey: .otherAcronyms)
        otherNames = try values.decodeIfPresent([String].self, forKey: .otherNames)
    }

}

struct Translations : Codable {
    let de : String?
    let es : String?
    let fr : String?
    let ja : String?
    let it : String?
    let br : String?
    let pt : String?
    let nl : String?
    let hr : String?
    let fa : String?

    enum CodingKeys: String, CodingKey {

        case de = "de"
        case es = "es"
        case fr = "fr"
        case ja = "ja"
        case it = "it"
        case br = "br"
        case pt = "pt"
        case nl = "nl"
        case hr = "hr"
        case fa = "fa"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        de = try values.decodeIfPresent(String.self, forKey: .de)
        es = try values.decodeIfPresent(String.self, forKey: .es)
        fr = try values.decodeIfPresent(String.self, forKey: .fr)
        ja = try values.decodeIfPresent(String.self, forKey: .ja)
        it = try values.decodeIfPresent(String.self, forKey: .it)
        br = try values.decodeIfPresent(String.self, forKey: .br)
        pt = try values.decodeIfPresent(String.self, forKey: .pt)
        nl = try values.decodeIfPresent(String.self, forKey: .nl)
        hr = try values.decodeIfPresent(String.self, forKey: .hr)
        fa = try values.decodeIfPresent(String.self, forKey: .fa)
    }

}
