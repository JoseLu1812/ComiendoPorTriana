import 'package:comiendoportriana/models/models.dart';

class BarList {
  List<BarContent>? _content;
  Pageable? _pageable;
  bool? _last;
  int? _totalPages;
  int? _totalElements;
  int? _size;
  int? _number;
  Sort? _sort;
  bool? _first;
  int? _numberOfElements;
  bool? _empty;

  BarList(
      {List<BarContent>? content,
      Pageable? pageable,
      bool? last,
      int? totalPages,
      int? totalElements,
      int? size,
      int? number,
      Sort? sort,
      bool? first,
      int? numberOfElements,
      bool? empty}) {
    if (content != null) {
      _content = content;
    }
    if (pageable != null) {
      _pageable = pageable;
    }
    if (last != null) {
      _last = last;
    }
    if (totalPages != null) {
      _totalPages = totalPages;
    }
    if (totalElements != null) {
      _totalElements = totalElements;
    }
    if (size != null) {
      _size = size;
    }
    if (number != null) {
      _number = number;
    }
    if (sort != null) {
      _sort = sort;
    }
    if (first != null) {
      _first = first;
    }
    if (numberOfElements != null) {
      _numberOfElements = numberOfElements;
    }
    if (empty != null) {
      _empty = empty;
    }
  }

  List<BarContent>? get content => _content;
  set content(List<BarContent>? content) => _content = content;
  Pageable? get pageable => _pageable;
  set pageable(Pageable? pageable) => _pageable = pageable;
  bool? get last => _last;
  set last(bool? last) => _last = last;
  int? get totalPages => _totalPages;
  set totalPages(int? totalPages) => _totalPages = totalPages;
  int? get totalElements => _totalElements;
  set totalElements(int? totalElements) => _totalElements = totalElements;
  int? get size => _size;
  set size(int? size) => _size = size;
  int? get number => _number;
  set number(int? number) => _number = number;
  Sort? get sort => _sort;
  set sort(Sort? sort) => _sort = sort;
  bool? get first => _first;
  set first(bool? first) => _first = first;
  int? get numberOfElements => _numberOfElements;
  set numberOfElements(int? numberOfElements) =>
      _numberOfElements = numberOfElements;
  bool? get empty => _empty;
  set empty(bool? empty) => _empty = empty;

  BarList.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      _content = <BarContent>[];
      json['content'].forEach((v) {
        _content!.add(BarContent.fromJson(v));
      });
    }
    _pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    _last = json['last'];
    _totalPages = json['totalPages'];
    _totalElements = json['totalElements'];
    _size = json['size'];
    _number = json['number'];
    _sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    _first = json['first'];
    _numberOfElements = json['numberOfElements'];
    _empty = json['empty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_content != null) {
      data['content'] = _content!.map((v) => v.toJson()).toList();
    }
    if (_pageable != null) {
      data['pageable'] = _pageable!.toJson();
    }
    data['last'] = _last;
    data['totalPages'] = _totalPages;
    data['totalElements'] = _totalElements;
    data['size'] = _size;
    data['number'] = _number;
    if (_sort != null) {
      data['sort'] = _sort!.toJson();
    }
    data['first'] = _first;
    data['numberOfElements'] = _numberOfElements;
    data['empty'] = _empty;
    return data;
  }
}

class BarContent {
  String? _id;
  String? _name;
  String? _description;
  Owner? _owner;
  String? _address;
  List<Comment>? _comments;
  String? _image;
  double? _lat;
  double? _lng;

  BarContent(
  {   String? id,  
    String? name,
      String? description,
      Owner? owner,
      String? address,
      List<Comment>? comments,
      String? image,
      double? lat,
      double? lng}) {
    if (name != null) {
      _name = name;
    }
    if (description != null) {
      _description = description;
    }
    if (owner != null) {
      _owner = owner;
    }
    if (address != null) {
      _address = address;
    }
    if (comments != null) {
      _comments = comments;
    }
    if (image != null) {
      _image = image;
    }
    if (lat != null) {
      this._lat = lat;
    }
    if (lng != null) {
      this._lng = lng;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get description => _description;
  set description(String? description) => _description = description;
  Owner? get owner => _owner;
  set owner(Owner? owner) => _owner = owner;
  String? get address => _address;
  set address(String? address) => _address = address;
  List<Comment>? get comments => _comments;
  set comments(List<Comment>? comments) => _comments = comments;
  String? get image => _image;
  set image(String? image) => _image = image;
  double? get lat => _lat;
  set lat(double? lat) => _lat = lat;
  double? get lng => _lng;
  set lng(double? lng) => _lng = lng;

  BarContent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    _address = json['address'];
    _image = json['image'];
    _lat = json['lat'];
    _lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['description'] = _description;
    if (_owner != null) {
      data['owner'] = _owner!.toJson();
    }
    data['address'] = _address;
    data['image'] = _image;
    data['lat'] = _lat;
    data['lng'] = _lng;
    return data;
  }
}

class Owner {
  String? _id;
  String? _username;
  String? _password;
  String? _email;
  String? _fullName;
  List<BarContent>? _favList;
  bool? _accountNonExpired;
  bool? _accountNonLocked;
  bool? _credentialsNonExpired;
  bool? _enabled;
  List<String>? _roles;
  String? _createdAt;
  String? _lastPasswordChangeAt;
  List<Authorities>? _authorities;

  Owner(
      {String? id,
      String? username,
      String? password,
      String? email,
      String? fullName,
      List<BarContent>? favList,
      bool? accountNonExpired,
      bool? accountNonLocked,
      bool? credentialsNonExpired,
      bool? enabled,
      List<String>? roles,
      String? createdAt,
      String? lastPasswordChangeAt,
      List<Authorities>? authorities}) {
    if (id != null) {
      _id = id;
    }
    if (username != null) {
      _username = username;
    }
    if (password != null) {
      _password = password;
    }
    if (email != null) {
      _email = email;
    }
    if (fullName != null) {
      _fullName = fullName;
    }
    if (favList != null) {
      _favList = favList;
    }
    if (accountNonExpired != null) {
      _accountNonExpired = accountNonExpired;
    }
    if (accountNonLocked != null) {
      _accountNonLocked = accountNonLocked;
    }
    if (credentialsNonExpired != null) {
      _credentialsNonExpired = credentialsNonExpired;
    }
    if (enabled != null) {
      _enabled = enabled;
    }
    if (roles != null) {
      _roles = roles;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (lastPasswordChangeAt != null) {
      _lastPasswordChangeAt = lastPasswordChangeAt;
    }
    if (authorities != null) {
      _authorities = authorities;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String? get username => _username;
  set username(String? username) => _username = username;
  String? get password => _password;
  set password(String? password) => _password = password;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get fullName => _fullName;
  set fullName(String? fullName) => _fullName = fullName;
  List<BarContent>? get favList => _favList;
  set favList(List<BarContent>? favList) => _favList = favList;
  bool? get accountNonExpired => _accountNonExpired;
  set accountNonExpired(bool? accountNonExpired) =>
      _accountNonExpired = accountNonExpired;
  bool? get accountNonLocked => _accountNonLocked;
  set accountNonLocked(bool? accountNonLocked) =>
      _accountNonLocked = accountNonLocked;
  bool? get credentialsNonExpired => _credentialsNonExpired;
  set credentialsNonExpired(bool? credentialsNonExpired) =>
      _credentialsNonExpired = credentialsNonExpired;
  bool? get enabled => _enabled;
  set enabled(bool? enabled) => _enabled = enabled;
  List<String>? get roles => _roles;
  set roles(List<String>? roles) => _roles = roles;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get lastPasswordChangeAt => _lastPasswordChangeAt;
  set lastPasswordChangeAt(String? lastPasswordChangeAt) =>
      _lastPasswordChangeAt = lastPasswordChangeAt;
  List<Authorities>? get authorities => _authorities;
  set authorities(List<Authorities>? authorities) => _authorities = authorities;

  Owner.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
    _email = json['email'];
    _fullName = json['fullName'];
    _accountNonExpired = json['accountNonExpired'];
    _accountNonLocked = json['accountNonLocked'];
    _credentialsNonExpired = json['credentialsNonExpired'];
    _enabled = json['enabled'];
    _roles = json['roles'].cast<String>();
    _createdAt = json['createdAt'];
    _lastPasswordChangeAt = json['lastPasswordChangeAt'];
    if (json['authorities'] != null) {
      _authorities = <Authorities>[];
      json['authorities'].forEach((v) {
        _authorities!.add(Authorities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['username'] = _username;
    data['password'] = _password;
    data['email'] = _email;
    data['fullName'] = _fullName;
    data['accountNonExpired'] = _accountNonExpired;
    data['accountNonLocked'] = _accountNonLocked;
    data['credentialsNonExpired'] = _credentialsNonExpired;
    data['enabled'] = _enabled;
    data['roles'] = _roles;
    data['createdAt'] = _createdAt;
    data['lastPasswordChangeAt'] = _lastPasswordChangeAt;
    if (_authorities != null) {
      data['authorities'] = _authorities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Authorities {
  String? _authority;

  Authorities({String? authority}) {
    if (authority != null) {
      _authority = authority;
    }
  }

  String? get authority => _authority;
  set authority(String? authority) => _authority = authority;

  Authorities.fromJson(Map<String, dynamic> json) {
    _authority = json['authority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authority'] = _authority;
    return data;
  }
}

class Pageable {
  Sort? _sort;
  int? _offset;
  int? _pageNumber;
  int? _pageSize;
  bool? _unpaged;
  bool? _paged;

  Pageable(
      {Sort? sort,
      int? offset,
      int? pageNumber,
      int? pageSize,
      bool? unpaged,
      bool? paged}) {
    if (sort != null) {
      _sort = sort;
    }
    if (offset != null) {
      _offset = offset;
    }
    if (pageNumber != null) {
      _pageNumber = pageNumber;
    }
    if (pageSize != null) {
      _pageSize = pageSize;
    }
    if (unpaged != null) {
      _unpaged = unpaged;
    }
    if (paged != null) {
      _paged = paged;
    }
  }

  Sort? get sort => _sort;
  set sort(Sort? sort) => _sort = sort;
  int? get offset => _offset;
  set offset(int? offset) => _offset = offset;
  int? get pageNumber => _pageNumber;
  set pageNumber(int? pageNumber) => _pageNumber = pageNumber;
  int? get pageSize => _pageSize;
  set pageSize(int? pageSize) => _pageSize = pageSize;
  bool? get unpaged => _unpaged;
  set unpaged(bool? unpaged) => _unpaged = unpaged;
  bool? get paged => _paged;
  set paged(bool? paged) => _paged = paged;

  Pageable.fromJson(Map<String, dynamic> json) {
    _sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    _offset = json['offset'];
    _pageNumber = json['pageNumber'];
    _pageSize = json['pageSize'];
    _unpaged = json['unpaged'];
    _paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_sort != null) {
      data['sort'] = _sort!.toJson();
    }
    data['offset'] = _offset;
    data['pageNumber'] = _pageNumber;
    data['pageSize'] = _pageSize;
    data['unpaged'] = _unpaged;
    data['paged'] = _paged;
    return data;
  }
}

class Sort {
  bool? _empty;
  bool? _sorted;
  bool? _unsorted;

  Sort({bool? empty, bool? sorted, bool? unsorted}) {
    if (empty != null) {
      _empty = empty;
    }
    if (sorted != null) {
      _sorted = sorted;
    }
    if (unsorted != null) {
      _unsorted = unsorted;
    }
  }

  bool? get empty => _empty;
  set empty(bool? empty) => _empty = empty;
  bool? get sorted => _sorted;
  set sorted(bool? sorted) => _sorted = sorted;
  bool? get unsorted => _unsorted;
  set unsorted(bool? unsorted) => _unsorted = unsorted;

  Sort.fromJson(Map<String, dynamic> json) {
    _empty = json['empty'];
    _sorted = json['sorted'];
    _unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = _empty;
    data['sorted'] = _sorted;
    data['unsorted'] = _unsorted;
    return data;
  }
}
