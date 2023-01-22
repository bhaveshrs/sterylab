class SpecialityModel {
  int? cid;
  String? categoryName;
  String? categoryName2;
  String? categoryImage;
  int? status;
  String? blockBg;
  int? type;
  String? description;
  String? description2;
  List<Products>? products;
  List<Categories>? categories;

  SpecialityModel(
      {this.cid,
      this.categoryName,
      this.categoryName2,
      this.categoryImage,
      this.status,
      this.blockBg,
      this.type,
      this.description,
      this.description2,
      this.products,
      this.categories});

  SpecialityModel.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    categoryName = json['category_name'];
    categoryName2 = json['category_name2'];
    categoryImage = json['category_image'];
    status = json['status'];
    blockBg = json['block_bg'];
    type = json['type'];
    description = json['description'];
    description2 = json['description2'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['category_name'] = categoryName;
    data['category_name2'] = categoryName2;
    data['category_image'] = categoryImage;
    data['status'] = status;
    data['block_bg'] = blockBg;
    data['type'] = type;
    data['description'] = description;
    data['description2'] = description2;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? entityType;
  dynamic? entityCode;
  String? entityName;
  String? entityLabel;
  String? entityDescription;
  String? entityLabel2;
  String? entityDescription2;
  dynamic? entityPath;
  dynamic? entityPath2;
  String? entityImage;
  String? entityPdf;
  dynamic? entityVideo;
  int? published;
  int? showPdf;
  int? showVideo;
  String? videoUrl;
  String? videoType;
  String? updated;

  Products(
      {this.id,
      this.entityType,
      this.entityCode,
      this.entityName,
      this.entityLabel,
      this.entityDescription,
      this.entityLabel2,
      this.entityDescription2,
      this.entityPath,
      this.entityPath2,
      this.entityImage,
      this.entityPdf,
      this.entityVideo,
      this.published,
      this.showPdf,
      this.showVideo,
      this.videoUrl,
      this.videoType,
      this.updated});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entityType = json['entity_type'];
    entityCode = json['entity_code'];
    entityName = json['entity_name'];
    entityLabel = json['entity_label'];
    entityDescription = json['entity_description'];
    entityLabel2 = json['entity_label2'];
    entityDescription2 = json['entity_description2'];
    entityPath = json['entity_path'];
    entityPath2 = json['entity_path2'];
    entityImage = json['entity_image'];
    entityPdf = json['entity_pdf'];
    entityVideo = json['entity_video'];
    published = json['published'];
    showPdf = json['show_pdf'];
    showVideo = json['show_video'];
    videoUrl = json['video_url'];
    videoType = json['video_type'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['entity_type'] = entityType;
    data['entity_code'] = entityCode;
    data['entity_name'] = entityName;
    data['entity_label'] = entityLabel;
    data['entity_description'] = entityDescription;
    data['entity_label2'] = entityLabel2;
    data['entity_description2'] = entityDescription2;
    data['entity_path'] = entityPath;
    data['entity_path2'] = entityPath2;
    data['entity_image'] = entityImage;
    data['entity_pdf'] = entityPdf;
    data['entity_video'] = entityVideo;
    data['published'] = published;
    data['show_pdf'] = showPdf;
    data['show_video'] = showVideo;
    data['video_url'] = videoUrl;
    data['video_type'] = videoType;
    data['updated'] = updated;
    return data;
  }
}

class Categories {
  int? cid;
  String? categoryName;
  String? categoryName2;
  String? categoryImage;
  int? status;
  String? blockBg;
  int? type;
  String? description;
  String? description2;
  List<Products>? products;
  List<Categories>? categories;

  Categories(
      {this.cid,
      this.categoryName,
      this.categoryName2,
      this.categoryImage,
      this.status,
      this.blockBg,
      this.type,
      this.description,
      this.description2,
      this.products,
      this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    categoryName = json['category_name'];
    categoryName2 = json['category_name2'];
    categoryImage = json['category_image'];
    status = json['status'];
    blockBg = json['block_bg'];
    type = json['type'];
    description = json['description'];
    description2 = json['description2'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['category_name'] = categoryName;
    data['category_name2'] = categoryName2;
    data['category_image'] = categoryImage;
    data['status'] = status;
    data['block_bg'] = blockBg;
    data['type'] = type;
    data['description'] = description;
    data['description2'] = description2;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}