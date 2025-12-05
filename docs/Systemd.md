## ✅ 常见 `Type` 类型详解

### 1. `Type=simple`（默认值）
- **行为**：systemd 认为 `ExecStart` 启动的进程就是主服务进程。
- **适用场景**：程序**前台运行、不 fork 子进程**（如大多数现代 Web 服务器：Nginx、Gunicorn、Node.js 应用等）。
- **注意**：如果程序在启动后立即 fork 并退出父进程，systemd 会误以为服务已崩溃！

```ini
[Service]
Type=simple
ExecStart=/usr/bin/my-web-server --port=8080
```

> ✅ **推荐用于：直接前台运行的程序**

---

### 2. `Type=forking`
- **行为**：
  - systemd 启动 `ExecStart` 后，**等待其父进程退出**；
  - 然后通过 `PIDFile=` 指定的文件获取子进程 PID 作为主服务进程。
- **适用场景**：传统守护进程（daemon），启动后会 fork 并退出父进程（如 `httpd`、旧版 MySQL、自研 daemon）。
- **必须配合**：`PIDFile=` 指向实际子进程的 PID 文件。

```ini
[Service]
Type=forking
ExecStart=/usr/sbin/my-daemon --daemon
PIDFile=/run/my-daemon.pid
```

> ⚠️ 如果不提供 `PIDFile=`，systemd 可能无法正确跟踪进程！

---

### 3. `Type=oneshot`
- **行为**：
  - `ExecStart` 执行完即视为“启动成功”；
  - 服务状态变为 **active (exited)**；
  - 通常用于**一次性任务**（如初始化脚本、数据库迁移）。
- **常配合**：`RemainAfterExit=yes`（保持 active 状态）

```ini
[Service]
Type=oneshot
ExecStart=/bin/mkdir -p /var/cache/myapp
RemainAfterExit=yes
```

> ✅ **典型用途**：系统初始化、预处理脚本

---

### 4. `Type=notify`
- **行为**：
  - 服务启动后，通过 **sd_notify(3)** 协议主动通知 systemd “我已准备就绪”；
  - systemd 在收到通知前会一直等待。
- **适用场景**：支持 systemd 通知协议的现代服务（如 `sshd`、`dbus`、使用 `systemd-python` 的应用）。
- **优点**：精确控制“就绪”时机（如等待数据库连接成功后再通知）。

```ini
[Service]
Type=notify
ExecStart=/usr/bin/my-app --with-systemd-notify
```

> 🔧 开发提示：在代码中调用 `sd_notify(0, "READY=1")` 发送就绪信号。

---

### 5. `Type=idle`
- **行为**：类似 `simple`，但会**延迟执行**，直到所有任务完成（避免日志混杂）。
- **用途**：仅用于改善控制台日志可读性，**极少使用**。

---

### 6. `Type=exec`（systemd ≥ 247）
- **行为**：类似 `simple`，但如果 `ExecStart` 进程未能成功启动（如权限错误），立即标记为失败。
- **区别**：比 `simple` 更严格的启动检查。

---

## 📊 对比总结表

| Type        | 主进程识别方式           | 典型应用                     | 是否需要 PIDFile | 启动后状态       |
|-------------|--------------------------|------------------------------|------------------|------------------|
| `simple`    | ExecStart 进程即主进程   | Node.js, Python Flask, Go 程序 | ❌               | active (running) |
| `forking`   | 父进程退出，子进程为主   | Apache httpd, 自研 daemon     | ✅               | active (running) |
| `oneshot`   | ExecStart 执行完毕       | 初始化脚本、备份任务          | ❌               | active (exited)  |
| `notify`    | 通过 sd_notify 通知就绪  | 支持 systemd 的现代服务       | ❌               | active (running) |
| `idle`      | 延迟 simple              | 控制台日志美化                | ❌               | active (running) |

---