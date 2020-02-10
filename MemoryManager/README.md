# 控制器的内存检测思路

- 在控制器的生命周期里，hook导航导航控制器的pop即push方法，记录控制器在导航控制器里出入栈的状态
- hook控制器viewDidDisappear方法, 在控制器viewDidDisappear里注入处理，如果控制器已经出栈了，延迟2秒判断控制器是否为nil，如果不为nil则内存泄漏(延迟监听)。


