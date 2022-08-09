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
cd ..


#creating new users
sudo adduser mentor1
sudo adduser mentor2

sudo adduser mentee1
sudo adduser mentee2
sudo adduser mentee3
sudo adduser mentee4
sudo adduser mentee5
sudo adduser mentee6
sudo adduser mentee7
sudo adduser mentee8
sudo adduser mentee9
sudo adduser mentee10
sudo adduser mentee11
sudo adduser mentee12
sudo adduser mentee13
sudo adduser mentee14
sudo adduser mentee15




#creating domain-specific groups
sudo addgroup devops
sudo addgroup webdev

#creating user_type-specific groups
sudo addgroup mentor
sudo addgroup mentee
sudo addgroup root


#adding users to corresponding groups
sudo usermod mentor1 -G devops
sudo usermod mentor1 -G webdev
sudo usermod mentor2 -G devops
sudo usermod mentor2 -G webdev

sudo usermod mentee1 -G devops
sudo usermod mentee2 -G devops
sudo usermod mentee3 -G devops
sudo usermod mentee4 -G devops
sudo usermod mentee5 -G devops
sudo usermod mentee6 -G webdev
sudo usermod mentee7 -G webdev
sudo usermod mentee8 -G webdev
sudo usermod mentee9 -G webdev
sudo usermod mentee10 -G webdev
sudo usermod mentee11 -G devops
sudo usermod mentee12 -G devops
sudo usermod mentee13 -G devops
sudo usermod mentee14 -G devops
sudo usermod mentee15 -G devops
sudo usermod mentee11 -G webdev
sudo usermod mentee12 -G webdev
sudo usermod mentee13 -G webdev
sudo usermod mentee14 -G webdev
sudo usermod mentee15 -G webdev


sudo usermod mentor1 -G mentor
sudo usermod mentor2 -G mentor

sudo usermod mentee1 -G mentee
sudo usermod mentee2 -G mentee
sudo usermod mentee3 -G mentee
sudo usermod mentee4 -G mentee
sudo usermod mentee5 -G mentee
sudo usermod mentee6 -G mentee
sudo usermod mentee7 -G mentee
sudo usermod mentee8 -G mentee
sudo usermod mentee9 -G mentee
sudo usermod mentee10 -G mentee
sudo usermod mentee11 -G mentee
sudo usermod mentee12 -G mentee
sudo usermod mentee13 -G mentee
sudo usermod mentee14 -G mentee
sudo usermod mentee15 -G mentee



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
su mentee1
echo "please login as mentee1 to proceed with searching"

echo "mentee1 50" > task1-grades.txt
echo "mentee2 60" >> task1-grades.txt
echo "mentee3 70" >> task1-grades.txt
echo "mentee4 80" >> task1-grades.txt
echo "mentee5 70" >> task1-grades.txt
echo "mentee11 80" >> task1-grades.txt
echo "mentee12 50" >> task1-grades.txt
echo "mentee13 90" >> task1-grades.txt
echo "mentee14 60" >> task1-grades.txt
echo "mentee15 30" >> task1-grades.txt


echo "printing the information of students whos score is greater than 60"
awk '$2 > 60' task1-grades.txt