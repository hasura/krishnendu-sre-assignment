#!/bin/bash 
usage() {                                 # Function: Print a help message.
  echo "Usage: $0 --key HASURA_TEST --value TEST_SECRET --service env-echo --existing fals
e" 1>&2 
}
exit_abnormal() {                         # Function: Exit with error.
  usage
  exit 1
}
function append_file()
{
echo "  $key: $b64_value" >> hasura-sec.yaml
}

while [ "$1" != "" ];
do
  case $1 in 
  -key|--key)
      shift
      key=`echo "$1"`
      ;;
  -value|--value)
      shift
      b64_value=`echo "$1"|base64`
      ;;
  -service|--service)
      shift
      service=`echo $1`
      ;;
  -existing|--existing)
     shift
     if [ "$1" = false ]
       then append_file
     else
       sed "s/$key:.*$/$key: $b64_value/g" hasura-sec.yaml
     fi
     ;;
  esac
 shift
done 
echo "$b64_key"
echo "$b64_value"
echo "$service"
#sed "s/username:.*$/username: $b64_value/g" hasura-sec.yaml
#openssl enc -in hasura-sec.yaml -aes-256-cbc -pass stdin > hasura-sec.yaml.enc
#openssl enc -in hasura-sec.yaml.enc -aes-256-cbc -pass stdin > hasura-sec.yaml
#cp hasura-sec.yaml.enc ./hasura-assignment
#cd hasura-assignment
#git add hasura-sec.yaml.enc
#git commit -m "encrypted secrets"
#git push origin master
#cd ..

