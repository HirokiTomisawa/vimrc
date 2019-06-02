# gitで管理したいため, macbookのホームに保存されている.vimrc ファイルを同期
#
# 本体のファイル
# /User/Buchi/.vimrc
# gitへ同期されるファイル
# /User/Buchi/Documents/ProgrammingFolder/vimrc/.vimrc

puts `cp -f ~/.vimrc ~/Documents/ProgrammingFolder/vimrc/`
