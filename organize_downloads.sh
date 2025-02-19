#!/bin/bash

# Define directories
DOWNLOAD_DIR="$HOME/Downloads"
IMAGE_DIR="$HOME/Pictures"
DOCUMENT_DIR="$HOME/Documents"
MUSIC_DIR="$HOME/Music"
VIDEO_DIR="$HOME/Videos"
ARCHIVE_DIR="$HOME/Archives"
OTHER_DIR="$HOME/Other"

# Create directories if they don't exist
mkdir -p "$IMAGE_DIR" "$DOCUMENT_DIR" "$MUSIC_DIR" "$VIDEO_DIR" "$ARCHIVE_DIR" "$OTHER_DIR"

# Log file
LOG_FILE="$HOME/organize_downloads.log"

# Monitor the Downloads directory
inotifywait -m -e moved_to -e create --format '%f' "$DOWNLOAD_DIR" | while read FILE
do
    # Ignore temporary Chrome files
    if [[ "$FILE" == *.crdownload || "$FILE" == .com.google.Chrome.* ]]; then
        continue
    fi

    # Get the file extension
    EXTENSION="${FILE##*.}"

    # Move files based on their extension
    case "$EXTENSION" in
        jpg|jpeg|png|gif|bmp|tiff|webp|svg)
            mv "$DOWNLOAD_DIR/$FILE" "$IMAGE_DIR/"
            echo "$(date) - Moved $FILE to $IMAGE_DIR/" >> "$LOG_FILE"
            ;;
        pdf|doc|docx|xls|xlsx|ppt|pptx|txt|odt|ods|odp|rtf)
            mv "$DOWNLOAD_DIR/$FILE" "$DOCUMENT_DIR/"
            echo "$(date) - Moved $FILE to $DOCUMENT_DIR/" >> "$LOG_FILE"
            ;;
        mp3|wav|flac|aac|ogg|m4a)
            mv "$DOWNLOAD_DIR/$FILE" "$MUSIC_DIR/"
            echo "$(date) - Moved $FILE to $MUSIC_DIR/" >> "$LOG_FILE"
            ;;
        mp4|avi|mkv|mov|flv|wmv|m4v|webm)
            mv "$DOWNLOAD_DIR/$FILE" "$VIDEO_DIR/"
            echo "$(date) - Moved $FILE to $VIDEO_DIR/" >> "$LOG_FILE"
            ;;
        zip|tar|gz|bz2|7z|rar)
            mv "$DOWNLOAD_DIR/$FILE" "$ARCHIVE_DIR/"
            echo "$(date) - Moved $FILE to $ARCHIVE_DIR/" >> "$LOG_FILE"
            ;;
        *)
            mv "$DOWNLOAD_DIR/$FILE" "$OTHER_DIR/"
            echo "$(date) - Moved $FILE to $OTHER_DIR/" >> "$LOG_FILE"
            ;;
    esac
done

