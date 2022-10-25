function restore -d 'Restore backed up files'
  argparse 'h/help' 'e/extension=?' -- $argv; or return
  if set -ql _flag_help
    echo 'restore [-h] [-e extension] file_name ...'
  end
  if set -ql _flag_extension
    set extension "$_flag_extension"
  else
    set extension bak
  end
  for file in $argv
    mv -f -v "$file.$extension" $file
  end
end
