```
cp vimrc ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

进入vim:
PlugInstall
```

## 关于YouCompleteMe
1. 编译安装 --all选项指所有
```
vivo@vivo-ThinkCentre-M6600t-N000:~/.vim/plugged/YouCompleteMe$ ./install.sh --clang-completer --clangd-completer --ts-completer --java-completer
```
2.--java-completer中如果jdt无法下载修改文件,从https服务器上获取: 
third_party/ycmd/build.py
```
diff --git a/build.py b/build.py
index 5b31c1f2..2b0bf4fb 100755
--- a/build.py
+++ b/build.py
@@ -961,7 +961,9 @@ def EnableJavaCompleter( switches ):
   REPOSITORY = p.join( TARGET, 'repository' )
   CACHE = p.join( TARGET, 'cache' )
 
-  JDTLS_SERVER_URL_FORMAT = ( 'http://download.eclipse.org/jdtls/snapshots/'
+  JDTLS_SERVER_URL_FORMAT = ( 'https://saimei.ftp.acc.umu.se/mirror/eclipse.org/jdtls/snapshots/'
+  # jdt-language-server-0.45.0-201910031256.tar.gz
+  #JDTLS_SERVER_URL_FORMAT = ( 'http://download.eclipse.org/jdtls/snapshots/'
                               '{jdtls_package_name}' )
   JDTLS_PACKAGE_NAME_FORMAT = ( 'jdt-language-server-{jdtls_milestone}-'
                                 '{jdtls_build_stamp}.tar.gz' )
```

3.配置
在具体的项目中，在项目的根目录中放一个.ycm_extra_conf.py，并且加上头文件目录的配置，比如，
flags = [
'-Wall',
'-Wextra',
'-Werror',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
...
'-I',
'/home/macduan/work/opensource/brpc/src',
'-I',
'/home/macduan/work/opensource/brpc/src/brpc',
'-I',
'/home/macduan/work/opensource/brpc/src/bthread',
'-I',
'/home/macduan/work/opensource/brpc/src/butil',
'-I',
'/home/macduan/work/opensource/brpc/src/bvar',
'-I',
'/home/macduan/work/opensource/brpc/src/json2pb',
'-I',
'/home/macduan/work/opensource/brpc/src/mcpack2pb']

Linux内核
flags = [
'-Wall',
'-Wextra',
'-Werror',
'-Wc++98-compat',
'-Wno-long-long',
'-Wno-variadic-macros',
'-fexceptions',
'-DNDEBUG',
# added for kernel compile
'-Wundef',
'-Wstrict-prototypes',
'-Wno-trigraphs',
'-fno-strict-aliasing',
'-fno-common',
'-Werror-implicit-function-declaration',
'-Wno-format-security',
# THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
# language to use when compiling headers. So it will guess. Badly. So C++
# headers will be compiled as C headers. You don't want that so ALWAYS specify
# a "-std=<something>".
# For a C project, you would set this to something like 'c99' instead of
# 'c++11'.
'-std=c99',
# ...and the same thing goes for the magic -x option which specifies the
# language that the files to be compiled are written in. This is mostly
# relevant for c++ headers.
# For a C project, you would set this to 'c' instead of 'c++'.
'-x',
'c',
'-I',
'include/',
'-I',
'include/generated',
'-I',
'include/asm-generic/',
'-I',
'arch/x86/include',
'-I',
'arch/x86/include/generated',
'-I',
'arch/x86/include/uapi',
'-I',
'arch/x86/include/generated/uapi',
]
