#!/bin/bash
# This program implements a very basic cipher to encrypt/decrypt your files.
# You can also use this program to decrypt and run a file in one step.
# This is not a production-level cipher.

echo ------------------------------------------------
echo 'Hello, welcome to the file encryptor/decryptor.'
echo ------------------------------------------------
echo 'Please be sure to include the file you want encrypted/decrypted'
echo 'in the same folder as this Bash file.'
echo 'Please select an option below...'
#greet the user and ask what they want to do.
options=( Encrypt Decrypt Run About Quit )
select opt in "${options[@]}"; do
  #listen for user's selection.
  if [ "$opt" = "Quit" ]; then
    echo Goodbye.
    exit
    #program has been exited.
  elif [ $opt = "Decrypt" ]; then
    #switch to Decoding options.
    echo ---------------------------------------------------------------------------------
    echo This script allows you decode a .txt file that was created with the Caesar cipher.
    echo ---------------------------------------------------------------------------------
    echo This simple \"monoalphabetic substition cipher\" provides almost no security,
    echo because an attacker who has the encoded message can either use frequency
    echo  analysis to guess the key, or just try all 25 keys.
    echo To begin, please enter the number you used to encrypt the file.
    #for this to be valid, the number must be between 1-25.
    read -p 'Key # (Between 1-25): ' key
    prompt=("Please select a file to decrypt: ")
    #display files in directory as options.
    options=( $(find -maxdepth 1 -print0 | xargs -0) )
    echo ---------------------------------------
    echo $prompt
    echo ---------------------------------------
    select opt in "${options[@]}" "Quit"; do
      if ((REPLY == 1 + ${#options[@]} )) ; then
        #if the user chooses quit, then exit.
        echo Goodbye.
        exit
      elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
        #user has chosen valid file for decryption.
        export alpha=$(echo {a..z} | sed -r 's/ //g')
        export cipher=$(echo $alpha | sed -r "s/^.{$key}//g")$(echo $alpha | sed -r "s/.{$( expr 26 - $key )}$//g")
        #first delete characters characters defined by key. i.e. 5 = fghijkl...
        #second delete all characters after the number ie. 5 = abcde;
        #check to see if ./encrypted file folder exists.
        if [ ! -d ./encrypted/ ]; then
          #doesn't exist, make directory.
          mkdir  ./encrypted/;
        fi
        #Run txt contents through cipher, export to ./encrypted/$opt
        tr  '[A-Z]' $alpha < $opt  | tr $alpha $cipher  >> ./decrypted/$opt;
        echo File $opt decrypted and sent to /decrypted folder.
    else
    #user has selected a bad option / not chosen a number.
    echo "invalid selection."
  fi
done
elif [ $opt = "Run" ]; then
  #switch to Decoding options.
  echo -------------------------
  echo Decrypt and Run A Script
  echo -------------------------
  echo This tool allows you to decrypt and then run a script in two steps.
  echo To begin, please enter the number you used to encrypt the file.
  read -p 'Key # (Between 1-25): ' key
  #recieve key value from user.
  prompt=("Please select a file to decrypt: ")
#display files in directory as options.
  options=( $(find -maxdepth 1 -print0 | xargs -0) )
  echo ---------------------------------------
  echo $prompt
  echo ---------------------------------------
  select opt in "${options[@]}" "Quit"; do
    if ((REPLY == 1 + ${#options[@]} )) ; then
      #if the user chooses quit, then exit.
      echo Goodbye.
      exit
    elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
      #user has chosen valid file for decryption.
      export alpha=$(echo {a..z} | sed -r 's/ //g')
      export cipher=$(echo $alpha | sed -r "s/^.{$key}//g")$(echo $alpha | sed -r "s/.{$( expr 26 - $key )}$//g")
      #first delete characters characters defined by key. i.e. 5 = fghijkl...
      #second delete all characters after the number ie. 5 = abcde;
      #check to see if ./encrypted file folder exists.
      if [ ! -d ./encrypted/ ]; then
        #doesn't exist, make directory.
        mkdir  ./encrypted/;
      fi
      #Run txt contents through cipher, export to ./encrypted/$opt
      tr  '[A-Z]' $alpha < $opt  | tr $alpha $cipher  >> ./decrypted/$opt;
      echo File $opt decrypted and sent to /decrypted folder.
      echo running script...
      sh ./decrypted/$opt
  else
  #user has selected a bad option / not chosen a number.
  echo "invalid selection."
fi
done
elif [ $opt = "About" ]; then
  #explain program
    echo ------------------------------------------------------------------------------------
    echo This tool allows you to encode your txt files by implementing a simple Caesar cipher.
    echo ------------------------------------------------------------------------------------
    echo This was created by Henry Kobin as a code sample.
    echo Please choose another option.
    sh ./test.sh

elif [ $opt  = "Encrypt" ]; then
    #switch to Encoding options.
    echo ----------------------------------------------------
    echo This script allows you to implement a Caesar cipher.
    echo ----------------------------------------------------
    echo This simple \"monoalphabetic substition cipher\" provides almost no security,
    echo because an attacker who has the encoded message can either use frequency
    echo analysis to guess the key, or just try all 25 keys.
    echo To begin, please select a key \# between 1-25.
    #for this to be valid, the number must be between 1-25.
    read -p 'Key # (Between 1-25): ' key
    prompt=("Please select a file to encrypt: ")
    #display files in directory as options.
    options=( $(find -maxdepth 1 -print0 | xargs -0) )
    echo ---------------------------------------
    echo $prompt
    echo ---------------------------------------
    select opt in "${options[@]}" "Quit"; do
      if ((REPLY == 1 + ${#options[@]} )) ; then
        #user has selected to exit program.
        echo Goodbye.
        exit
      elif (( REPLY > 0 && REPLY <= ${#options[@]} )) ; then
        #user has chosen valid file for encryption.
        export alpha=$(echo {a..z} | sed -r 's/ //g')
        export cipher=$(echo $alpha | sed -r "s/^.{$key}//g")$(echo $alpha | sed -r "s/.{$( expr 26 - $key )}$//g")
        #first delete characters characters defined by key. i.e. 5 = fghijkl...
        #second delete all characters after the number ie. 5 = abcde;
        #check to see if ./encrypted file folder exists.
        if [ ! -d ./encrypted/ ]; then
          #doesn't exist, make directory.
          mkdir  ./encrypted/;
        fi
        #Run txt contents through cipher, export to ./encrypted/$opt
        tr  '[A-Z]' $alpha < $opt  | tr $cipher $alpha >> ./encrypted/$opt;
        echo File $opt encrypted and sent to /encrypted folder.

      else
        #user has selected a bad option / not chosen a number.
        echo "Invalid selection."
      fi
    done
  else
    #user has selected a bad option / not chosen a number.
    echo "invalid selection."
  fi
done
else
  exit
fi
done
