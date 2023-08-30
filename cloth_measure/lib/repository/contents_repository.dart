import 'dart:convert';

import 'local_storage_repository.dart';

class ContentsRepository extends LocalStorageRepository {
  final String MY_FAVORITE_KEY = "MY_FAVORITE_KEY";
  Map<String, dynamic> data = {
    "ara": [
      {
        "cid": "1",
        "image": "assets/images/A1.PNG",
        "title": "착용x 세탁1회 나이키 티셔츠",
        "location": "안양 만안구 안양동",
        "price": "30000",
        "likes": "2"
      },
      {
        "cid": "2",
        "image": "assets/images/A2.PNG",
        "title": "새상품 아디다스 티셔츠 팝니다",
        "location": "안양 만안구 성결대학교",
        "price": "10000",
        "likes": "5"
      },
      {
        "cid": "3",
        "image": "assets/images/A3.PNG",
        "title": "새상품 나이키 티셔츠 팝니다",
        "location": "안양 만앙구 안양동",
        "price": "5000",
        "likes": "0"
      },
      {
        "cid": "4",
        "image": "assets/images/A4.PNG",
        "title": "반팔 티셔츠 팝니다",
        "location": "안양 만앙구 안양동",
        "price": "5000",
        "likes": "6"
      },
      {
        "cid": "5",
        "image": "assets/images/A5.PNG",
        "title": "[착용1회]제로 청바지 판매",
        "location": "안양 만앙구 안양동동",
        "price": "40000",
        "likes": "2"
      },
      {
        "cid": "6",
        "image": "assets/images/A6.PNG",
        "title": "무탠다드 L사이즈 티셔츠",
        "location": "안양 만앙구 안양동",
        "price": "180000",
        "likes": "2"
      },
      {
        "cid": "7",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "안양 만앙구 안양동",
        "price": "15000",
        "likes": "2"
      },
      {
        "cid": "8",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "안양 만앙구 안양동",
        "price": "80000",
        "likes": "3"
      },
      {
        "cid": "9",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "안양 만앙구 안양동",
        "price": "30000",
        "likes": "3"
      },
      {
        "cid": "10",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "안양 만앙구 안양동",
        "price": "50000",
        "likes": "7"
      },
    ],
    "ora": [
      {
        "cid": "11",
        "image": "assets/images/ora-1.jpg",
        "title": "LG 통돌이세탁기 15kg(내부",
        "location": "안양 만앙구 안양동",
        "price": "150000",
        "likes": "13"
      },
      {
        "cid": "12",
        "image": "assets/images/ora-2.jpg",
        "title": "3단책장 전면책장 가져가실분",
        "location": "안양 만앙구 안양동",
        "price": "무료나눔",
        "likes": "6"
      },
      {
        "cid": "13",
        "image": "assets/images/ora-3.jpg",
        "title": "반팔 티셔츠 무료나눔",
        "location": "안양 만앙구 안양동",
        "price": "1000",
        "likes": "4"
      },
      {
        "cid": "14",
        "image": "assets/images/ora-4.jpg",
        "title": "착용X 세탁1회 옷 팝니다",
        "location": "안양 만앙구 안양동",
        "price": "10000",
        "likes": "1"
      },
      {
        "cid": "15",
        "image": "assets/images/ora-5.jpg",
        "title": "새 옷 팝니다",
        "location": "안양 만앙구 안양동",
        "price": "무료나눔",
        "likes": "1"
      },
      {
        "cid": "16",
        "image": "assets/images/ora-6.jpg",
        "title": "어린이책 무료드림",
        "location": "안양 만앙구 안양동",
        "price": "무료나눔",
        "likes": "0"
      },
      {
        "cid": "17",
        "image": "assets/images/ora-7.jpg",
        "title": "칼세트 재제품 팝니다",
        "location": "제주 제주시 오라동",
        "price": "20000",
        "likes": "5"
      },
      {
        "cid": "18",
        "image": "assets/images/ora-8.jpg",
        "title": "아이팜장난감정리함팔아요",
        "location": "제주 제주시 오라동",
        "price": "30000",
        "likes": "29"
      },
      {
        "cid": "19",
        "image": "assets/images/ora-9.jpg",
        "title": "한색책상책장수납장세트 팝니다.",
        "location": "제주 제주시 오라동",
        "price": "1500000",
        "likes": "1"
      },
      {
        "cid": "20",
        "image": "assets/images/ora-10.jpg",
        "title": "순성 데일리 오가닉 카시트",
        "location": "제주 제주시 오라동",
        "price": "60000",
        "likes": "8"
      },
    ]
  };

  Future<List<Map<String, String>>> loadContentsFromLocation(
      String location) async {
    await Future.delayed(Duration(milliseconds: 2000));
    // throw Exception();
    return data[location];
  }

  Future<bool> isMyFavoriteContents(String contentId) async {
    bool isMyFavoriteContents = false;
    List? json = await loadFavoriteContents();
    if (json == null) {
      return false;
    } else {
      for (dynamic data in json) {
        if (data["cid"] == contentId) {
          isMyFavoriteContents = true;
          break;
        }
      }
    }
    return isMyFavoriteContents;
  }

  Future<List?> loadFavoriteContents() async {
    String? jsonString = await this.getStoredValue(MY_FAVORITE_KEY);
    if (jsonString != null) {
      Map<String, dynamic> json = jsonDecode(jsonString);
      return json["favorites"];
    } else {
      return null;
    }
  }

  Future<void> addMyFavoriteContent(Map<String, String> content) async {
    List? loadLocalStorageDatas = await loadFavoriteContents();
    if (loadLocalStorageDatas == null) {
      loadLocalStorageDatas = [content];
    } else {
      loadLocalStorageDatas.add(content);
    }
    updateFavoriteContent(loadLocalStorageDatas);
  }

  void updateFavoriteContent(List loadLocalStorageDatas) async {
    Map<String, dynamic> myFavoriteDatas = {"favorites": loadLocalStorageDatas};
    await this.storeValue(MY_FAVORITE_KEY, jsonEncode(myFavoriteDatas));
  }

  Future<void> deleteMyFavoriteContent(String id) async {
    List? loadLocalStorageDatas = await loadFavoriteContents();
    if (loadLocalStorageDatas != null) {
      loadLocalStorageDatas.removeWhere((element) => element["cid"] == id);
    }
    updateFavoriteContent(loadLocalStorageDatas ?? []);
  }
}
