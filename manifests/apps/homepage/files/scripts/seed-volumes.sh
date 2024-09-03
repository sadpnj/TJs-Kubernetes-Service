#!/bin/sh

REPO=zimmertr/Kubernetes-Manifests
BRANCH=main

timestamp(){
  echo
  echo "****************************************"
  echo $(date +"%m/%d/%Y-%H:%M:%S") " - Seeding $1"
  echo "****************************************"
}

seed_configs(){
  timestamp "Configs"

  mkdir -p /app/config/
  cp --verbose /config/bookmarks.yaml /app/config/bookmarks.yaml
  cp --verbose /config/kubernetes.yaml /app/config/kubernetes.yaml
  cp --verbose /config/services.yaml /app/config/services.yaml
  cp --verbose /config/settings.yaml /app/config/settings.yaml
  cp --verbose /config/widgets.yaml /app/config/widgets.yaml
}

seed_icons(){
  timestamp "Icons"

  mkdir -p /app/public/icons
  wget -O /app/public/icons/nextcloud.png https://github.com/sadpnj/homelab/blob/main/manifests/apps/homepage/files/icons/nextcloud.png?raw=true
}

seed_images(){
  timestamp "Images"

  mkdir -p /app/public/images
  wget -O /app/public/images/background.jpg https://raw.githubusercontent.com/$REPO/$BRANCH/misc/homepage/files/images/background.jpg
  wget -O /app/public/images/favicon.png https://raw.githubusercontent.com/$REPO/$BRANCH/misc/homepage/files/images/favicon.png
}

main(){
  seed_configs
  seed_icons
  seed_images

  timestamp "Completed"
}

main "$@"
