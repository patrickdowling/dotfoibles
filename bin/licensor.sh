#!/usr/bin/env bash
#set -e

function fatal() { echo "ERROR $*"; exit 1; }
function verbose() { [ "$VERBOSE" = "yes" ] && echo "$@"; }

DRYRUN=no
DATE=
ARGS=()

while [[ $# -gt 0 ]] ; do
	case $1 in
		-a|--author)
			AUTHOR="$2"
			shift 2
			;;
		--date)
			DATE="$2"
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
		-*)
			fatal "Unknown option '$1'"
			;;
		*)
			ARGS+=("$1")
			shift
			;;
	esac
done

[ -n "$AUTHOR" ] || fatal "missing author"
[ -n "$PROJECT" ] || fatal "missing project"
[ -e "$LICENSE" ] || fatal "missing or invalid license $LICENSE"
if [ -z "$DATE" ] ; then
	DATE="$(date +"%Y")"
fi

verbose "PROJECT='$PROJECT'"
verbose "COPYRIGHT='// Copyright (C) $DATE $AUTHOR'"

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


	if (head -n 10 "$filename" | grep -Eq 'Copyright') ; then
		SKIPPED+=("$filename")
		return
	fi

	if [ "$DRYRUN" = "no" ] ; then
		local mod="$filename.tmp"
		{
		echo "// $PROJECT"
		echo "//"
		echo "// Copyright (C) $DATE $AUTHOR"
		cat "$LICENSE"
		cat "$filename"
		} > "$mod"
		mv "$mod" "$filename"
	fi
	MODIFIED+=("$filename")
}

readarray -t files < <(git ls-files "${ARGS[@]}")

for f in "${files[@]}"; do
	check_file "$f"
done

for f in "${SKIPPED[@]}"; do
	echo "SKIPPED $f"
done

for f in "${IGNORED[@]}"; do
	echo "IGNORED $f"
done

for f in "${MODIFIED[@]}"; do
	echo "MODIFIED $f"
done

echo "${#files[@]} files, ${#SKIPPED[@]} skipped, ${#IGNORED[@]} ignored, ${#MODIFIED[@]} modified (dryrun=$DRYRUN)"

# vim: set ts=4 sw=4 tw=0 noet :
