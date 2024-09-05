#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:53:30
# @LastEditTime: 2024-06-06 20:18:25
# @LastEditors: Cloudflying
# @Description: $PATH Init
###

# 加载自定义目录二进制文件 垃圾的 macOS 还不能删
# PATH 放后头 系统是从前往后搜索

export PNPM_HOME="${HOME}/.local/share/pnpm"

# "/usr/local/opt/coreutils/bin"
# "/usr/local/opt/coreutils/libexec/gnubin" 有 env 可执行文件 影响系统

PATHS=(
  "/usr/games"
  "/usr/local/games"
  "${PNPM_HOME}"
  "${HOME}/.bin"
  "${HOME}/.boxs/bin"
  "${HOME}/.local/share/boxs/bin"
  "${HOME}/.local/share/zinit/polaris/bin"
  "${HOME}/.composer/vendor/bin"
  "${HOME}/.config/composer/vendor/bin"
  "${HOME}/.cargo/bin"
  "/usr/local/opt/whois/bin"
  "/usr/local/opt/python3/libexec/bin" # 覆盖系统自带的 python3 (macOS)
  "/usr/local/opt/mtr/sbin"
  "/usr/local/opt/universal-ctags/bin"
  "/usr/local/opt/apktool/bin"
)

for APP_PATH in "${PATHS[@]}"; do
  if [[ -d "${APP_PATH}" ]]; then
    export PATH="${APP_PATH}:${PATH}"
  fi
done

MAN_PATHS=(
  "/usr/local/opt/coreutils/libexec/gnuman"
)

echo "[+] Set MAN PATH"
for APP_MAN_PATH in "${MAN_PATHS[@]}"; do
  if [[ -d "${APP_MAN_PATH}" ]]; then
    export MANPATH="${APP_MAN_PATH}:${MANPATH}"
  fi
done

# 加载自定义版本 PHP
if [[ -d "/usr/local/opt/php@${PHP_VERSION}/bin" ]]; then
  echo "[+] Set PHP To ${PHP_VERSION}"
  export PATH="/usr/local/opt/php@${PHP_VERSION}/bin:${PATH}"
  export PATH="/usr/local/opt/php@${PHP_VERSION}/sbin:${PATH}"
  export LDFLAGS="${LDFLAGS} -L/usr/local/opt/php@${PHP_VERSION}/lib"
  export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/php@${PHP_VERSION}/include"
fi

# macOS 预置了老版本 需要覆盖
if [[ -f "/usr/local/opt/ruby/bin/ruby" ]]; then
  export PATH="/usr/local/opt/ruby/bin:${PATH}"
  export LDFLAGS="-L/usr/local/opt/ruby/lib ${LDFLAGS}"
  export CPPFLAGS="-I/usr/local/opt/ruby/include ${CPPFLAGS}"
  export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig:${PKG_CONFIG_PATH}"
fi

if [[ -d '/usr/local/opt/mariadb@10.2' ]]; then
  export PATH="/usr/local/opt/mariadb@10.2/bin:$PATH"
  export LDFLAGS="-L/usr/local/opt/mariadb@10.2/lib"
  export CPPFLAGS="-I/usr/local/opt/mariadb@10.2/include"
  export PKG_CONFIG_PATH="/usr/local/opt/mariadb@10.2/share/pkgconfig"
fi

if [[ -d '/usr/local/opt/mysql@5.7' ]]; then
  export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
  export LDFLAGS="${LDFLAGS} -L/usr/local/opt/mysql@5.7/lib"
  export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/mysql@5.7/include"
  export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"
fi

# Node Env
# if [[ -d '/usr/local/opt/node@12' ]]; then
#   export PATH="/usr/local/opt/node@12/bin:$PATH"
#   export LDFLAGS="$LDFLAGS -L/usr/local/opt/node@12/lib"
#   export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/node@12/include"
# fi

if [[ -d '/usr/local/opt/node@14' ]]; then
  export PATH="/usr/local/opt/node@14/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/node@14/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/node@14/include"
fi

if [[ -d '/usr/local/opt/node@16' ]]; then
  export PATH="/usr/local/opt/node@16/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/node@16/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/node@16/include"
fi

if [[ -d '/usr/local/opt/libiconv' ]]; then
  export PATH="/usr/local/opt/libiconv/bin:$PATH"
  export LDFLAGS="$LDFLAGS  -L/usr/local/opt/libiconv/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/libiconv/include"
fi

if [[ -d '/usr/local/opt/krb5' ]]; then
  export PATH="/usr/local/opt/krb5/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/krb5/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/krb5/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/krb5/lib/pkgconfig"
fi

if [[ -d '/usr/local/opt/icu4c' ]]; then
  export PATH="/usr/local/opt/icu4c/bin:$PATH"
  export ICU_CFLAGS="$-L/usr/local/opt/icu4c/lib"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/icu4c/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/icu4c/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/icu4c/lib/pkgconfig"
fi

if [[ -d '/usr/local/opt/enchant' ]]; then
  export PATH="/usr/local/opt/enchant/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/enchant/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/enchant/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/enchant/lib/pkgconfig"
fi

if [[ -d '/usr/local/opt/libiconv/lib' ]]; then
  export PATH="/usr/local/opt/libiconv/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/libiconv/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/libiconv/include"
fi

if [[ -d '/usr/local/opt/bzip2/lib' ]]; then
  export PATH="/usr/local/opt/bzip2/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/bzip2/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/bzip2/include"
fi

if [[ -d '/usr/local/opt/openssl/' ]]; then
  export PATH="/usr/local/opt/openssl/bin:$PATH"
  export LDFLAGS="$LDFLAGS -L/usr/local/opt/openssl/lib"
  export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/openssl/include"
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig"
fi
