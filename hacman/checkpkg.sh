#!/bin/bash

# Usage: ./check_packages.sh packages.txt

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <package_list_file>"
    exit 1
fi

pkg_file="$1"

if [[ ! -f "$pkg_file" ]]; then
    echo "File not found: $pkg_file"
    exit 1
fi

while IFS= read -r pkg || [[ -n "$pkg" ]]; do
    # Skip empty lines
    [[ -z "$pkg" ]] && continue

    if pacman -Q "$pkg" &>/dev/null; then
        install_date=$(
            pacman -Qi "$pkg" |
                awk -F': *' '/Install Date/ {print $2}'
        )

        printf "%-30s %s\n" "$pkg" "$install_date"
    fi
done <"$pkg_file"
