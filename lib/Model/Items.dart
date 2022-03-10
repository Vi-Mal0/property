import 'Attribute.dart';
import 'Category.dart';
import 'Transacts.dart';

class Items {
  String? title;
  String? image;
  String? link;
  double? minPrice;
  double? price;
  String? listingId;
  String? createdSince;
  String? updatedSince;
  Category? category;
  String? categorySlug;
  String? slug;
  List<Attributes>? attributes;
  String? thumbnail;
  bool? isSpam;
  bool? isPremium;
  bool? isVerified;
  String? expiryDate;
  dynamic offer;
  bool? isChatAllowed;
  bool? isOffensive;
  bool? isAuction;
  bool? outKashmir;
  int? viewers;
  String? status;
  String? locality;
  String? city;
  int? posted;
  Transacts? transact;
  bool? inWishlist;


  @override
  String toString() {
    return 'Items{title: $title, image: $image, link: $link, minPrice: $minPrice, price: $price, listingId: $listingId, createdSince: $createdSince, updatedSince: $updatedSince, category: $category, categorySlug: $categorySlug, slug: $slug, attributes: $attributes, thumbnail: $thumbnail, isSpam: $isSpam, isPremium: $isPremium, isVerified: $isVerified, expiryDate: $expiryDate, offer: $offer, isChatAllowed: $isChatAllowed, isOffensive: $isOffensive, isAuction: $isAuction, outKashmir: $outKashmir, viewers: $viewers, status: $status, locality: $locality, city: $city, posted: $posted, transact: $transact, inWishlist: $inWishlist}';
  }

  Items(
      {this.title,
        this.image,
        this.link,
        this.minPrice,
        this.price,
        this.listingId,
        this.createdSince,
        this.updatedSince,
        this.category,
        this.categorySlug,
        this.slug,
        this.attributes,
        this.thumbnail,
        this.isSpam,
        this.isPremium,
        this.isVerified,
        this.expiryDate,
        this.offer,
        this.isChatAllowed,
        this.isOffensive,
        this.isAuction,
        this.outKashmir,
        this.viewers,
        this.status,
        this.locality,
        this.city,
        this.posted,
        this.transact,
        this.inWishlist});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    link = json['link'];
    minPrice = json['min_price'];
    price = json['price'];
    listingId = json['listing_id'];
    createdSince = json['created_since'];
    updatedSince = json['updated_since'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    categorySlug = json['category_slug'];
    slug = json['slug'];
    if (json['attributes'] != null) {
      attributes = [];
      json['attributes'].forEach((v) {
        attributes?.add(Attributes.fromJson(v));
      });
    }
    thumbnail = json['thumbnail'];
    isSpam = json['is_spam'];
    isPremium = json['is_premium'];
    isVerified = json['is_verified'];
    expiryDate = json['expiry_date'];
    offer = json['offer'];
    isChatAllowed = json['is_chat_allowed'];
    isOffensive = json['is_offensive'];
    isAuction = json['is_auction'];
    outKashmir = json['out_kashmir'];
    viewers = json['viewers'];
    status = json['status'];
    locality = json['locality'];
    city = json['city'];
    posted = json['posted'];
    transact = json['transact'] != null
        ? Transacts.fromJson(json['transact'])
        : null;
    inWishlist = json['in_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['image'] = image;
    data['link'] = link;
    data['min_price'] = minPrice;
    data['price'] = price;
    data['listing_id'] = listingId;
    data['created_since'] = createdSince;
    data['updated_since'] = updatedSince;
    if (category != null) {
      data['category'] = category?.toJson();
    }
    data['category_slug'] = categorySlug;
    data['slug'] = slug;
    if (attributes != null) {
      data['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    data['thumbnail'] = thumbnail;
    data['is_spam'] = isSpam;
    data['is_premium'] = isPremium;
    data['is_verified'] = isVerified;
    data['expiry_date'] = expiryDate;
    data['offer'] = offer;
    data['is_chat_allowed'] = isChatAllowed;
    data['is_offensive'] = isOffensive;
    data['is_auction'] = isAuction;
    data['out_kashmir'] = outKashmir;
    data['viewers'] = viewers;
    data['status'] = status;
    data['locality'] = locality;
    data['city'] = city;
    data['posted'] = posted;
    if (transact != null) {
      data['transact'] = transact?.toJson();
    }
    data['in_wishlist'] = inWishlist;
    return data;
  }
}
