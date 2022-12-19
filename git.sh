#!/bin/bash

message=""
case $1 in

  # 🎨: art
  art)
    message="Improve structure / format of the code"
    emoji="🎨"
    ;;

  # ⚡️: zap
  zap)
    message="Improve performance"
    emoji="⚡"
    ;;

  # 🔥: fire
  fire|remove)
    message="Remove code or files"
    emoji="🔥"
    ;;

  # 🐛: bug
  bug|fix)
    message="Fix a bug"
    emoji="🐛"
    ;;

  # 🚑️: ambulance
  ambulance)
    message="Critical hotfix"
    emoji="🚑️"
    ;;

  # ✨: sparkles
  sparkles)
    message="Introduce new features"
    emoji="✨"
    ;;

  # 📝: memo
  memo|doc|documentation)
    message="Add or update documentation"
    emoji="📝"
    ;;

  # 🌸: cherry_blossom
  gardening|garden|clean|cleaning)
    message="Gardening"
    emoji="🌸"
    ;;


  # 🚀: rocket
  rocket)
    message="Deploy stuff"
    emoji="🚀"
    ;;

  # 💄: lipstick
  lipstick)
    message="Add or update the UI and style files"
    emoji="💄"
    ;;

  # 🎉: tada
  tada)
    message="Begin a project"
    emoji="🎉"
    ;;

  # ✅: white-check-mark
  white_check_mark)
    message="Add, update, or pass tests"
    emoji="✅"
    ;;

  # 🔒️: lock
  lock)
    message="Fix security issues"
    emoji="🔒️"
    ;;

  # 🔐: closed-lock-with-key
  closed_lock_with_key)
    message="Add or update secrets"
    emoji="🔐"
    ;;

  # 🔖: bookmark
  bookmark|release)
    message="Release / Version tags"
    emoji="🔖"
    ;;

  # 🚨: rotating-light
  rotating_light)
    message="Fix compiler / linter warnings"
    emoji="🚨"
    ;;

  # 🚧: construction
  construction)
    message="Work in progress"
    emoji="🚧"
    ;;

  # 💚: green-heart
  green_heart)
    message="Fix CI Build"
    emoji="💚"
    ;;

  # ⬇️: arrow-down
  arrow_down)
    message="Downgrade dependencies"
    emoji="⬇"
    ;;

  # ⬆️: arrow-up
  arrow_up)
    message="Upgrade dependencies"
    emoji="⬆"
    ;;

  # 📌: pushpin
  pushpin)
    message="Pin dependencies to specific versions"
    emoji="📌"
    ;;

  # 👷: construction-worker
  construction_worker)
    message="Add or update CI build system"
    emoji="👷"
    ;;

  # 📈: chart-with-upwards-trend
  chart_with_upwards_trend)
    message="Add or update analytics or track code"
    emoji="📈"
    ;;

  # ♻️: recycle
  recycle)
    message="Refactor code"
    emoji="♻"
    ;;

  # ➕: heavy-plus-sign
  heavy_plus_sign)
    message="Add a dependency"
    emoji="➕"
    ;;

  # ➖: heavy-minus-sign
  heavy_minus_sign)
    message="Remove a dependency"
    emoji="➖"
    ;;

  # 🔧: wrench
  wrench|config)
    message="Add or update configuration files"
    emoji="🔧"
    ;;

  # 🔨: hammer
  hammer)
    message="Add or update development scripts"
    emoji="🔨"
    ;;

  # 🌐: globe-with-meridians
  globe_with_meridians)
    message="Internationalization and localization"
    emoji="🌐"
    ;;

  # ✏️: pencil2
  pencil2)
    message="Fix typos"
    emoji="✏"
    ;;

  # 💩: poop
  poop)
    message="Write bad code that needs to be improved"
    emoji="💩"
    ;;

  # ⏪️: rewind
  rewind)
    message="Revert changes"
    emoji="⏪"
    ;;

  # 🔀: twisted-rightwards-arrows
  twisted_rightwards_arrows)
    message="Merge branches"
    emoji="🔀"
    ;;

  # 📦️: package
  package)
    message="Add or update compiled files or packages"
    emoji="📦️"
    ;;

  # 👽️: alien
  alien|api)
    message="Update code due to external API changes"
    emoji="👽️"
    ;;

  # 🚚: truck
  truck)
    message="Move or rename resources (e.g.: files, paths, routes)"
    emoji="🚚"
    ;;

  # 📄: page-facing-up
  page_facing_up)
    message="Add or update license"
    emoji="📄"
    ;;

  # 💥: boom
  boom)
    message="Introduce breaking changes"
    emoji="💥"
    ;;

  # 🍱: bento
  bento)
    message="Add or update assets"
    emoji="🍱"
    ;;

  # ♿️: wheelchair
  wheelchair)
    message="Improve accessibility"
    emoji="♿"
    ;;

  # 💡: bulb
  bulb)
    message="Add or update comments in source code"
    emoji="💡"
    ;;

  # 🍻: beers
  beers)
    message="Write code drunkenly"
    emoji="🍻"
    ;;

  # 💬: speech-balloon
  speech_balloon|update-text)
    message="Add or update text and literals"
    emoji="💬"
    ;;

  # 🗃️: card-file-box
  card_file_box)
    message="Perform database related changes"
    emoji="🗃️"
    ;;

  # 🔊: loud-sound
  loud_sound)
    message="Add or update logs"
    emoji="🔊️"
    ;;

  # 🔇: mute
  mute)
    message="Remove logs"
    emoji="🔇"
    ;;

  # 👥: busts-in-silhouette
  busts_in_silhouette)
    message="Add or update contributor(s)"
    emoji="👥"
    ;;

  # 🚸: children-crossing
  children_crossing)
    message="Improve user experience / usability"
    emoji="🚸"
    ;;

  # 🏗️: building-construction
  building_construction)
    message="Make architectural changes"
    emoji="🏗️"
    ;;

  # 📱: iphone
  iphone)
    message="Work on responsive design"
    emoji="📱"
    ;;

  # 🤡: clown-face
  clown_face)
    message="Mock things"
    emoji="🤡"
    ;;

  # 🥚: egg
  egg)
    message="Add or update an easter egg"
    emoji="🥚"
    ;;

  # 🙈: see-no-evil
  see_no_evil)
    message="Add or update a .gitignore file"
    emoji="🙈"
    ;;

  # 📸: camera-flash
  camera_flash)
    message="Add or update snapshots"
    emoji="📸"
    ;;

  # ⚗️: alembic
  alembic|experiments|experiment|xp)
    message="Perform experiments"
    emoji="⚗"
    ;;

  # 🔍️: mag
  mag)
    message="Improve SEO"
    emoji="🔍️"
    ;;

  # 🏷️: label
  label)
    message="Add or update types"
    emoji="🏷️"
    ;;

  # 🌱: seedling
  seedling)
    message="Add or update seed files"
    emoji="🌱"
    ;;

  # 🚩: triangular-flag-on-post
  triangular_flag_on_post)
    message="Add, update, or remove feature flags"
    emoji="🚩"
    ;;

  # 🥅: goal-net
  goal_net)
    message="Catch errors"
    emoji="🥅"
    ;;

  # 💫: animation
  dizzy)
    message="Add or update animations and transitions"
    emoji="💫"
    ;;

  # 🗑️: wastebasket
  wastebasket)
    message="Deprecate code that needs to be cleaned up"
    emoji="🗑️"
    ;;

  # 🛂: passport-control
  passport_control)
    message="Work on code related to authorization, roles and permissions"
    emoji="🛂"
    ;;

  # 🩹: adhesive-bandage
  adhesive_bandage)
    message="Simple fix for a non-critical issue"
    emoji="🩹"
    ;;

  # 🧐: monocle-face
  monocle_face)
    message="Data exploration/inspection"
    emoji="🧐"
    ;;

  # ⚰️: coffin
  coffin)
    message="Remove dead code"
    emoji="⚰"
    ;;

  # 🧪: test-tube
  test_tube)
    message="Add a failing test"
    emoji="🧪"
    ;;

  # 👔: necktie
  necktie)
    message="Add or update business logic $2"
    emoji="👔"
    ;;

  # 🩺: stethoscope
  stethoscope)
    message="Add or update healthcheck"
    emoji="🩺"
    ;;

  # 🧱: bricks
  bricks)
    message="Infrastructure related changes"
    emoji="🧱"
    ;;

  # 🧑‍💻: technologist
  technologist)
    message="Improve developer experience"
    emoji="🧑‍💻"
    ;;

  # 💸: money-with-wings
  money_with_wings)
    message="Add sponsorships or money related infrastructure"
    emoji="💸"
    ;;

  # 🧵: thread
  thread)
    message="Add or update code related to multithreading or concurrency"
    emoji="🧵"
    ;;

  # 🦺: safety-vest
  safety_vest)
    message="Add or update code related to validation"
    emoji="🦺"
    ;;

  *)
  message="updated"
  ;;

esac

if [ -z "$2" ]
then
    # empty
    git add .; git commit -m "$emoji $message."; git push
else
    # not empty
    git add .; git commit -m "$emoji $message: $2"; git push
fi

