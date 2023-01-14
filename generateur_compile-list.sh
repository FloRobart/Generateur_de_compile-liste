#-------------------------------------------------------------------------------#
# Liste les fichiers pour chaque dossiers et sous dossier du dossiers d'origine #
#-------------------------------------------------------------------------------#
listerDossiers()
{
    for i in `ls $source`
    do
        if [ -f $i ]
        then
            ListerFichiers
        fi

        if [ -d $i ]
        then
            source=$source"/"$i
            listerDossiers
        fi
    done
}



#-----------------------------------------------------------#
# Liste les fichiers pour le dossiersen cours nommer source #
#-----------------------------------------------------------#
ListerFichiers()
{
    for i in `ls $source`
    do
        if [ -f $i ]
        then
            extension=${i##*.}
            if [ "$extension" == "$extensionValide" ]
            then
                echo $source"/"$i >> $nomFichierSortie
            fi
        fi
    done

    if [ "$extension" == "$extensionValide" ]
    then
        echo -e "\n" >> $nomFichierSortie
    fi
}



#------#
# Main #
#------#
nomFichierChoixDossier=choixDossier.vbs

if [ $# -gt 0 ]
then
    source="$1"
    extensionValide="txt"
    nomFichierSortie="./compile.list"

    # Suppression du fichier de choix de dossier si il existe #
    if [ -f "$nomFichierChoixDossier" ]
    then
        rm -fr "$nomFichierChoixDossier"
    fi

    echo ""> ./compile.list

    listerDossiers
    ListerFichiers
else
    
    # Demander à l'utilisateur de choisir un dossier #
    # commande read
    read -p "Veuillez entrez le dossier racine à partir du quel la compile.list vas être générer : " dossier
    echo dossier = $dossier
    #echo nomFichierChoixDossier
    #echo dossier = inputbox ^("Veuillez entrez le dossier racine à partir du quel la compile.list vas être générer"^, "Séléctionner un dossier"^) > $nomFichierChoixDossier
    #echo prog = "generateur_compile-list.bat """ ^& dossier ^& """" >> $nomFichierChoixDossier
    #echo WScript.CreateObject ^("Wscript.shell"^).Run^(prog^), ^0 >> $nomFichierChoixDossier

    #start $nomFichierChoixDossier
fi