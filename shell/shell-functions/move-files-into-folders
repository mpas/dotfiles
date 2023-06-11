move-files-into-folders() {
    for i in *; do
        if [ ! -d $i ];
        then
            file=$(basename -- "$i");
            extension="${file##*.}";
            filename="${file%.*}";
            mkdir -p $filename;
            mv ${file%} ${filename%}/;
        fi
    done
}
