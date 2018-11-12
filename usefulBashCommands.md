# Useful Bash Commands

Commands that I've found useful and haven't really implemented in scripts.

They need to be written down somewhere so I don't have to look up how to do stuff repetitively. 

## Moving a bunch of files into another directory

```
ls *.filetype | xargs mv -t /your/destination/path
```

## How to use `find`

```
find /the/search/path/ -name *yourRegex* 
```

## Searching to a certain depth with `find`

```
find /the/search/path -maxdepth 2 -name *yourRegex* 
```
**Note, order is important.**

Will only search for a max depth (on your file tree) of 2 folders deep. You can also use `-mindepth 2` for an inverse result. 


