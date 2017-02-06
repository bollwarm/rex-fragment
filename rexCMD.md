## rex执行相关

### 只显示任务执行信息，去掉过程和错误信息。

     rex -qw mytask 

### 把执行结果限制在控制台并存到文件中

     rex -qw mytask  | tee -a info.log

### 指定主机执行：

    rex -qw -H 172.0.0.12 $task

### 指定分组执行 temp：

     rex -qw -G temp mytask

### 列出命令参数 
   
     rex -h

### 列出任务和分组主机 

    rex -T

### 通过文件执行定义任务

     rex -qw creatuser -f userRfile

### 给任务传递参数？

    rex -H hostname mytask --parameter1=value1 --parameter2=value2

    task 'mytask', sub {
      my $parameters = shift;
      my $parameter1_value = $parameters->{parameter1};
      my $parameter2_value = $parameters->{parameter2};
    };


