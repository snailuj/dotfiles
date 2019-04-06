# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

# Get me some ligatures (FiraCode)
fonts_dir="${HOME}/.local/share/fonts"
if [ ! -d "${fonts_dir}" ]; then
    echo "mkdir -p $fonts_dir"
        mkdir -p "${fonts_dir}"
        else
            echo "Found fonts dir $fonts_dir"
            fi

            for type in Bold Light Medium Regular Retina; do
                file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
                    file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
                        if [ ! -e "${file_path}" ]; then
                                echo "wget -O $file_path $file_url"
                                        wget -O "${file_path}" "${file_url}"
                                            else
                                            	echo "Found existing file $file_path"
                                            	    fi;
                                            	    done

                                            	    echo "fc-cache -f"
                                            	    fc-cache -f
