---
layout: post
title:  "finally中获取对象引用"
date:   2017-04-03 21:07:41 +0800
categories: scala Seq match
---

在scala的try/catch/finally中，通常的处理情况如下：

{% highlight scala %}
try { 
  openAndReadAFile(filename)
} catch {
  case e: FileNotFoundException => println("Couldn't find that file.")
  case e: IOException => println("Had an IOException trying to read that file")
  // case _: Throwable => println("exception ignored")
  case e: Throwable => t.printStackTrace()
}
{% endhighlight %}

<!--more-->
但是有一种情况特殊，就是当需要finally中，利用一些对象的引用来进行操作（比如关闭文件，或者socket等引用时），需要在finally中拿到这些对象的引用。那么利用上述方式就无法达到。比如：

{% highlight scala %}
try { 
  val in = new FileInputStream("/tmp/Test.class")
  val out = new FileOutputStream("/tmp/Test.class.copy")
} catch {
  case e: FileNotFoundException => println("Couldn't find that file.")
  case e: IOException => println("Had an IOException trying to read that file")
  // case _: Throwable => println("exception ignored")
  case e: Throwable => t.printStackTrace()
} finally {
  // compile error
  in.close()
  out.close()
}
{% endhighlight %}

这种情况下，`finally`中无法获取两个文件的引用，也就无法进行`close`操作。

可以通过如下方式来解决：

{% highlight scala %}
import java.io._
object CopyBytes extends App {
  var in = None: Option[FileInputStream] 
  var out = None:Option[FileOutputStream]

  try {
    in = Some(new FileInputStream("/tmp/Test.class"))
    out = Some(new FileOutputStream("/tmp/Test.class.copy")) var c = 0

    while ({c = in.get.read; c != −1}) {
      out.get.write(c)
  } catch {
    case e: IOException => e.printStackTrace
  } finally {
    println("entered finally ...") 
    if (in.isDefined) in.get.close 
    if (out.isDefined) out.get.close
  } 
}
{% endhighlight %}