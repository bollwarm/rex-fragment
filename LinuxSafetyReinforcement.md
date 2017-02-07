## 主机安全加固Host Safety Reinforcement

###Service reinforcement
####服务和启动精简

     task "ServiceSF", group => "all",  sub {
     
     say connection->server.":Service Reinforcement update!";
     
     my @myservices=qw(cups postfix); #add more
     
     for(@myservices) {
     
       run "service $_ stop";
       run "chkconfig $_ off";
     
     }
     
     run "chkconfig iptables on";
     
     say connection->server.":upate success!";
     };
     
### sshd reinforcement
### sshd 加固
     
     task "sshd",group =>"all", sub {
     
      say connection->server." begin!";
     
      append_if_no_such_line "/etc/ssh/sshd_config", "PermitRootLogin no";
     
#### Start certificate and forbident passwd login，You must add your key to object host。
     
#### 启用证书登陆，禁止密码登陆，你需要先添加好证书在做此项加固 
        
###delete_lines_matching "/etc/ssh/sshd_config" => "PasswordAuthentication no";
###append_if_no_such_line "/etc/ssh/sshd_config", "PasswordAuthentication yes";
     
      service sshd => "restart";
     
     say connection->server." done!";
     
      };
     
#### option the sshd login speed
#### 优化sshd登陆速度
     
     task "sshdOP",group =>"all", sub {
     
     delete_lines_matching "/etc/ssh/sshd_config", "#GSSAPIAuthentication no";
     delete_lines_matching "/etc/ssh/sshd_config", "#UseDNS no";
     append_if_no_such_line "/etc/ssh/sshd_config", "PermitRootLogin no";
     append_if_no_such_line "/etc/ssh/sshd_config", "GSSAPIAuthentication no";
     append_if_no_such_line "/etc/ssh/sshd_config", "UseDNS no";
     
      service sshd => "restart";
     
     say connection->server." done!";
      };


