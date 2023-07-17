postdate=$(date "+%Y-%m-%d")

# Go to the posts directory and open the file that begins with the current date
cd ~/Brandon-Lu737.github.io/_posts 

# Add a new line at the bottom of the file
# Set current_time rounded to the nearest 5 minutes
current_time=$(date "+%H:%M")
read -p "What would you like to write as of $current_time: " write_string;

for file in $postdate*.markdown
do
    if [ -f "$file" ]; then   # Makes sure it's a file, not a directory
        echo "$current_time $write_string" >> "$file"
    fi
done