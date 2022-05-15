/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Photo : Codable {
	let id : String?
	let createdAt : String?
	let updatedAt : String?
	let promotedAt : String?
	let width : Int?
	let height : Int?
	let color : String?
	let blurHash : String?
	let description : String?
	let altDescription : String?
	let urls : Urls?
	let categories : [String]?
	let likes : Int?
	let likedByUser : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case promotedAt = "promoted_at"
		case width = "width"
		case height = "height"
		case color = "color"
		case blurHash = "blur_hash"
		case description = "description"
		case altDescription = "alt_description"
		case urls = "urls"
		case categories = "categories"
		case likes = "likes"
		case likedByUser = "liked_by_user"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		promotedAt = try values.decodeIfPresent(String.self, forKey: .promotedAt)
		width = try values.decodeIfPresent(Int.self, forKey: .width)
		height = try values.decodeIfPresent(Int.self, forKey: .height)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		blurHash = try values.decodeIfPresent(String.self, forKey: .blurHash)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		altDescription = try values.decodeIfPresent(String.self, forKey: .altDescription)
		urls = try values.decodeIfPresent(Urls.self, forKey: .urls)
		categories = try values.decodeIfPresent([String].self, forKey: .categories)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
		likedByUser = try values.decodeIfPresent(Bool.self, forKey: .likedByUser)

	}

}
