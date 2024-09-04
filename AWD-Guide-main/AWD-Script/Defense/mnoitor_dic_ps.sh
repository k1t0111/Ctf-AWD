#!/bin/bash 
# save content

touch /tmp/mnoitor.txt
initial_files_html=$(find /var/www/html -type f| sort -n) 
initial_files=$(find /tmp -type f| sort -n) 
Inital_content=$(ps -ef| tr -d " "| grep -Ev "ps|tr|sort|grep"| sort -n)
while true; do
	Current_content=$(ps -ef| tr -d " "|grep -Ev "ps|tr|sort|grep"| sort -n)
	current_files=$(find /tmp -type f |sort -n) 
	current_files_html=$(find /var/www/html -type f |sort -n) 
	Add=$(comm -13 <(echo "$Inital_content") <(echo "$Current_content"))
	Del=$(comm -23 <(echo "$Inital_content") <(echo "$Current_content"))
	added_files=$(comm -13 <(echo "$initial_files") <(echo "$current_files")) 
        deleted_files=$(comm -23 <(echo "$initial_files") <(echo "$current_files")) 
	Added_files=$(comm -13 <(echo "$initial_files") <(echo "$current_files_html")) 
        Deleted_files=$(comm -23 <(echo "$initial_files") <(echo "$current_files_html")) 
	for con1 in $Add ;do
		echo "ps add ps $con1" >> /tmp/mnoitor.txt
	done
	for con2 in $Del; do
		echo "ps del ps $con2" >> /tmp/mnoitor.txt
	done
	for file1 in $added_files; do
       		echo "/tmp File added: $file1"  >>/tmp/mnoitor.txt
        done 
        for file2 in $deleted_files; do
        	echo "/tmp File deleted: $file2" >>/tmp/mnoitor.txt
        done
	for file3 in $Added_files; do
       		echo "html File added: $file3"  >> /tmp/mnoitor.txt
        done 
        for file4 in $Deleted_files; do
        	echo "html File deleted: $file4" >> /tmp/mnoitor.txt
        done
	Inital_content=$Current_content
	initial_files=$current_files
	initial_files_html=$current_files_html
sleep 5
done
