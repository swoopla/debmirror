# debmirror

## Why ?

I used the old 1and1internet/debmirror docker image and i don't agree with the new one (move environment variable to configuration file). 
I want manage debmiror with environment variables and keep it personnal in my dot env file. 

I merge actual image with the older image.

## How to use

## Possibility to use an external config file (more complex):

modify `example.debmirror.conf` and put in `/config/path/debmirror.conf`

run with:

```docker run -v /repo/path:/debmirror -v /config/path:/status swoopla/debmirror```

## Possibility to use environment variables (more simple):

add your environment variables in your .env

```text
SOURCE="ftp.debian.org"
DIST="stretch"
SECTION="main,contrib,non-free"
ARCH="am64"
METHOD="http"
```

```docker run --env-file .env -v /repo/path:/debmirror swoopla/debmirror```

