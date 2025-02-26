# this original one uses values returned from 'brew info'
brew list --formula | xargs -n1 -P8 -I {} \
    sh -c "brew info {} | egrep '[0-9]* files, ' | sed 's/^.*[0-9]* files, \(.*\)).*$/{} \1/'" | \
    sort -h -r -k2 - | column -t

# faster alternative using 'du'
du -sch $(brew --cellar)/*/* | sed "s|$(brew --cellar)/\([^/]*\)/.*|\1|" | sort -k1h