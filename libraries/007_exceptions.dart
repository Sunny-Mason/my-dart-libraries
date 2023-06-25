//通常通过抛出一个应用特定的异常，来表示应用发生了错误。通过实现 Exception 接口来自定义异常：
class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void main() {
  // Here we will throw FooException to demonstrate its use
  try {
    throw FooException('This is a custom message.');
  } catch (e) {
    print(e); // Output: This is a custom message.
  }
}
