function wtj() {
  TARGET="${1}"
  CURRENTBRANCH=$(git branch | awk '/\*/ {print $2}')

  # If we don't have to jump.
  if [ "$TARGET" = "$CURRENTBRANCH" ]
  then
    return
  fi

  # Get the current path
  SRCPREFIX=$(git worktree list | awk "/\[$CURRENTBRANCH\]/ { print \$1}")
  PATHINTREE=$(pwd | sed "s#^$SRCPREFIX##")

  # Get the target path
  TARGETPATH=$(git worktree list | awk "/\[$TARGET\]/ { print \$1}")

  # jump to the target path.

  if [ -d "${TARGETPATH}/${PATHINTREE}" ]
  then
    cd "${TARGETPATH}/${PATHINTREE}" || exit 1
  else
    echo "${TARGETPATH}/${PATHINTREE} does not exists"
  fi

}

