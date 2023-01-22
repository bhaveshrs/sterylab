class SettingModel {
  int? id;
  String? envatoBuyerName;
  String? envatoPurchaseCode;
  String? envatoBuyerEmail;
  int? envatoPurchasedStatus;
  String? packageName;
  String? emailFrom;
  int? redeemPoints;
  int? redeemMoney;
  String? redeemCurrency;
  int? minimumRedeemPoints;
  String? onesignalAppId;
  String? onesignalRestKey;
  String? appName;
  String? appLogo;
  String? appEmail;
  String? appVersion;
  String? appAuthor;
  String? appContact;
  String? appWebsite;
  String? appDescription;
  String? appDevelopedBy;
  String? appPrivacyPolicy;
  int? apiPageLimit;
  String? apiAllOrderBy;
  int? apiLatestLimit;
  String? apiCatOrderBy;
  String? apiCatPostOrderBy;
  String? publisherId;
  String? interstitalAd;
  int? registrationReward;
  int? appReferReward;
  int? videoViews;
  int? videoAdd;
  int? likeVideoPoints;
  int? downloadVideoPoints;
  String? registrationRewardStatus;
  String? appReferRewardStatus;
  String? videoViewsStatus;
  String? videoAddStatus;
  String? likeVideoPointsStatus;
  String? downloadVideoPointsStatus;
  String? otherUserVideoStatus;
  String? otherUserVideoPoint;
  String? interstitalAdId;
  String? interstitalAdClick;
  String? bannerAd;
  String? bannerAdId;
  String? rewardedVideoAds;
  String? rewardedVideoAdsId;
  int? rewardedVideoClick;
  String? appFaq;
  String? paymentMethod1;
  String? paymentMethod2;
  String? paymentMethod3;
  String? paymentMethod4;
  String? watermarkOnOff;
  String? watermarkImage;
  String? spinnerOpt;
  int? spinnerLimit;
  String? autoApprove;
  String? aboutTitle;
  String? aboutText;
  String? aboutVideo;
  String? videoType;
  String? videoUrl;
  String? name;
  String? address;
  String? latitude;
  String? longitude;
  String? email;
  String? phone;
  String? fax;
  String? site;
  String? appFaqEn;
  String? appPrivacyPolicyEn;
  String? videoUrlEn;
  String? videoTypeEn;
  String? aboutTextEn;
  String? aboutTitleEn;
  String? termsEn;
  String? termsIt;

  SettingModel(
      {this.id,
      this.envatoBuyerName,
      this.envatoPurchaseCode,
      this.envatoBuyerEmail,
      this.envatoPurchasedStatus,
      this.packageName,
      this.emailFrom,
      this.redeemPoints,
      this.redeemMoney,
      this.redeemCurrency,
      this.minimumRedeemPoints,
      this.onesignalAppId,
      this.onesignalRestKey,
      this.appName,
      this.appLogo,
      this.appEmail,
      this.appVersion,
      this.appAuthor,
      this.appContact,
      this.appWebsite,
      this.appDescription,
      this.appDevelopedBy,
      this.appPrivacyPolicy,
      this.apiPageLimit,
      this.apiAllOrderBy,
      this.apiLatestLimit,
      this.apiCatOrderBy,
      this.apiCatPostOrderBy,
      this.publisherId,
      this.interstitalAd,
      this.registrationReward,
      this.appReferReward,
      this.videoViews,
      this.videoAdd,
      this.likeVideoPoints,
      this.downloadVideoPoints,
      this.registrationRewardStatus,
      this.appReferRewardStatus,
      this.videoViewsStatus,
      this.videoAddStatus,
      this.likeVideoPointsStatus,
      this.downloadVideoPointsStatus,
      this.otherUserVideoStatus,
      this.otherUserVideoPoint,
      this.interstitalAdId,
      this.interstitalAdClick,
      this.bannerAd,
      this.bannerAdId,
      this.rewardedVideoAds,
      this.rewardedVideoAdsId,
      this.rewardedVideoClick,
      this.appFaq,
      this.paymentMethod1,
      this.paymentMethod2,
      this.paymentMethod3,
      this.paymentMethod4,
      this.watermarkOnOff,
      this.watermarkImage,
      this.spinnerOpt,
      this.spinnerLimit,
      this.autoApprove,
      this.aboutTitle,
      this.aboutText,
      this.aboutVideo,
      this.videoType,
      this.videoUrl,
      this.name,
      this.address,
      this.latitude,
      this.longitude,
      this.email,
      this.phone,
      this.fax,
      this.site,
      this.appFaqEn,
      this.appPrivacyPolicyEn,
      this.videoUrlEn,
      this.videoTypeEn,
      this.aboutTextEn,
      this.aboutTitleEn,
      this.termsEn,
      this.termsIt});

  SettingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    envatoBuyerName = json['envato_buyer_name'];
    envatoPurchaseCode = json['envato_purchase_code'];
    envatoBuyerEmail = json['envato_buyer_email'];
    envatoPurchasedStatus = json['envato_purchased_status'];
    packageName = json['package_name'];
    emailFrom = json['email_from'];
    redeemPoints = json['redeem_points'];
    redeemMoney = json['redeem_money'];
    redeemCurrency = json['redeem_currency'];
    minimumRedeemPoints = json['minimum_redeem_points'];
    onesignalAppId = json['onesignal_app_id'];
    onesignalRestKey = json['onesignal_rest_key'];
    appName = json['app_name'];
    appLogo = json['app_logo'];
    appEmail = json['app_email'];
    appVersion = json['app_version'];
    appAuthor = json['app_author'];
    appContact = json['app_contact'];
    appWebsite = json['app_website'];
    appDescription = json['app_description'];
    appDevelopedBy = json['app_developed_by'];
    appPrivacyPolicy = json['app_privacy_policy'];
    apiPageLimit = json['api_page_limit'];
    apiAllOrderBy = json['api_all_order_by'];
    apiLatestLimit = json['api_latest_limit'];
    apiCatOrderBy = json['api_cat_order_by'];
    apiCatPostOrderBy = json['api_cat_post_order_by'];
    publisherId = json['publisher_id'];
    interstitalAd = json['interstital_ad'];
    registrationReward = json['registration_reward'];
    appReferReward = json['app_refer_reward'];
    videoViews = json['video_views'];
    videoAdd = json['video_add'];
    likeVideoPoints = json['like_video_points'];
    downloadVideoPoints = json['download_video_points'];
    registrationRewardStatus = json['registration_reward_status'];
    appReferRewardStatus = json['app_refer_reward_status'];
    videoViewsStatus = json['video_views_status'];
    videoAddStatus = json['video_add_status'];
    likeVideoPointsStatus = json['like_video_points_status'];
    downloadVideoPointsStatus = json['download_video_points_status'];
    otherUserVideoStatus = json['other_user_video_status'];
    otherUserVideoPoint = json['other_user_video_point'];
    interstitalAdId = json['interstital_ad_id'];
    interstitalAdClick = json['interstital_ad_click'];
    bannerAd = json['banner_ad'];
    bannerAdId = json['banner_ad_id'];
    rewardedVideoAds = json['rewarded_video_ads'];
    rewardedVideoAdsId = json['rewarded_video_ads_id'];
    rewardedVideoClick = json['rewarded_video_click'];
    appFaq = json['app_faq'];
    paymentMethod1 = json['payment_method1'];
    paymentMethod2 = json['payment_method2'];
    paymentMethod3 = json['payment_method3'];
    paymentMethod4 = json['payment_method4'];
    watermarkOnOff = json['watermark_on_off'];
    watermarkImage = json['watermark_image'];
    spinnerOpt = json['spinner_opt'];
    spinnerLimit = json['spinner_limit'];
    autoApprove = json['auto_approve'];
    aboutTitle = json['about_title'];
    aboutText = json['about_text'];
    aboutVideo = json['about_video'];
    videoType = json['video_type'];
    videoUrl = json['video_url'];
    name = json['name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    email = json['email'];
    phone = json['phone'];
    fax = json['fax'];
    site = json['site'];
    appFaqEn = json['app_faq_en'];
    appPrivacyPolicyEn = json['app_privacy_policy_en'];
    videoUrlEn = json['video_url_en'];
    videoTypeEn = json['video_type_en'];
    aboutTextEn = json['about_text_en'];
    aboutTitleEn = json['about_title_en'];
    termsEn = json['terms_en'];
    termsIt = json['terms_it'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['envato_buyer_name'] = envatoBuyerName;
    data['envato_purchase_code'] = envatoPurchaseCode;
    data['envato_buyer_email'] = envatoBuyerEmail;
    data['envato_purchased_status'] = envatoPurchasedStatus;
    data['package_name'] = packageName;
    data['email_from'] = emailFrom;
    data['redeem_points'] = redeemPoints;
    data['redeem_money'] = redeemMoney;
    data['redeem_currency'] = redeemCurrency;
    data['minimum_redeem_points'] = minimumRedeemPoints;
    data['onesignal_app_id'] = onesignalAppId;
    data['onesignal_rest_key'] = onesignalRestKey;
    data['app_name'] = appName;
    data['app_logo'] = appLogo;
    data['app_email'] = appEmail;
    data['app_version'] = appVersion;
    data['app_author'] = appAuthor;
    data['app_contact'] = appContact;
    data['app_website'] = appWebsite;
    data['app_description'] = appDescription;
    data['app_developed_by'] = appDevelopedBy;
    data['app_privacy_policy'] = appPrivacyPolicy;
    data['api_page_limit'] = apiPageLimit;
    data['api_all_order_by'] = apiAllOrderBy;
    data['api_latest_limit'] = apiLatestLimit;
    data['api_cat_order_by'] = apiCatOrderBy;
    data['api_cat_post_order_by'] = apiCatPostOrderBy;
    data['publisher_id'] = publisherId;
    data['interstital_ad'] = interstitalAd;
    data['registration_reward'] = registrationReward;
    data['app_refer_reward'] = appReferReward;
    data['video_views'] = videoViews;
    data['video_add'] = videoAdd;
    data['like_video_points'] = likeVideoPoints;
    data['download_video_points'] = downloadVideoPoints;
    data['registration_reward_status'] = registrationRewardStatus;
    data['app_refer_reward_status'] = appReferRewardStatus;
    data['video_views_status'] = videoViewsStatus;
    data['video_add_status'] = videoAddStatus;
    data['like_video_points_status'] = likeVideoPointsStatus;
    data['download_video_points_status'] = downloadVideoPointsStatus;
    data['other_user_video_status'] = otherUserVideoStatus;
    data['other_user_video_point'] = otherUserVideoPoint;
    data['interstital_ad_id'] = interstitalAdId;
    data['interstital_ad_click'] = interstitalAdClick;
    data['banner_ad'] = bannerAd;
    data['banner_ad_id'] = bannerAdId;
    data['rewarded_video_ads'] = rewardedVideoAds;
    data['rewarded_video_ads_id'] = rewardedVideoAdsId;
    data['rewarded_video_click'] = rewardedVideoClick;
    data['app_faq'] = appFaq;
    data['payment_method1'] = paymentMethod1;
    data['payment_method2'] = paymentMethod2;
    data['payment_method3'] = paymentMethod3;
    data['payment_method4'] = paymentMethod4;
    data['watermark_on_off'] = watermarkOnOff;
    data['watermark_image'] = watermarkImage;
    data['spinner_opt'] = spinnerOpt;
    data['spinner_limit'] = spinnerLimit;
    data['auto_approve'] = autoApprove;
    data['about_title'] = aboutTitle;
    data['about_text'] = aboutText;
    data['about_video'] = aboutVideo;
    data['video_type'] = videoType;
    data['video_url'] = videoUrl;
    data['name'] = name;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['email'] = email;
    data['phone'] = phone;
    data['fax'] = fax;
    data['site'] = site;
    data['app_faq_en'] = appFaqEn;
    data['app_privacy_policy_en'] = appPrivacyPolicyEn;
    data['video_url_en'] = videoUrlEn;
    data['video_type_en'] = videoTypeEn;
    data['about_text_en'] = aboutTextEn;
    data['about_title_en'] = aboutTitleEn;
    data['terms_en'] = termsEn;
    data['terms_it'] = termsIt;
    return data;
  }
}
