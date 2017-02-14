## 主机账号管理 Usermanage
     
### add user
### 创建或者修改用户
     
     task "create-user",group => "all", sub {
     
     say connection->server." begin create";
     
     create_user "yy",
     password => 'yy123';
     
     say connection->server.” done!”;
     };
     
### butch add user
### 添加多个账号，并增加证书，增加sudo权限
     
     task "butchuser", group => "all", sub {
     
     my @ustr=qw(user1 user2 user3);
     my @pass=qw(pass1 pass2 pass3);
     
     for (0..#@ustr)
     {
     my ( $userId, $pass)=($ustr[$_],$pass[$_]);
     my $key='ssh-rsa AAAAB3N.....';
     
     
     create_user $userId,
            password => $pass,
            home => '/home/'.$userId,
            ssh_key =>$key;
     }
     
     append_if_no_such_line "/etc/sudoers", "$userId ALL=(ALL) ALL";
     
     say connection->server;
     
     };
     
### list all users of hosts
### 列出系统所有用户 
     
     
     task "list_user", group =>"all", sub {
     
        my @a=user_list();
        say connection->server. ":@a";
      };
     
     task "lastlog", group => "all", sub {
       my $time= run "lastlog|grep -v 'Never logged in'";
       say connection->server.": $time";
     };
     
