# Shell Linter and formatter

[![Build Status](https://ci.isaev.tech/api/badges/IsaevTech/shfmt/status.svg)](https://ci.isaev.tech/IsaevTech/shfmt)

## Usage

```bash
lint  # Lint all shell scripts
lint file1 file2 file3  # Lint files with name passed in args
format  # Reformat all shell scripts (Will exit 1 if something formatted)
format file1 file2 file3  # Reformat files with name passed in args
minify  # Minify all shell scripts (Will exit 1 if something formatted)
minify file1 file2 file3  # Minify files with name passed in args
```

## Examples

### Initial bash script

```bash
#!/bin/bash
MY_DIRECTORIES="/home /var/log"
echo "Top Ten Disk Space Usage"
for DIR in $MY_DIRECTORIES
do
echo "The $DIR Directory:"
du -S $DIR 2>/dev/null |
sort -rn |
sed '{11,$D; =}' |
sed 'N; s/\n/ /' |
awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
done
exit
```

### lint (with exit-code: 1)

```diff
--- example.sh.orig
+++ example.sh
@@ -1,13 +1,12 @@
 #!/bin/bash
 MY_DIRECTORIES="/home /var/log"
 echo "Top Ten Disk Space Usage"
-for DIR in $MY_DIRECTORIES
-do
-echo "The $DIR Directory:"
-du -S $DIR 2>/dev/null |
-sort -rn |
-sed '{11,$D; =}' |
-sed 'N; s/\n/ /' |
-awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
+for DIR in $MY_DIRECTORIES; do
+    echo "The $DIR Directory:"
+    du -S $DIR 2>/dev/null |
+        sort -rn |
+        sed '{11,$D; =}' |
+        sed 'N; s/\n/ /' |
+        awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
 done
 exit
```

### format

```bash
#!/bin/bash
MY_DIRECTORIES="/home /var/log"
echo "Top Ten Disk Space Usage"
for DIR in $MY_DIRECTORIES; do
    echo "The $DIR Directory:"
    du -S $DIR 2>/dev/null |
        sort -rn |
        sed '{11,$D; =}' |
        sed 'N; s/\n/ /' |
        awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
done
exit
```

### minify

```bash
MY_DIRECTORIES="/home /var/log"
echo "Top Ten Disk Space Usage"
for DIR in $MY_DIRECTORIES;do
echo "The $DIR Directory:"
du -S $DIR 2>/dev/null|sort -rn|sed '{11,$D; =}'|sed 'N; s/\n/ /'|awk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
done
exit
```
<!-- markdownlint-configure-file { "MD013": { "line_length": 120 } } -->
