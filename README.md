## Develop Everywhere

create a develop env using docker

### how-to

1. docker build -t ubuntu .
2. docker run --name ubuntu --rm -v <your local dev directory>:/data/workspace -it ubuntu

### to-do

- 可以在容器里装一个sshd，这样可以一直启动着容器，在本地通过ssh操作它


### lessons

- git add后，感觉有点问题，脑抽直接git reset --hard了，结果差点恢复不回来了！！！

> 好在google到掘金上一篇牛逼文，执行`git fsck --lost-found`后，抹黑总算找回了

> 教训就是，不要轻易reset hard，就算要reset hard，也要先commit。这个问题，如果已经
> commit过了，要恢复根本不是个事

> 本地多多commit没坏处
