#!/usr/bin/python

import subprocess
import json

#need to work on using an arg for folder path
#proc = subprocess.Popen(["find", "/root/data/images/", "-type", "l", "-name", "manifest"], stdout=subprocess.PIPE)
proc = subprocess.Popen(["find", "/root/data/images/"], stdout=subprocess.PIPE)
(manifests, err) = proc.communicate()

manifest_list = []
root_manifest = {}


manifest_list.append(manifests.split("\n"))

print(json.dumps(manifest_list))
