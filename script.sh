#making directories and files
cd /
sudo mkdir spider
cd spider
sudo mkdir announcements
sudo mkdir domains
cd announcements
sudo touch welcome.txt
cd ..
cd domains
sudo mkdir webdev
sudo mkdir devops
cd devops
sudo mkdir tasks
sudo mkdir grades
sudo mkdir announcements
sudo touch inductees.txt
sudo touch ./grades/task1-grades.txt
sudo touch ./announcements/welcome.txt
cd tasks
sudo mkdir submissions
sudo touch task1-ps.pdf
sudo touch ./submissions/mentee1.pdf
cd ..
cd ..
cd ..



#creating new users
for i in {1..2}
do
    sudo adduser mentor$i
done


for i in {1..15}
do
    sudo adduser mentee$i
done


#creating domain-specific groups
sudo addgroup devops
sudo addgroup webdev

#creating user_type-specific groups
sudo addgroup mentor
sudo addgroup mentee
#sudo addgroup root




#adding users to corresponding groups
for i in {1..2}
do
    sudo usermod -G devops mentor$i
    sudo usermod -G webdev mentor$i
done

for i in {1..5}
do
    sudo usermod -G devops mentee$i
done

for i in {11..15}
do
    sudo usermod -G devops mentee$i
done

for i in {5..15}
do
    sudo usermod -G webdev mentee$i
done


for i in {1..2}
do
    sudo usermod -G mentor mentor$i
done

for i in {1..15}
do
    sudo usermod -G mentee mentee$i
done

#file and directory permissions
sudo chmod u=rwx,g=rwx,o=rx announcements
cd announcements
sudo chmod u=rwx,g=rwx,o=rx welcome.txt
cd ..

sudo chmod u=rwx,g=rwx,o=rx domains
cd domains

sudo chmod u=rwx,g=rwx,o= devops
sudo chmod u=rwx,g=rwx,o= webdev

cd devops
sudo chgrp mentor grades
sudo chmod u=rx,g=rwx,o= grades
sudo chmod u=rwx,g=rx,o= announcements
sudo chmod u=rwx,g=rx,o= inductees.txt

cd tasks

sudo chmod u=rwx,g=rx,o= task1-ps.pdf
sudo chgrp mentee submissions
sudo chmod u=rx,g=rwx,o=rx submissions
cd ..


# putting dummy data in grades
cd grades
sudo echo mentee1 "$[$[$RANDOM%10]*10]" > task1-grades.txt
for i in {2..5}
do
    sudo echo mentee$i "$[$[$RANDOM%10]*10]" >> task1-grades.txt
done

for i in {11..15}
do
    sudo echo mentee$i "$[$[$RANDOM%10]*10]" >> task1-grades.txt
done



echo "list of students whos score is greater than 60"
sudo awk '$2 > 60' task1-grades.txt