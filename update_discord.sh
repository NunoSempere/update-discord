function update_discord(){
  verbose=1

  mkdir -p "$HOME/Downloads/update-discord"
  cd "$HOME/Downloads/update-discord"
  curl -L -I "https://discord.com/api/download/stable?platform=linux&format=deb" -o discord.head

  uri_old="$(cat discord.head.old | grep location | sed 's/location: //' )"
  uri_new="$(cat discord.head | grep location | sed 's/location: //')"

  if [ "$verbose" == 1 ]; then echo "uri_old: $uri_old"; fi
  if [ "$verbose" == 1 ]; then echo "uri_new: $uri_new"; fi

  if [ "$uri_old" != "$uri_new" ]; then
    cp "discord.head" "discord.head.old"

    if [ "$verbose" == 1 ]; then echo "Downloading discord.deb"; fi
    curl -L "https://discord.com/api/download/stable?platform=linux&format=deb" -o discord.deb

    if [ "$verbose" == 1 ]; then echo "Updating discord.deb"; fi
    sudo apt install ./discord.deb
  fi

}

update_discord
