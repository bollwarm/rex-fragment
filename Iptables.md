## iptables 防火墙管理

### list the iptables rules

### 查看目前防火墙规则

    task "ipf", group => "all", sub {
    my $output= run 'iptables-save';
    say connection->server.": $output";
    };
    
### save rules to files 

###保存现有防火墙规则到文件（确保保存时候防火墙规则正常，此操作会覆盖/etc/sysconfig/iptables）
    
    task "ipv", group => "all", sub {
    my $output= run 'service iptables save';
    say connection->server.": $output";
    };
    
### add some ip open for sshd (port for 22)

### 批量开放IP地址的sshd访问
    
    task "ipc", group => "all", sub {
    
    my $myport="22";
    
    my @ip=qw(192.168.1.2  192.168.1.0 );
    
     for(@ip)
    {
       iptables I=>"INPUT", s => "$_",p=>'tcp',dport=>"$myport",j => 'ACCEPT';
    }
   
    run 'service iptables save'; 
    };
    
### delete rules and save the rules to files

### 删除防火墙规则中的一条
    
    task "ipd", group => "all", sub {
    
    say connection->server." ipd begin";
    run 'iptables -DINPUT -p tcp -m state --state NEW -m multiport --dports 6379,22 -j ACCEPT';
    run 'service iptables save';
    say connection->server." ipd end";
    
    };
    


