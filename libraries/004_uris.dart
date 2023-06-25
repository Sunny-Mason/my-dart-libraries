void main(List<String> args) {
  f1();
  f2();
  f3();
  f4();
  print('done.');
}

//编码和解码完整合法的URI
void f1() {
  // 使用 encodeFull() 和 decodeFull() 方法，对 URI 中除了特殊字符（例如 /， :， &， #）以外的
  //字符进行编解码，这些方法非常适合编解码完整合法的 URI，并保留 URI 中的特殊字符。
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);
}

// 编码和解码 URI 组件
void f2() {
  // 使用 encodeComponent() 和 decodeComponent() 方法，对 URI 中具有
  //特殊含义的所有字符串字符，特殊字符包括（但不限于）/， &，和 :。
  var uri = 'https://example.org/api?foo=some message';

  var encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  var decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);
}

// 解析 URI
void f3() {
  // 使用 Uri 对象的字段（例如 path），来获取一个 Uri 对象或者 URI 字符串的一部分。
  //使用 parse() 静态方法，可以使用字符串创建 Uri 对象。
  var uri = Uri.parse('https://example.org:8080/foo/bar#frag');

  assert(uri.scheme == 'https');
  assert(uri.host == 'example.org');
  assert(uri.path == '/foo/bar');
  assert(uri.fragment == 'frag');
  assert(uri.origin == 'https://example.org:8080');
}

// 构建 URI
void f4() {
  // 使用 Uri() 构造函数，可以将各组件部分构建成 URI 。
  var uri = Uri(
      scheme: 'https',
      host: 'example.org',
      path: '/foo/bar',
      fragment: 'frag',
      queryParameters: {'lang': 'dart'});
  assert(uri.toString() == 'https://example.org/foo/bar?lang=dart#frag');

  // If you don’t need to specify a fragment, to create a URI with a http or https scheme,
  // you can instead use the Uri.http or Uri.https factory constructors:
  var httpUri = Uri.http('example.org', '/foo/bar', {'lang': 'dart'});
  var httpsUri = Uri.https('example.org', '/foo/bar', {'lang': 'dart'});

  assert(httpUri.toString() == 'http://example.org/foo/bar?lang=dart');
  assert(httpsUri.toString() == 'https://example.org/foo/bar?lang=dart');
}
