use master 
go
create database ZealEducation
go
use ZealEducation
go
create table Course(
	IDCourse int primary key,
	CourseName varchar(255),
	[Time] varchar(255),
	Fee varchar(255),
	TotalBatch varchar(255),
	[Description] varchar(255),
	Note varchar(255)
)
go
create table Batch(
	IDBatch int primary key,
	IDCourse int foreign key references Course(IDCourse),
	BatchName varchar(255),
	[Time] varchar(255),
	ExamName varchar(255),
	Note varchar(255)
)
go
create table Faculty(
	IDFaculty int primary key,
	IDBatch int foreign key references Batch(IDBatch),
	FullName varchar(255),
	Email varchar(255),
	Phone varchar(255),
	[Image] varchar(255),
	Note varchar(255)
)
go
create table Class(
	IDClass int primary key,
	ClassName varchar(255),
	Note varchar(255)
)
go
create table Room(
	IDRoom int primary key,
	RoomName varchar(255),
	Note varchar(255)
)
go
create table Student(
	IDStudent int primary key,
	FullName varchar(255),
	Email varchar(255),
	[Address] varchar(255),
	BirthDay date,
	Phone varchar(255),
	UserName varchar(255),
	[Password] varchar(255),
	[Role] int,
	OnRoll int,
	IDClass int foreign key references Class(IDClass),
	CertificateRegis int,
	Note varchar(255)
)
go
create table BatchForClass(
	IDBatchForClass int primary key,
	IDBatch int foreign key references Batch(IDBatch),
	IDClass int foreign key references Class(IDClass),
	IDRoom int foreign key references Room(IDRoom),
	StartDay date,
	EndDay date,
	ExamDate date,
	ExamTime varchar(255),
	Note varchar(255)
)
go
create table ExamDetail(
	IDExamDetail int primary key,
	IDStudent int foreign key references Student(IDStudent),
	IDBatchForClass int foreign key references BatchForClass(IDBatchForClass),
	Mark varchar(255),
	Note varchar(255)
)
go
create table CourseRequest(
	IDCourseRequest int primary key,
	IDStudent int foreign key references Student(IDStudent),
	IDCourse int foreign key references Course(IDCourse),
	Note varchar(255)
)
go
create table [Admin](
	IDAdmin int primary key,
	UserName varchar(255),
	[Password] varchar(255),
	Email varchar(255),
	Note varchar(255)
)
go
create table Enquiry(
	IDFAQ int primary key,
	Question varchar(255),
	Reply varchar(255),
	Note varchar(255)
)
go
create table Criteria(
	IDCriteria int primary key,
	[Description] varchar(255),
	Note varchar(255)
)
go
create proc exam_date
(
@start date,
@end date
)
as 
begin
select * from BatchForClass where ExamDate between @start and @end
end
go
insert into Class values ('1','Class1',''),('2','Class2',''),('3','Class3','')
go
insert into Room values ('1','1',''),('2','2',''),('3','3','')
go
insert into Student values ('1','Student01','Student1@gmail.com','address1','10/10/2022','0123456789','student1','student','0','0','1','0',''),
							('2','Student02','Student2@gmail.com','address2','10/12/2022','0123456789','student2','student','0','0','1','0',''),
							('3','Student03','Student3@gmail.com','address3','10/13/2022','0123456789','student3','student','0','0','2','0',''),
							('4','Student04','Student4@gmail.com','address4','10/14/2022','0123456789','student4','student','0','0','2','0',''),
							('5','Student05','Student5@gmail.com','address5','10/15/2022','0123456789','student5','student','0','0','3','0',''),
							('6','Student06','Student6@gmail.com','address6','10/16/2022','0123456789','student6','student','0','0','3','0','')
go
insert into Course values ('1','Course1','2 Month','300USD','2','none',''),
							('2','Course2','1 Month','100USD','2','none',''),
							('3','Course3','1 Month','300USD','2','none',''),
							('4','Course4','1 Month','250USD','2','none',''),
							('5','Course5','3 week','200USD','2','none','')
go
insert into Batch values ('1','1','Batch1','2H','Batch1Exam',''),
						('2','1','Batch2','2H','Batch2Exam',''),
						('3','2','Batch3','2H','Batch3Exam',''),
						('4','2','Batch4','2H','Batch4Exam',''),
						('5','3','Batch5','2H','Batch5Exam',''),
						('6','3','Batch6','2H','Batch6Exam',''),
						('7','4','Batch7','2H','Batch7Exam',''),
						('8','4','Batch8','2H','Batch8Exam',''),
						('9','5','Batch9','2H','Batch9Exam',''),
						('10','5','Batch10','2H','Batch10Exam','')
go
insert into CourseRequest values ('1','1','1',''),
								('2','2','1',''),
								('3','3','2',''),
								('4','4','2',''),
								('5','5','3',''),
								('6','6','3','')
go
insert into Faculty values ('1','1','Faculty1','Faculty1@gmail.com','02123541','/Image/default.jpg',''),
							('2','2','Faculty2','Faculty2@gmail.com','02123541','/Image/default.jpg',''),
							('3','3','Faculty3','Faculty3@gmail.com','02123541','/Image/default.jpg',''),
							('4','4','Faculty4','Faculty4@gmail.com','02123541','/Image/default.jpg',''),
							('5','5','Faculty5','Faculty5@gmail.com','02123541','/Image/default.jpg',''),
							('6','6','Faculty6','Faculty6@gmail.com','02123541','/Image/default.jpg',''),
							('7','7','Faculty7','Faculty7@gmail.com','02123541','/Image/default.jpg',''),
							('8','8','Faculty8','Faculty8@gmail.com','02123541','/Image/default.jpg',''),
							('9','9','Faculty9','Faculty9@gmail.com','02123541','/Image/default.jpg',''),
							('10','10','Faculty10','Faculty10@gmail.com','02123541','/Image/default.jpg','')
go
insert into BatchForClass values ('1','1','1','1','01/21/2022','03/21/2022','03/25/2022','2H',''),
								('2','1','1','1','02/21/2022','04/21/2022','05/25/2022','2H',''),
								('3','1','1','1','03/21/2022','05/21/2022','07/25/2022','2H',''),
								('4','2','2','2','01/21/2022','03/21/2022','03/25/2022','2H',''),
								('5','2','2','2','02/21/2022','04/21/2022','05/25/2022','2H',''),
								('6','2','2','2','03/21/2022','05/21/2022','07/25/2022','2H',''),
								('7','3','3','3','02/21/2022','04/21/2022','05/25/2022','2H',''),
								('8','3','3','3','01/21/2022','03/21/2022','03/25/2022','2H',''),
								('9','3','3','3','03/21/2022','05/21/2022','07/25/2022','2H','')
go
insert into ExamDetail values ('1','1','1','45',''),
							('2','1','2','12',''),
							('3','1','3','63',''),
							('4','2','4','12',''),
							('5','2','5','25',''),
							('6','2','6','45',''),
							('7','3','7','64',''),
							('8','3','8','98',''),
							('9','3','9','56','')
go
insert into [Admin] values ('1','admin','admin','tpdkhoaa20174@gmail.com', '')
go
insert into Enquiry values ('1','Intuitively group categories to make a much better user experience','By organizing your q',''),
							('2','Write your question from the perspective of the customer','This helps the user connec',''),
							('3','Use language that your user will understand','Following copywriting 101 standards, ',''),
							('4','Use your brand personality and Tone of Voice','By organizing your questions into na',''),
							('5','Write your FAQ as concise, informative and directly answer the question','The point o',''),
							('6','Present your FAQ in the most visually organized manner','Using accordions with FA.',''),
							('7','Feature top questions at the top of the page','Pin top questions on the page t','')
go
insert into Criteria values ('1','Can sentences or words that express statements or questions by any means linguists',''),
							('2','In order to comprehensively analyze textual functions, it is essential to understa',''),
							('3','The first criterion to be examined is called cohesion. Cohesion plays a central role',''),
							('4','Coherence includes the layout and ordering of the concepts and relations of a text',''),
							('5','The next standard of textuality is called informativity and can be defined as',''),
							('6','The purpose of intentionality is to take the text producers intention.','')