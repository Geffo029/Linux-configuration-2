#echo "{text: \"text\", \"alt\": \"alt\", \"tooltip\": \"tooltip\", \"class\": \"class\"}"
#date

curr_profile=$(power-options.sh curr-profile) 

case curr_profile in
	"low-power")
		percentage=0	
		;;
	"balanced")
		percentage=50	
		;;
	"performance")
		percentage=100	
		;;
	*)
		percentage=0
		;;
esac



text=""
tooltip=$(echo -e "•POWER OPTIONS\nScaling governor: $(power-options.sh curr-governor)\nEPP: $(power-options.sh curr-epp)\nLenovo power profile: $curr_profile")

# Costruisci l'oggetto JSON e passalo a jq per l'output compatto
jq -n -R --unbuffered --compact-output \
  --arg text "$text" \
  --arg tooltip "$tooltip" \
  --argjson percentage "$percentage" \
  '{text: $text, tooltip: $tooltip, percentage: $percentage}'
