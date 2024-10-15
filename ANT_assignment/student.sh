#! /bin/bash

student_info() {
	echo " "
	echo "*************** Fill in your information.***************"
	echo " "
	read -p "Enter your name: " name
	read -p "Enter your first_name: " first_name
	read -p "Enter your last_name: " last_name
	# F = female, M = male
	gender=""
	while true; do
		read -p "Enter your gender(F/M): " gender
		if [[ "$gender" == 'M' || "$gender" == 'm' ]]; then
			#m=echo "Gender: Male"
			break
		elif [[ "$gender" == "F" || "$gender" == "f" ]]; then
			#f=echo "Gender: Female"
			break
		else
			echo "?????????? Try again! Please enter 'F' or 'M'! ??????????"
			student_info
		fi
	done
}

subjects=("Math" "Chemistry" "Biology" "History" "English")

student_score() {
    total_score=0
    for subject in "${subjects[@]}"; do 
        while true; do
            read -p "Enter score for $subject (0-100): " score 
            if [[ "$score" -ge 0 && "$score" -le 100 ]]; then
                total_score=$((total_score + score))
                break
            else
				echo " "
                echo "Please enter your score between 0 and 100. Thank you!"
                echo " "
            fi
        done
    done
    average_score=$(echo "scale=2; $total_score / 5" | bc)
}

give_feedback() {
	read -p "Any feedback? (Y/N):" response
	if [[ "$response" == "Y" || "$response"  == "y" ]]; then
		read -p "Please provide your feedback to school: " feedback
		echo "Thank you for your feedback!"
	elif [[ "$response"  == "N" || "$response" == "n" ]]; then
		echo "Thank you for participating!"
	else
		echo "Please answer Y or N!"
		give_feedback
	fi
}

student_input() {
	echo " "
	echo "*************** Student Information Summary. ***************"
	echo " "
	echo "Name: $name"
	echo "Gender: $gender"
	echo "Total socre of 5 subjects: $total_score"
	echo "Average score of 5 subjects: $average_score"
	echo "Student Feedback: $feedback" 
} > student_info.txt

main() {
	student_info
	student_score
	give_feedback
	student_input
}
main
