## Systemd User

```
/etc/systemd/user/ 这里存放的是由系统管理员维护的系统范围的用户服务。
/usr/lib/systemd/user/ 这里存放的是各个软件包安装的服务。
~/.config/systemd/user/ 这里存放的是用户自身的服务。
~/.local/share/systemd/user/ 这里存放的是HOME目录中已安装的软件包的单元。
```

## 开机自启动
`systemctl --user enable unit`

## 启动
`systemctl --user start unit`

## 全局生效
`sudo systemctl --global enable service`


## 环境变量
- systemd 用户实例不会继承类似 .bashrc 中定义的 环境变量。

### 创建用户自定义环境变量
- Service 文件例子
- 新建 drop-in 目录 /etc/systemd/system/user@.service.d/ 然后在里面新建一个 .conf文件 (例如 local.conf):
```

/etc/systemd/system/user@.service.d/local.conf

[Unit]
Description = some descriptions
Documentation = man:xxx(8) man:xxx_config(5)
Requires = xxx1.target xxx2.target
After = yyy1.target yyy2.target

[Service]
MemoryLimit=300M
CPUQuota=30%
Environment="PATH=/usr/lib/ccache/bin:/usr/local/bin:/usr/bin:/bin"
Environment="EDITOR=nano -c"
Environment="BROWSER=firefox"
Environment="NO_AT_BRIDGE=1"
# simple, exec, forking, oneshot, dbus, notify, idle
Type=forking # 执行后创建子进程后为完成 类似 Nginx
Type=simple  # 执行后没退出即完成 类似 Gitea 当没填写则默认是这个
Type=oneshot # 执行并正常退出视为完成
PIDFile = /run/nginx.pid # 仅 forking 模式可用
ExecStartPre = /usr/bin/rm -f /run/nginx.pid
ExecStart=/usr/bin/supervisord -c /etc/supervisord.conf
ExecReload=/usr/bin/supervisorctl reload
ExecStop=/usr/bin/supervisorctl shutdown
RestartSec = <TIME>

[Install]
WantedBy = xxx.target yy.target
```

## More
- see https://docs.syncthing.net/users/autostart.html#linux
- see https://www.freedesktop.org/software/systemd/man/systemd.unit.html