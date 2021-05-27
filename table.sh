#!/bin/bash
echo \<div class="table"\>
echo \<h3 class="title"\>$1\<\/h3\>
echo \<table\>
while read line; do
    echo \<div class="item"\>
    echo \<tr\>
    for item in $line; do
        echo \<td\>$item\<\/td\>
    done
    echo \<\/tr\>
    echo \<\/div\>
done
echo \<\/table\>
echo \<\/div\>
