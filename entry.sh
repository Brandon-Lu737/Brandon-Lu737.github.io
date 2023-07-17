postdate=$(date "+%Y-%m-%d")
cd ~/Brandon-Lu737.github.io/_posts
current_time=$(date "+%H:%M")

# Define the default action as echo (write to file)
action="echo"

# Parse command line options
while getopts "o" opt; do
    case $opt in
    o)
        action="open" # If -o is provided, change action to open
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        exit 1
        ;;
    esac
done

# If the action is not "open", get the user's input
if [ "$action" != "open" ]; then
    read -p "What would you like to write as of $current_time: " write_string
fi

# Iterate over all files that match the pattern
for file in $postdate*.markdown; do
    if [ -f "$file" ]; then
        if [ "$action" = "open" ]; then
            # Open the file
            open "$file"
        else
            # Append the string to the file
            echo "$current_time $write_string" >>"$file"
        fi
    fi
done
