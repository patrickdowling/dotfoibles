#!/usr/bin/env bash
#set -e

function fatal() { echo "ERROR $@"; exit 1; }
function verbose() { [ "$VERBOSE" = "yes" ] && echo "$@"; }

DRYRUN=no

while [[ $# -gt 0 ]] ; do
	case $1 in
		-a|--author)
			AUTHOR="$2"
			shift 2
			;;

		--dry-run)
			DRYRUN=yes
			shift
			;;
		-l|--license)
			LICENSE="$2"
			shift 2
			;;
		-p|--project)
			PROJECT="$2"
			shift 2
			;;
		-v|--verbose)
			VERBOSE=yes
			shift
			;;
		*)
			fatal "Unknown option '$1'"
			;;
	esac
done

[ -n "$AUTHOR" ] || fatal "missing author"
[ -n "$PROJECT" ] || fatal "missing project"
[ -e "$LICENSE" ] || fatal "missing or invalid license $LICENSE"

SKIPPED=()
IGNORED=()
MODIFIED=()


function check_file() {
	local filename=$1
	[ ! -d "$filename" ] || return

	case "$f" in
		*.h | *.cpp | *.cc)
			;;
		*)
			IGNORED+=("$filename")
			return
	esac


	if (cat "$filename" | head -n 10 | grep -Eq 'Copyright') ; then
		SKIPPED+=("$filename")
		return
	fi

	if [ "$DRYRUN" = "no" ] ; then
		local mod="$filename.tmp"
		echo "// $PROJECT" > "$mod"
		echo "// Copyright (C) $(date +"%Y") $AUTHOR" >> "$mod"
		cat "$LICENSE" >> "$mod"
		cat "$filename" >> "$mod"
		mv "$mod" "$filename"
	fi
	MODIFIED+=("$filename")
}

readarray -t files < <(git ls-files $@)

for f in ${files[*]}; do
	check_file "$f"
done

for f in ${SKIPPED[*]}; do
	echo "SKIPPED $f"
done

for f in ${IGNORED[*]}; do
	echo "IGNORED $f"
done

for f in ${MODIFIED[*]}; do
	echo "MODIFIED $f"
done

echo "${#SKIPPED[@]} skipped, ${#IGNORED[@]} ignored, ${#MODIFIED[@]} modified (dryrun=$DRYRUN)"




