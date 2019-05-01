---
excerpt_separator: <!--more-->
layout: post
title:  "Spark RDD isCheckpointed"
date:   2017-01-23 21:07:41 +0800
categories: [spark]
category: spark
---

### isCheckpointed

确认是否该RDD已经被checkpointed过。

函数原型：

  def isCheckpointed: Boolean

例子：

```scala

sc.setCheckpointDir("/home/cloudera/Documents")
c.isCheckpointed
res6: Boolean = false

c.checkpoint
c.isCheckpointed
res8: Boolean = false

c.collect
c.isCheckpointed
res9: Boolean = true
```

