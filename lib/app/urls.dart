class Urls {
  Urls._();

  /// =========================
  /// BASE URL
  /// =========================
  static const String baseUrl = "https://ecom-rs8e.onrender.com/api";

  /// =========================
  /// AUTH
  /// =========================
  static const String postAuthSignup = "$baseUrl/auth/signup";
  static const String postAuthLogin = "$baseUrl/auth/login";

  static const String getAuthProfile = "$baseUrl/auth/profile";
  static const String patchAuthProfileUpdate = "$baseUrl/auth/profile";

  static const String postAuthForgotPassword =
      "$baseUrl/auth/forgot-password";

  static const String postAuthVerifyOtp = "$baseUrl/auth/verify-otp";
  static const String postAuthResendOtp = "$baseUrl/auth/resend-otp";

  /// =========================
  /// BRANDS
  /// =========================
  static const String getBrands = "$baseUrl/brands";
  static const String postCreateBrands = "$baseUrl/brands";

  static String patchBrandsByID(String id) => "$baseUrl/brands/$id";
  static String deleteBrandsByID(String id) => "$baseUrl/brands/$id";

  /// =========================
  /// CATEGORIES
  /// =========================
  static const String getCategories = "$baseUrl/categories";
  static const String postCreateCategory = "$baseUrl/categories";

  static String getCategoryByID(String id) => "$baseUrl/categories/$id";
  static String patchCategoryByID(String id) => "$baseUrl/categories/$id";
  static String deleteCategoryByID(String id) => "$baseUrl/categories/$id";

  /// =========================
  /// PRODUCTS
  /// =========================
  static const String getProducts = "$baseUrl/products";
  static const String postCreateProduct = "$baseUrl/products";

  static String getProductByID(String id) => "$baseUrl/products/$id";
  static String patchProductByID(String id) => "$baseUrl/products/$id";
  static String deleteProductByID(String id) => "$baseUrl/products/$id";

  /// =========================
  /// REVIEWS
  /// =========================
  static String getReviewsByProduct(String productId) =>
      "$baseUrl/reviews?product=$productId";

  static const String postCreateReview = "$baseUrl/reviews";

  static String patchReviewByID(String id) => "$baseUrl/reviews/$id";
  static String deleteReviewByID(String id) => "$baseUrl/reviews/$id";

  /// =========================
  /// CART
  /// =========================
  static const String getCart = "$baseUrl/cart";
  static const String postAddToCart = "$baseUrl/cart";

  static String deleteCartItem(String id) => "$baseUrl/cart/$id";
  static String patchCartItem(String id) => "$baseUrl/cart/$id";

  /// =========================
  /// WISHLIST
  /// =========================
  static const String getWishlist = "$baseUrl/wishlist";
  static const String postAddToWishlist = "$baseUrl/wishlist";

  static String deleteWishlistItem(String id) =>
      "$baseUrl/wishlist/$id";

  /// =========================
  /// ORDERS
  /// =========================
  static const String getOrders = "$baseUrl/orders";
  static const String postCreateOrder = "$baseUrl/orders";

  static String getOrderByID(String id) => "$baseUrl/orders/$id";
  static String patchOrderByID(String id) => "$baseUrl/orders/$id";
  static String deleteOrderByID(String id) => "$baseUrl/orders/$id";

  /// =========================
  /// SLIDES (HOME BANNER)
  /// =========================
  static const String getSlides = "$baseUrl/slides";
  static const String postCreateSlide = "$baseUrl/slides";

  static String deleteSlideByID(String id) => "$baseUrl/slides/$id";
}