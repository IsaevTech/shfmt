# Shell Linter and formatter

[![Build Status](https://ci.isaev.tech/api/badges/IsaevTech/yamllint/status.svg)](https://ci.isaev.tech/IsaevTech/yamllint)

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

ip=`hostname -I`
for i in $ip
do
echo $i
done
```

### lint (with exit-code: 1)

```diff
--- example.sh.orig
+++ example.sh
@@ -1,7 +1,6 @@
 #!/bin/bash
 
-ip=`hostname -I`
-for i in $ip
-do
-echo $i
+ip=$(hostname -I)
+for i in $ip; do
+    echo $i
 done
```

### format

```bash
#!/bin/bash

ip=$(hostname -I)
for i in $ip; do
    echo $i
done
```

### minify

```bash
ip=$(hostname -I)
for i in $ip;do
echo $i
done
```
