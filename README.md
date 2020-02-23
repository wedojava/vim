# For Mac OS X

```
cd ~/git && git clone https://github.com/wedojava/vim.git
ln -s ~/git/vim/mysnippets ~/.vim/mysnippets
ln -s ~/git/vim/vimrc ~/.vim/vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```



# For Windows

Get repository:

```
git clone https://github.com/wedojava/vim.git
```

# Supplement

## get snippet

go:

https://raw.githubusercontent.com/fatih/vim-go/master/gosnippets/UltiSnips/go.snippets


Repository to settings:

```
cd vim
copy vimrc\gvimrc_windows ~\vimfiles\gvimrc
copy vimrc\vimrc_windows ~\vimfiles\vimrc
robocopy colors ~\vimfiles\colors *
```



Settings to repository:

```
cd vim
copy ~\vimfiles\gvimrc vimrc\gvimrc_windows
copy ~\vimfiles\vimrc vimrc\vimrc_windows
robocopy ~\vimfiles\colors colors *
```



# Experience



​        YCM 实际上最难安装的插件, 我最近在 Mac Windows Linux 上都搭建使用安装过并且成功运行 C/C++ Go 的功能, 体验到了一些 **过坑哲学** :

1. 如果你发现别人都是好的, 只有你出问题了, 那么考虑更换你的环境. 比如, 如果你要测试这款插件, 你怎么测? 从官网下载 python 安装, 或者最传统的 apt yum brew 的方式去安装, 不用什么版本控制软件.
2. 沿用这个思路以及我们常说的重启大法好的说法, 如果你不是一定要找出插件安装的问题在哪里, 最简单的办法, 减少错误可能发生的条件: 排除其他你的个性安装方式或者其他独特安装办法.
3. 重装大法好, 如果不是要帮助提交代码解决问题, 重装 Vim 或插件也是不错的选择, 至少这可以缩小问题域.
4. Vim 和 YCM 在 Python 编译时路径存在问题, 你通过某种方式管理多版本 Python 可能会让你遇到别人遇不到的问题 , 意味着, 你可能需要手动指定 `python37.dll` 或重装 python 可以解决一些问题.
5. 经过最近一段时间的折腾, 对于 vim 类型选择我是这么理解的:
   1. Macvim 最好用, 所以苹果系统最好用, 电脑最好用. 苹果的确好用, 好稳, 好稳 !!!
   2. Gvim better than Neovim on Windows, 真的如此, 至少 Neovim 打开就是比 Gvim 慢 2020年2月23日我这么说的, 近期应该没什么变化了.
   3.  Neovim's fell good on Linux, you're worth it!
