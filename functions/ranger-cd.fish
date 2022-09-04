# ranger-cd.fish
# author: Seong Yong-ju <sei40kr@gmail.com>

set -ug RANGER_PATH '/opt/homebrew/bin/ranger'

function ranger-cd -w 'ranger' -d 'Automatically change the directory in fish after closing ranger'
    set -l tempfile (mktemp -t tmp.XXXXXX)

    $RANGER_PATH --choosedir=$tempfile $argv

    if [ -f $tempfile ]
        cd (cat $tempfile)
    end
    rm -f $tempfile
end
