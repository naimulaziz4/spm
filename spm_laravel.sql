-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 23, 2021 at 07:37 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spm_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment`
--

CREATE TABLE `assessment` (
  `assessmentID` tinyint(4) NOT NULL,
  `exam_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_of_questions` tinyint(4) NOT NULL,
  `total_marks` tinyint(3) UNSIGNED NOT NULL,
  `percentage` double(4,2) NOT NULL,
  `sectionID` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assessment`
--

INSERT INTO `assessment` (`assessmentID`, `exam_type`, `num_of_questions`, `total_marks`, `percentage`, `sectionID`) VALUES
(1, 'Mid', 6, 150, 30.00, 'CSE303.1'),
(2, 'Final', 4, 100, 40.00, 'CSE303.1'),
(3, 'Project', 1, 30, 30.00, 'CSE303.1'),
(4, 'Mid', 6, 150, 30.00, 'CSE303.2'),
(5, 'Final', 4, 100, 40.00, 'CSE303.2'),
(6, 'Project', 1, 30, 30.00, 'CSE303.2'),
(7, 'Mid', 6, 150, 30.00, 'CSE303.3'),
(8, 'Final', 4, 100, 40.00, 'CSE303.3'),
(9, 'Project', 1, 30, 30.00, 'CSE303.3');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sections` tinyint(4) NOT NULL,
  `deptID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `course_title`, `course_type`, `sections`, `deptID`) VALUES
('CSE101', 'Introduction to Programming', 'Core', 3, 'CSE'),
('CSE104', 'Electrical Circuit Analysis', 'Core', 3, 'CSE'),
('CSE104L', 'Electronics II Lab', 'Core', 3, 'CSE'),
('CSE201', 'Discrete Mathematics', 'Core', 3, 'CSE'),
('CSE203', 'Data Structures', 'Core', 3, 'CSE'),
('CSE203L', 'Data Structure Lab', 'Core', 3, 'CSE'),
('CSE204', 'Digital Logic Design', 'Core', 3, 'CSE'),
('CSE204L', 'Digital Logic Design Lab', 'Core', 3, 'CSE'),
('CSE210', 'Electronics I', 'Core', 3, 'CSE'),
('CSE210L', 'Electronics I Lab', 'Core', 3, 'CSE'),
('CSE211', 'Algorithms', 'Core', 3, 'CSE'),
('CSE211L', 'Algorithms Lab', 'Core', 3, 'CSE'),
('CSE213', 'Object Oriented Programming', 'Core', 3, 'CSE'),
('CSE213L', 'Object Oriented Programming Lab', 'Core', 3, 'CSE'),
('CSE214', 'Computer Organization and Architecture ', 'Core', 3, 'CSE'),
('CSE216 ', 'Microprocessor Interfacing & Assembly Language', 'Core', 3, 'CSE'),
('CSE216L', 'Microprocessor Interfacing & Assembly Language Lab', 'Core', 3, 'CSE'),
('CSE303', 'Database Management', 'Core', 3, 'CSE'),
('CSE303L', 'Database Management Systems Lab', 'Core', 3, 'CSE'),
('CSE307', 'Systems Analysis and Design', 'Core', 3, 'CSE'),
('CSE309', 'Web Applications and Internet', 'Core', 3, 'CSE'),
('CSE310', 'Electronics II', 'Core', 3, 'CSE'),
('CSE310L', 'Electronics II Lab', 'Core', 3, 'CSE'),
('CSE313', 'Compiler Constructin', 'Core', 3, 'CSE'),
('CSE315', 'Design of Operating Systems', 'Core', 3, 'CSE'),
('CSE316', 'Data Communciations & Computer Networks', 'Core', 3, 'CSE'),
('CSE316L', 'Data Communications & Computer Networks', 'Core', 3, 'CSE'),
('CSE317', 'Numerical Methods', 'Core', 3, 'CSE'),
('CSE317L', 'Numerical Methods Lab', 'Core', 3, 'CSE'),
('CSE400', 'Data Communication', 'Optional', 3, 'CSE'),
('CSE402', 'Wireless Networking & Mobile Communication', 'Optional', 3, 'CSE'),
('CSE403', 'Network Management', 'Optional', 3, 'CSE'),
('CSE406', 'Cryptography and Network Security', 'Optional', 3, 'CSE'),
('CSE407', 'Telecommunication Engineering', 'Optional', 3, 'CSE'),
('CSE408', 'Advanced Computer Networks', 'Optional', 3, 'CSE'),
('CSE409', 'Optical Fiber Communication', 'Optional', 3, 'CSE'),
('CSE413', 'Advanced Database Management Systems', 'Optional', 3, 'CSE'),
('CSE414', 'Database Systems Implementation', 'Optional', 3, 'CSE'),
('CSE416', 'Distributed Database Systems', 'Optional', 3, 'CSE'),
('CSE417', 'Data Mining and Warehouse', 'Optional', 3, 'CSE'),
('CSE418', 'E-commerce and Web Database', 'Optional', 3, 'CSE'),
('CSE420', 'Image Processing', 'Optional', 3, 'CSE'),
('CSE421', 'Machine Learning', 'Optional', 3, 'CSE'),
('CSE422', 'Pattern Recognition', 'Optional', 3, 'CSE'),
('CSE423', 'Theory of Fuzzy Systems', 'Optional', 3, 'CSE'),
('CSE424', 'Neural Networks', 'Optional', 3, 'CSE'),
('CSE425', 'Artificial Intelligence', 'Optional', 3, 'CSE'),
('CSE426', 'Introduction to Robotics', 'Optional', 3, 'CSE'),
('CSE427', 'Computer Simulation and Modeling', 'Optional', 3, 'CSE'),
('CSE428', 'Computer Vision', 'Optional', 3, 'CSE'),
('CSE431', 'Advanced Object Oriented Programming', 'Optional', 3, 'CSE'),
('CSE433', 'Introduction to Parallel Programming', 'Optional', 3, 'CSE'),
('CSE434', 'Advanced Programming in UNIX', 'Optional', 3, 'CSE'),
('CSE435', 'Computer Graphics', 'Optional', 3, 'CSE'),
('CSE436', 'Multimedia Systems', 'Optional', 3, 'CSE'),
('CSE437', 'Theory of Fuzzy Systems', 'Optional', 3, 'CSE'),
('CSE441', 'Instrumentation & Measurements', 'Optional', 3, 'CSE'),
('CSE442', 'Embedded Systems', 'Optional', 3, 'CSE'),
('CSE443', 'Digital Signal Processing', 'Optional', 3, 'CSE'),
('CSE444', 'Digital Electronics and Pulse Techniques', 'Optional', 3, 'CSE'),
('CSE446', 'Digital System Design', 'Optional', 3, 'CSE'),
('CSE447', 'Computer Peripherals & Interfacing', 'Optional', 3, 'CSE'),
('CSE448', 'VLSI Design & Testing', 'Optional', 3, 'CSE'),
('CSE449', 'Fault Tolerant System', 'Optional', 3, 'CSE'),
('CSE451', 'Software Engineering', 'Optional', 3, 'CSE'),
('CSE452', 'Software Marketing', 'Optional', 3, 'CSE'),
('CSE453', 'Software Requirements Engineering', 'Optional', 3, 'CSE'),
('CSE454', 'Software Engineering Process Management', 'Optional', 3, 'CSE'),
('CSE456', 'Business Process Reengineering', 'Optional', 3, 'CSE'),
('CSE457', 'Project Management', 'Optional', 3, 'CSE'),
('CSE458', 'Software Quality and Testing', 'Optional', 3, 'CSE'),
('CSE459', 'Software Architecture and Component Based Design', 'Optional', 3, 'CSE'),
('CSE461', 'Advance Topics for Application Development', 'Optional', 3, 'CSE'),
('CSE462', 'Entrepreneurship Development', 'Optional', 3, 'CSE'),
('CSE463', 'IT Forensic', 'Optional', 3, 'CSE'),
('CSE464', 'Mobile Application Development', 'Optional', 3, 'CSE'),
('CSE471', 'Introduction to High Performance Computing', 'Optional', 3, 'CSE'),
('CSE472', 'Cloud Computing', 'Optional', 3, 'CSE'),
('CSE490', 'Special Topics in Computer Science and Engineering', 'Optional', 3, 'CSE'),
('MAT201', 'Graph Theories', 'Optional', 3, 'MAT'),
('MAT203', 'Linear Algebra - Vectors and Matrices', 'Core', 3, 'MAT'),
('MAT301', 'Ordinary Differential Equations', 'Core', 3, 'MAT'),
('MAT403', 'Introduction to Mathematical Modeling', 'Optional', 3, 'MAT'),
('MAT405', 'Optimization Techniques', 'Optional', 3, 'MAT'),
('MAT420', 'Computational Geometry', 'Optional', 3, 'MAT'),
('MAT430', 'Introduction to Discrete Dynamical Systems', 'Optional', 3, 'MAT');

-- --------------------------------------------------------

--
-- Table structure for table `coutcome`
--

CREATE TABLE `coutcome` (
  `coutcomeID` smallint(5) UNSIGNED NOT NULL,
  `co_title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plo_trace` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coutcome`
--

INSERT INTO `coutcome` (`coutcomeID`, `co_title`, `description`, `plo_trace`) VALUES
(11, 'Basics', 'Data types, operators, memory access techniques, reasoning about interleaved statements operating on a shared data structure', '123C'),
(12, 'Error Reasoning', 'Reasoning about compilation, runtime and logical errors in short code segments ', '1357'),
(13, 'Logical reasoning', 'Reasoning about short-circuiting & different code paths for different data control structure snad repeat structures', '347'),
(14, 'Overview on Intermdiate Coding', 'Procedural and in-line coding, direction and indirection operators, call by value and reference, reasoning about computational costs and return values', '234'),
(15, 'IDE', 'Competence in using industry-standard fully-featured modern IDE (e.g.: Visual Studio, CodeBlocks), as a development tool.', '69D'),
(16, 'Problem Analysis', 'Know how to analyze and solve problems formally', '2356D'),
(21, 'Introduction to Circuit Analysis', 'Use Kirchoff\'s laws, circuit theorems, and node voltage methodology to solve simple DC as well as AC circuits', '135'),
(22, 'Simple Circuitry', 'Solve simple 1st order transient circuits', '5'),
(23, 'Steady State', 'Apply simple steady state sinusoidal analysis to circuits', '237'),
(24, 'AC Circuits', 'Demonstrate basic understanding of phasors and phasor diagrams for AC circuit analysis', '134'),
(25, 'Transformers', 'Reflect basic understanding of transformer operation through analysis of transformer circuits', '1'),
(26, 'Analysis', 'Analyze ideal operational amplifier operational circuits', '2467'),
(27, 'Electrical Engineering Fundamentals', 'Demonstrate proficiency in building basic electrical circuits and operating fundamental electrical equipment', '69AD'),
(31, 'Counting and Sets', 'Concepts of Bounds and Order (big-O, Omega and Theta) with running time for simple pseudocode, finding closed-forms for recursive formulas using unrolling and recursion trees', '134567'),
(32, 'Recurrence Relations', 'Understand recurrence and recursive functions', '35'),
(33, 'First Order Logic', 'Apply predicate logic, construct truth tables, perform simple transformations (esp. negation, various truth cases, variable types and scope', '1567'),
(34, 'Proof Techniques', 'Proof by Construction / Contradiction / Induction and be able to apply them. ', '5AB'),
(35, 'Discrete Mathematical Notation', 'State and apply basic definitions, facts, and notation for commonly used discrete mathematics and graph thoeretic constructs like graphs and trees', '16'),
(36, 'Complexity', 'problem complexity classification, countable vs uncountable, polynomial vs exponential (P vs NP), decidable vs undecidable, knowledge domains: Known, Unknown, Unknowable', '17A'),
(41, 'Memory Management', 'dynamic versus static memory allocation, difference between RAM access (Array) and pointters (Linked List), moderately complex C++ projects', '124569D'),
(42, 'Problem Decomposition', 'Decompose a problem into its supporting data structures such as lists, stacks, queues, trees, etc. ', '12347'),
(43, 'Search Techniques', 'BFS / DFS, selection of data structure for efficient algorithsm, graph search, tree traversal, optimization, data organization, etc. ', '123479A'),
(44, 'Class Data Structures', 'Implement classic and adapted data structures and applications ', '56'),
(45, 'Analysis', 'Analyze the efficiency of implementation choices. ', '127AC'),
(51, 'Intro to Digital Electronics', 'Understand and demonstrate fundamental concepts and techniques used in digital electronics', '12345'),
(52, 'Numerical Structures', 'Appreciate the structure of various number systems and its application in digital design', '1235AC'),
(53, 'Design and Analysis', 'Understand, analyze and design combinational and sequential circuits', '12345679ACD'),
(54, 'Hazard Detection', 'Identify and analyze various hazards and timing problems in digital design', '1235679ACD'),
(55, 'Circuits Implementation', 'Build and analyze digital circuits. ', '345679ABD'),
(61, 'Circuit Analysis', 'Analyze ideal diode and dieal diode circuits', '1237B'),
(62, 'Mathematical Model', 'Undestand real mathematical model of a diode', '1'),
(63, 'Circuit Solutions', 'Solve diode circuits', '2345679C'),
(64, 'BJT and MOSFET', 'Understand basic characteristics of BJT and MOSFET', '12'),
(65, 'Circuit Analysis I', 'Analyze DC of BJT and FET circuits', '234'),
(66, 'Circuit Analysis II', 'Analyze AC of BJT and FET circuits', '234'),
(67, 'Resistance', 'Comprehend the concept of amplifier, input resistance, and output resistance', '1'),
(71, 'Algorithms and Analysis Basics', 'Learn methods of designing efficient algorithms, evaluating their performances, establishing precise limits on algorithm class effectiveness', '1234567CD'),
(72, 'Algorithmic Solutions', 'Learn standard algorithms for fundamental problems.', '1356'),
(81, 'OOP Benefits', 'Understand the benefits of object oriented design and when it is an appropriate methodology to use', '1238AC'),
(82, 'Design and Implementation', 'Design, coding, testing using advanced object-oriented programming using techniques such as overloading and ineheritance', '45679BD'),
(83, 'API', 'Manipulate classes provided in the programming API and incorporate them into solutions', '1468D'),
(91, 'Computer Design', 'Under design principles and methods used in contemporary processors and memory systems and apply them to new designs', '123456'),
(92, 'Benchmark', 'Performance evaluation of modern computer.', '27CD'),
(93, 'Detect Process Bottlenecks', 'Determine sources of process bottlenecks in a processor design and determien techniques to address them', '3457'),
(94, 'Reasoning', 'Reason about sources of low memory system performance for a workload and determine techniques to address them', '35A'),
(95, 'Tradeoff Analysis', 'Evaluate tradeoffs between hardware and software techniques to achieve a performance goal', '13567'),
(101, 'Analysis', 'Analyze and understand bus/interface structures', '124'),
(102, 'Characterization', 'Characterize the timing/performance behavior of interfaces', '367'),
(103, 'Assembly Language', 'Utilize assembly langauge programs to gain insight into instructions and machine-level operations', '12679'),
(104, 'Debugging', 'Program and debug microprocessor devcies', '567B'),
(105, 'Control', 'Control / use peripherals, devices, and buses', '689CD'),
(111, 'Differentiate', 'Understand the database applications starting from conceptual design using data models diagram (ERD), Process Model Diagram (BPMN) and analyze the diagrams', '2'),
(112, 'Analyze, Evaluate', 'Basic understanding of data access structures, comparison between those structures, and determining the normalization form of database. ', '3'),
(113, 'Design', 'Solid foundation of the database design using query language SQL and design of user interfaces', '4'),
(114, 'Implementation', 'Implement user interfaces and database using appropriate tools', '6'),
(121, 'Process', 'Understand the system development life cycle', '14'),
(122, 'Problem Analysis', 'Be familiar with a variety of problem solving tools and approaches for the design and analysis of information systems', '12345'),
(123, 'Requirements', 'Write system requirements (functional and non-functional', '268AC'),
(124, 'High Level Diagramming', 'Draw context and level-0 Data Flow Diagram', '2346'),
(125, 'Low level DFD', 'Decompose level-0 DFD and level-1 DFD', '234'),
(126, 'Entity Relationship Diagram', 'Draw ERD to represent common business situations', '4589A'),
(131, 'Architecture', 'Apply fundamental web-based client-server architecture concepts', '12345'),
(132, 'Server Side', 'Write server-side programs to deliver dynamic content ofr web pages', '4678'),
(133, 'Security and Scalability', 'Create secure and scalable web applications', '69CD'),
(134, 'Requirements Analysis', 'Analyze and model requirements and constraints for the design of client-server internet applications', '2345'),
(135, 'Design and Code', 'Design and implement a client-server internet application that accomodates specific requriements and constraints, based on analysis, modeling or requirements specification', '23468A'),
(136, 'Security Concerns', 'Select and justify the implications of implementation and design considerations to internet security', '7AC'),
(141, 'Design', 'Design and build basic op-amp circuits, common-emitter amplifiers, PSPICE simulations', '12467'),
(142, 'Prediction', 'Predict frequency behaviors of amplifiers using hand calculations, PSPICE simulations, check appropriate Bode plots', '357'),
(143, 'Pros vs Cons', 'Describe the advantages and disadvantages of negative feedback including its influence on gain, bandwidth, input and output resistance', '13AC'),
(144, 'Topology', 'Establish feedback topologies of op-amp and BJT amplifiers, evaluation, manually and using PSPICE', '457B'),
(145, 'Circuit Design', 'Design circuits to partially address circuit issues on specific problems', '45'),
(146, 'Circuit Analysis', 'Analyze circuits, extract performance figures-of-merit analytically and analyze them against desired specifications.', '2378D'),
(147, 'Simulation', 'Simulate and extract peformance figures-of-merit against desired specifications and fairly compare circuits', '2578D'),
(151, 'Dataflow Problem', 'Identify the dataflow problems for a given dataflow optimization', '13'),
(152, 'Dataflow Equations', 'Solve the dataflow equations for a given dataflow problem', '57'),
(153, 'Classical Optimizations', 'Identify the classical optimizations that could be applicable to a given piece of code to improve its performance', '12D'),
(154, 'Control Flow Analysis', 'Analyze the major control flow properties of a program, including control flow graphs, dominators, nataural loops, and reducible vs irreducible flow graphs', '24'),
(155, 'Translation', 'Translate a source-level language into a low level compiler internal represntation', '56'),
(156, 'Proper Selection', 'Choose the appropriate compiler internal representation for different kinds of compmiler tasks', '27B'),
(157, 'Major Compiler Phases', 'Implement the major phases of a simple compiler, including scanning, parsing, intermediate code generation, and a few program optimizations', '2479D'),
(161, 'Kernel', 'Kernel programming principles', '16A'),
(162, 'OS components', 'Basic OS components and their inter-dependencies such as process management, memory management, file system management, I/O management, machine problems', '12347'),
(163, 'Tradeoff Analysis', 'Explain, analyze and argue system tradeoffs based on OS design decisions', '3459A'),
(164, 'Impact Analysis', 'Explain and analyze the performance impact of basic OS concepts and principles on parallel/distributed OS, mobile OS, multimedia OS, and cloud OS', '135CD'),
(165, 'Security', 'Explain, analyze, and argue about OS security issues and their impact on various OS components', '38CD'),
(171, 'Problem Identification', 'Identify the problems that arise in networked communication', '16C'),
(172, 'Pros vs Cons', 'Advantages and disadvantages of existing problem solutions in the context of different networking regimes', '123A'),
(173, 'Solution Effectiveness', 'Understand the implications of a given solution for performance in various networking regimes', '456'),
(174, 'Problem Approach', 'Evaluate novel approaches to these problems', '3457B'),
(175, 'TCP/IP I', 'Identify and describe the purpose of each component of the TCP/IP protocol', '1'),
(176, 'TCP/IP II', 'Develop solid client-server applications using TCP/IP', '69D'),
(177, 'Trend Analysis', 'Understand the impact of trends in network hardware on network software issues', '138'),
(181, 'Error Detection', 'Analyze sources of errors in mathematical operations on the computer', '13'),
(182, 'Major Numerical Methods', 'Recognize major numerical methods and their merits and pitfalls', '123'),
(183, 'Computational Cost', 'Calculate the computational cost of a range of numerical methods', '67'),
(184, 'Numerical Methods & Tools', 'Select and use softwasre tools, basd on their numerical methods, for a range of problems', '3569BD'),
(185, 'Estimation', 'Estimate the accuracy in approximated numerical solutions', '68'),
(191, 'Cryptographic Techniques', 'Understand the principles of and practices of cryptographic techniques', '12345'),
(192, 'Security Problem Analysis', 'Understand a variety of generic security threats and vulnerabilities, and identify and analyze particular security problems for a given application', '1237C'),
(193, 'Security Techniques', 'Appreciate the application of security techniques and technologies in solving real-life security problems in practical systems. ', '1568'),
(194, 'Security Protocols', 'Design security protocols and methods to solve specified security threats', '4569ACD'),
(201, 'Basic Intro Data Mining', 'Basiic principles for data cleaning and data transformation and apply typical methods of data cleaning and transformation in the data mining context', '1234567'),
(202, 'Date Warehousing', 'Basic principles of data warehousing and data cubing and apply typical methods of data warehousing and data cube computation', '1234567'),
(203, 'Patterns', ' Basic principles for mining frequent patterns and apply typical frequent pattern mining methods for effective data mining', '1234567'),
(204, 'Classification', 'Basic principles for classification and apply typical classification methods for effective data mining', '1234567'),
(205, 'Clustering', 'Basic principles for data clustering and apply typical clustering methods for effective data mining', '1234567'),
(211, 'Digital Images', 'Relevant aspects of digital image representation and their practical implcations', '123'),
(212, 'Design I', 'Ability to desing pointwise intensity transformations to meet stated specifications', '23456'),
(213, 'Design II', '2-D convolution, 2-D DFT and systems design using these concepts', '146'),
(214, 'Image Restoration', 'Command of basic image restoration techniques', '156'),
(215, 'Image Processing Systems', 'Appreciate the utility of wavelet decomposition and their role in image processing systems', '125'),
(216, 'Image Compression', 'Underlying mechanisms of image compression', '14D'),
(221, 'Intro to Machine Learning', 'Articulate key concepts and principles in Machine Learning', '1'),
(222, 'Problem Modeling', 'Articulate and model problems given an undersatnding of representational issues and abstraction in machine learning', '1234'),
(223, 'Problem Analysis', 'Explain and analyze models and results making use of theoretical principles and the limitations of generalization in machine learning', '1357'),
(224, 'Algorithmss I', 'Make use of the algorithmic theory of machine learning in problem analysis and model selection', '23456'),
(225, 'Algorithms II', 'Maximum likelihood principle, explain algorithmic implications in modeling and problem solving', '1456'),
(226, 'Algorithms III', 'Use a variety of algorithmic techniques in machine learning', '56B'),
(227, 'ML Protocols', 'Choose and use a variety of machine learning protocols in different situations', '167D'),
(231, 'Neural Networks Concept', 'Describe the relation between real brains and simple artificial neural network models', '1'),
(232, 'Architecture Tradeoff Analysis', 'Compare / contrast architectures and learning algorithms for multilayer perceptrons, radial-basis function networks, committee machiens and Kohonen self-organizing maps', '1234'),
(233, 'Neural Network Systems Analysis', 'Discuss the main factors involved in achieving good learning and generalization performance in neural network systems', '156D'),
(234, 'Systems Implementation Issues', 'Identify the main implementation issues for common neural networks', '356D'),
(235, 'Applications of Neural Networks', 'Evaluate the practical considerations in applying neural networks to real classification and regression problems', '178C'),
(241, 'Intro to AI', 'Apply AI techniques including searhc heuristics, knowledge representation planning and reasoning', '1234567'),
(242, 'AI Key Components', 'Describe the key components of the artificial intelligence field', '1'),
(243, 'Search', 'Explain search strategies', '234'),
(244, 'Problem Approach', 'Solve problems by applying a suitable search method', '5679AB'),
(245, 'Knowledge', 'Analyze and apply knowledge representation', '78C'),
(246, 'AI Plan', 'Describe and list the key aspects of planning in AI', '123'),
(247, 'Predictive Analytics', 'Analyze and apply probability theorem and Bayesian networks', '567'),
(248, 'Intelligent Agents', 'Describe the key aspects of intelligent agents', '1'),
(251, 'Motion', 'Analyze different robot motion systems and sensors', '147'),
(252, 'Sensors & Actuators', 'Identify sensors and actuators required for specific applications', '1235'),
(253, 'Robots', 'Principles of mobile robots', '1'),
(254, 'Programming', 'Programming principles for robots', '146'),
(255, 'Implementation', 'Implement hardware and software to build a robot that can perform a task', '2345679D'),
(261, 'Software Engineering Principles', 'Main aspects of software engineering and its applications', '1'),
(262, 'Requirements Engineering', 'Software system requirements, analysis and design proess using the object-oriented approach', '12345'),
(263, 'Project Management', 'Employ group working skills including general organization, planning, time management, and inter-group negotiation', '9ABCD'),
(264, 'Requirements Trace', 'Translation of requirements specification into implementable design, following structured and organized proess', '2468D'),
(265, 'Software Testing', 'Formulate a testing strategy for a software system, employing techniques such as unit testing, test driven development and functional testing', '567D'),
(271, 'International Marketing', 'Appreciate the global nature of software marketing and take appropriate measures to operate effectively in international settings', '123'),
(272, 'Marketing Strategies I', 'Develop marketing strategies based on product, price, place and promotion objectives', '23456D'),
(273, 'Decision Making Forces', 'Comprehend the social, legal, ethical, and technological forces behind software marketing decision-making', '18AC'),
(274, 'Marketing Strategies II', 'Formulate software marketing strategies that incorporate psychological and sociological factors which influence consumers', '45678C'),
(275, 'SQA', 'Standardized models for software quality assurance', '156'),
(281, 'Team Effort', 'Cooperation and contribution in team environment, develop team dynamics, work according to an agreed team protocol, resolve / manage conflict issues', '9ABCD'),
(282, 'Software Engineering Processes', 'Identify, analyze, compare and contrast different processes and their assistive tools for selected phases of the software engineering life cycle', '12378'),
(283, 'Software Engineering Tools', 'Utilize various software engineering processes and their tools as required for best-practice development of software systems', '456C'),
(284, 'Development Process', 'Plan, identify and apply procesess, standards and tools for phases of the software engienering life cycle for a substantial software development project', '23469D'),
(291, 'Risk Management', 'Manage incidents and risks within a project', '9ABCD'),
(292, 'Test Plan', 'Create test strategies, design test cases, prioritize and execute them', '234567'),
(293, 'Testing Processes', 'Apply modern software testing processes in relation to software development and project management', '15678D'),
(294, 'Continuous Improvement', 'Contribute to efficient delivery of software solutions and implement improvements in the software development process', '6CD'),
(301, 'Design Paradigms', 'Use well understood paradigms for designing new systems', '126D'),
(302, 'Architecture Tradeoff Analysis', 'Generate architectural alternatives for a problem and selection among them', '2345679'),
(303, 'Architecture Description Language', 'Describe a software architecture using various documentation approaches and architectural description language', '14AB'),
(304, 'Architectural Patterns', 'Recognize major software architectural styles, design patterns, and frameworks', '14'),
(305, 'Scalability I', 'Design and motivate software architecture for large-scale software systems', '23456'),
(306, 'Scalability II', 'Argue the importance and role of software architecture for large-scale software systems', '18ACD'),
(307, 'Modern Architectures', 'Discuss and evaluate the current trends and technologies such as model-driven and service-oriented architecture', '1237'),
(311, 'Gaussian Elimination', 'Solve systems of linear equations using multiple methods including Guassian elimination and matrix inversion', '156'),
(312, 'Vector I', 'Demonstrate understanding of the concepts of vector space and subspace', '1'),
(313, 'Matrix Operations', 'Carry out matrix operations including inverses and determinants', '1'),
(314, 'Linear Algebra Concepts', 'Demonstrate understanding of linear independence, span, and subspace', '1'),
(315, 'Vector II', 'Determine eigenvalues and eigenvectors and solve eigenvalue problems', '356'),
(316, 'Matrix Algebra', 'Apply principles of matrix algegbra to linear transformation', '1456'),
(317, 'Vector III', 'Demonstrate understanding of inner products and associated norms ', '1'),
(321, 'Applications of Differential Equations', 'Identify, analyze, and subsequently solve physical situations whose behavior can be described by ordinary differential equations', '1234567'),
(322, '1st Order Differential Equations I', 'Determine solutions to first order separable differential equations', '12356'),
(323, '1st Order Differential Equations II', 'Determine solutions to first order linear differential equations', '12356'),
(324, '1st Order Differential Equations III', 'Determine solutions to first order exact differential equations', '12356'),
(325, '2nd Order Differential Equations I', 'Determine solutions to second order linear homogeneous differential equations with constant coefficients', '12356'),
(326, '2nd Order Differential Equations II', 'Determine solutions to second order linear non-homogeneous differential equations with constant coefficients', '12356');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculumID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_of_courses` tinyint(4) NOT NULL,
  `credits_reqd` tinyint(3) UNSIGNED NOT NULL,
  `effective_date` date DEFAULT NULL,
  `programID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`curriculumID`, `num_of_courses`, `credits_reqd`, `effective_date`, `programID`) VALUES
('CSC.V1', 47, 134, '2016-04-08', 'CSC'),
('CSE.V1', 48, 138, '2012-01-06', 'CSE'),
('CSE.V2', 50, 143, '2019-04-08', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `deptID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `head` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `schoolID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`deptID`, `dept_name`, `head`, `schoolID`) VALUES
('CSE', 'Computer Science & Engineering', 'Dr. Mahady Hasan', 'SETS'),
('MAT', 'Mathematics', 'Dr. Habib Sir', 'SETS');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `facultyID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_initials` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`facultyID`, `faculty_name`, `faculty_initials`) VALUES
('44100723', 'Dr. Mahady Hasan', 'MHD'),
('44101322', 'Md. Abu Sayed', 'ASY'),
('44199791', 'Mrs. Sadita Ahmed', 'STH');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_19_090858_create_universities_table', 1),
(5, '2021_05_19_100813_create_programs_table', 1),
(6, '2021_05_19_130650_create_scores_table', 1),
(7, '2021_05_19_183612_create_segments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peobjective`
--

CREATE TABLE `peobjective` (
  `peobjectiveID` int(10) UNSIGNED NOT NULL,
  `objective` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `definition` varchar(722) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peo_weight` tinyint(4) NOT NULL,
  `programID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peobjective`
--

INSERT INTO `peobjective` (`peobjectiveID`, `objective`, `definition`, `peo_weight`, `programID`) VALUES
(1, 'Critical Thinking', 'Education system is geared more towards making student acquire knowledge but fails to capture their imagination. We want to to change that by introducing the students to the exciting world of logic, rationalization, and decision making through games and apps. We will introduce the students to various development, analysis, synthesis tools and engage them in research early in their studies. ', 11, 'CSE'),
(2, 'Conscientous Design', 'A broad liberal arts curriculum covering computer science as well as related technical subjects will provide students with a deeper understanding of the engineering issues and trade-offs that cross disciplines. Courses in humanities and social sciences will equip them with the knowledge and awareness to become responsible members of society who udnerstand the social, political, economic, and environmental impact of their decisions. Graduates will become ethical professionals with the ability to work individually or in multidisciplinary teams to design sustainable solutions to complex real-world problems under real-world constraints. ', 12, 'CSE'),
(3, 'Efficient Implementation', 'A strong emphasis is placed on developing the students\' ability to identify and analyze a problem, and to then define the computing requirements appropriate to its solution with regard to factors such as efficiency, sustainability, scalability, available resources and constraints. We ensure that our students are kept up-to-date with knowledge and practice of the most current tools and techniques, and that they develop an appreciation for continued improvement through self-training or formal graduate study. Graduates will possess the ability to design and implement efficient and future-proof software solutions to problems of varying size an complexities using modern software development principles and practices. ', 10, 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `ploutcome`
--

CREATE TABLE `ploutcome` (
  `ploutcomeID` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plo_title` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plo_weight` smallint(5) UNSIGNED NOT NULL,
  `peo_complex` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ploutcome`
--

INSERT INTO `ploutcome` (`ploutcomeID`, `plo_title`, `details`, `plo_weight`, `peo_complex`) VALUES
('1', 'Knowledge', 'An ability to select and apply knowledge, techniques, skills, and modern tools of the computer science and engineering discipline', 0, '0'),
('2', 'Requirement Analysis', 'An ability to identify, analyze and solve a problem by defining the computing requirements of the problem through effectively gathering of the actual requirements', 0, '3'),
('3', 'Problem Analysis', 'An ability to select and apply the knowledge of mathematics, science, engineering, and technology to computing problems that require the application of principles and applied procedures or methodologies', 0, '3'),
('4', 'Design', 'An ability to design computer based systems, components, or processes to meet the desired requirements', 0, '3'),
('5', 'Problem Solving', 'An ability to apply mathematical foundations, simulation, algorithmic principles, and computer science theory in the modeling and design of computer based systems in a way that demonstrates comprehension of the tradeoffs involved in design choices.', 0, '0'),
('6', 'Implementation', 'An ability to apply design and development principles in the construction of software systems of varying complexity', 0, '3'),
('7', 'Experiment Analysis', 'An ability to conduct standard tests and measurements; to conduct analyze, and interpret experiments; and to apply experimental results to improve solutions (products or processes)', 0, '1'),
('8', 'Community Engagement and Engineering', 'An ability to appreciate human behavior, culture, interaction and organization through studies in the humanities and social sciences. A knowledge of the impact of computing solutions in a local and global context', 0, '0'),
('9', 'Teamwork', 'An ability to function effectively as a member or leader of a technical team to accomplish common goals', 0, '0'),
('A', 'Communication', 'An ability to apply written an oral communication in both technical and non-technical environments; an ability to communicate with a range of audience; and an ability to identify and use appropriate available technical literature; ', 0, '0'),
('B', 'Self-directed', 'Recognition of the need for and an ability to engage in self-directed continuing professoinal development; be prepared to enter a top-ranked graduate program in Computer Science and Engineering', 0, '0'),
('C', 'Ethics', 'An understanding of and a commitment to address professional, ethical, legal, security, socal issues and responsibilities including a respect for diversity', 0, '0'),
('D', 'Process Management', 'A commitment to quality, timeliness, and continuous improvemenet', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `programID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_coordinator` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deptID` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`programID`, `program_name`, `program_coordinator`, `deptID`) VALUES
('CEN', 'Computer Engineering', 'Md. Ashraful Amin', 'CSE'),
('CSC', 'Computer Science', 'Md. Abu Sayed', 'CSE'),
('CSE', 'Computer Science & Engineering', 'Dr. Mahady Sir', 'CSE');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `questionID` tinyint(4) NOT NULL,
  `coutcomeID` smallint(6) NOT NULL,
  `marks_attainable` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`questionID`, `coutcomeID`, `marks_attainable`) VALUES
(11, 111, 25),
(12, 111, 25),
(13, 111, 30),
(14, 112, 20),
(15, 111, 30),
(16, 111, 20),
(21, 111, 20),
(22, 111, 15),
(23, 112, 15),
(24, 113, 50),
(31, 114, 30),
(41, 111, 25),
(42, 111, 25),
(43, 111, 30),
(44, 112, 20),
(45, 111, 30),
(46, 111, 20),
(51, 111, 20),
(52, 111, 15),
(53, 112, 15),
(54, 113, 50),
(61, 114, 30),
(71, 111, 25),
(72, 111, 25),
(73, 111, 30),
(74, 112, 20),
(75, 111, 30),
(76, 111, 20),
(81, 111, 20),
(82, 111, 15),
(83, 112, 15),
(84, 113, 50),
(91, 114, 30);

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `schoolID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dean` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`schoolID`, `school_name`, `dean`) VALUES
('SETS', 'School of Engineering & Technology Sciences', 'Yusuf Mahbubul Islam');

-- --------------------------------------------------------

--
-- Table structure for table `score`
--

CREATE TABLE `score` (
  `scoreID` smallint(6) NOT NULL,
  `sectionID` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `questionID` tinyint(4) NOT NULL,
  `marks_attained` tinyint(4) NOT NULL,
  `studentID` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `score`
--

INSERT INTO `score` (`scoreID`, `sectionID`, `questionID`, `marks_attained`, `studentID`) VALUES
(1, 'CSE303.1', 11, 15, 1416455),
(2, 'CSE303.3', 71, 15, 1528882),
(3, 'CSE303.1', 11, 0, 1579288),
(4, 'CSE303.3', 71, 0, 1612985),
(5, 'CSE303.1', 11, 0, 1613273),
(6, 'CSE303.1', 11, 0, 1614142),
(7, 'CSE303.3', 71, 0, 1614733),
(8, 'CSE303.3', 71, 0, 1616161),
(9, 'CSE303.3', 71, 0, 1622731),
(10, 'CSE303.1', 11, 0, 1623112),
(11, 'CSE303.1', 11, 5, 1625654),
(12, 'CSE303.2', 41, 0, 1633554),
(13, 'CSE303.3', 71, 10, 1634352),
(14, 'CSE303.2', 41, 22, 1641252),
(15, 'CSE303.2', 41, 22, 1645333),
(16, 'CSE303.1', 11, 0, 1646434),
(17, 'CSE303.3', 71, 0, 1653725),
(18, 'CSE303.1', 11, 18, 1654432),
(19, 'CSE303.1', 11, 15, 1661638),
(20, 'CSE303.3', 71, 15, 1662147),
(21, 'CSE303.2', 41, 18, 1665491),
(22, 'CSE303.1', 11, 10, 1665555),
(23, 'CSE303.2', 41, 0, 1668314),
(24, 'CSE303.3', 71, 0, 1669953),
(25, 'CSE303.3', 71, 20, 1674181),
(26, 'CSE303.3', 71, 0, 1678812),
(27, 'CSE303.1', 11, 0, 1686272),
(28, 'CSE303.2', 41, 6, 1691291),
(29, 'CSE303.3', 71, 0, 1691483),
(30, 'CSE303.2', 41, 19, 1695837),
(31, 'CSE303.1', 11, 0, 1696326),
(32, 'CSE303.1', 11, 5, 1711619),
(33, 'CSE303.1', 11, 0, 1711729),
(34, 'CSE303.2', 41, 8, 1712983),
(35, 'CSE303.1', 11, 0, 1715578),
(36, 'CSE303.3', 71, 18, 1718437),
(37, 'CSE303.2', 41, 15, 1728125),
(38, 'CSE303.3', 71, 5, 1728139),
(39, 'CSE303.1', 11, 0, 1728439),
(40, 'CSE303.3', 71, 0, 1729416),
(41, 'CSE303.2', 41, 22, 1731817),
(42, 'CSE303.3', 71, 0, 1731852),
(43, 'CSE303.3', 71, 17, 1736425),
(44, 'CSE303.3', 71, 15, 1737824),
(45, 'CSE303.3', 71, 5, 1742892),
(46, 'CSE303.2', 41, 8, 1743714),
(47, 'CSE303.1', 11, 0, 1745484),
(48, 'CSE303.1', 11, 0, 1747457),
(49, 'CSE303.3', 71, 0, 1752538),
(50, 'CSE303.2', 41, 18, 1754681),
(51, 'CSE303.2', 41, 13, 1759787),
(52, 'CSE303.2', 41, 6, 1762565),
(53, 'CSE303.2', 41, 0, 1763881),
(54, 'CSE303.1', 11, 14, 1766156),
(55, 'CSE303.3', 71, 10, 1766176),
(56, 'CSE303.2', 41, 10, 1768463),
(57, 'CSE303.2', 41, 20, 1769463),
(58, 'CSE303.3', 71, 15, 1772947),
(59, 'CSE303.2', 41, 17, 1773277),
(60, 'CSE303.2', 41, 15, 1773384),
(61, 'CSE303.1', 11, 0, 1778274),
(62, 'CSE303.3', 71, 12, 1781682),
(63, 'CSE303.2', 41, 10, 1783512),
(64, 'CSE303.2', 41, 23, 1784847),
(65, 'CSE303.1', 11, 18, 1788337),
(66, 'CSE303.2', 41, 22, 1789481),
(67, 'CSE303.2', 41, 20, 1791753),
(68, 'CSE303.1', 11, 10, 1795656),
(69, 'CSE303.2', 41, 15, 1797625),
(70, 'CSE303.3', 71, 0, 1797789),
(71, 'CSE303.1', 11, 5, 1798883),
(72, 'CSE303.2', 41, 22, 1834433),
(73, 'CSE303.3', 71, 4, 1835298),
(74, 'CSE303.2', 41, 18, 1835874),
(75, 'CSE303.2', 41, 20, 1842333),
(76, 'CSE303.1', 11, 0, 1845457),
(77, 'CSE303.3', 71, 15, 1849651),
(78, 'CSE303.2', 41, 20, 1855787),
(79, 'CSE303.3', 71, 10, 1863951),
(80, 'CSE303.1', 11, 15, 1868128),
(81, 'CSE303.1', 11, 0, 1872128),
(82, 'CSE303.3', 71, 18, 1873255),
(83, 'CSE303.3', 71, 18, 1877262),
(84, 'CSE303.2', 41, 17, 1886577),
(85, 'CSE303.3', 71, 19, 1887973),
(86, 'CSE303.1', 11, 0, 1892367),
(87, 'CSE303.2', 41, 0, 1893863),
(88, 'CSE303.3', 71, 10, 1898334),
(89, 'CSE303.1', 12, 0, 1416455),
(90, 'CSE303.3', 72, 7, 1528882),
(91, 'CSE303.1', 12, 0, 1579288),
(92, 'CSE303.3', 72, 0, 1612985),
(93, 'CSE303.1', 12, 0, 1613273),
(94, 'CSE303.1', 12, 0, 1614142),
(95, 'CSE303.3', 72, 0, 1614733),
(96, 'CSE303.3', 72, 0, 1616161),
(97, 'CSE303.3', 72, 0, 1622731),
(98, 'CSE303.1', 12, 0, 1623112),
(99, 'CSE303.1', 12, 15, 1625654),
(100, 'CSE303.2', 42, 10, 1633554),
(101, 'CSE303.3', 72, 10, 1634352),
(102, 'CSE303.2', 42, 22, 1641252),
(103, 'CSE303.2', 42, 0, 1645333),
(104, 'CSE303.1', 12, 0, 1646434),
(105, 'CSE303.3', 72, 0, 1653725),
(106, 'CSE303.1', 12, 0, 1654432),
(107, 'CSE303.1', 12, 5, 1661638),
(108, 'CSE303.3', 72, 0, 1662147),
(109, 'CSE303.2', 42, 0, 1665491),
(110, 'CSE303.1', 12, 0, 1665555),
(111, 'CSE303.2', 42, 0, 1668314),
(112, 'CSE303.3', 72, 0, 1669953),
(113, 'CSE303.3', 72, 0, 1674181),
(114, 'CSE303.3', 72, 0, 1678812),
(115, 'CSE303.1', 12, 0, 1686272),
(116, 'CSE303.2', 42, 10, 1691291),
(117, 'CSE303.3', 72, 0, 1691483),
(118, 'CSE303.2', 42, 0, 1695837),
(119, 'CSE303.1', 12, 0, 1696326),
(120, 'CSE303.1', 12, 5, 1711619),
(121, 'CSE303.1', 12, 0, 1711729),
(122, 'CSE303.2', 42, 10, 1712983),
(123, 'CSE303.1', 12, 10, 1715578),
(124, 'CSE303.3', 72, 0, 1718437),
(125, 'CSE303.2', 42, 0, 1728125),
(126, 'CSE303.3', 72, 0, 1728139),
(127, 'CSE303.1', 12, 0, 1728439),
(128, 'CSE303.3', 72, 20, 1729416),
(129, 'CSE303.2', 42, 18, 1731817),
(130, 'CSE303.3', 72, 20, 1731852),
(131, 'CSE303.3', 72, 20, 1736425),
(132, 'CSE303.3', 72, 20, 1737824),
(133, 'CSE303.3', 72, 0, 1742892),
(134, 'CSE303.2', 42, 0, 1743714),
(135, 'CSE303.1', 12, 7, 1745484),
(136, 'CSE303.1', 12, 0, 1747457),
(137, 'CSE303.3', 72, 20, 1752538),
(138, 'CSE303.2', 42, 15, 1754681),
(139, 'CSE303.2', 42, 0, 1759787),
(140, 'CSE303.2', 42, 22, 1762565),
(141, 'CSE303.2', 42, 0, 1763881),
(142, 'CSE303.1', 12, 0, 1766156),
(143, 'CSE303.3', 72, 22, 1766176),
(144, 'CSE303.2', 42, 0, 1768463),
(145, 'CSE303.2', 42, 0, 1769463),
(146, 'CSE303.3', 72, 0, 1772947),
(147, 'CSE303.2', 42, 0, 1773277),
(148, 'CSE303.2', 42, 0, 1773384),
(149, 'CSE303.1', 12, 7, 1778274),
(150, 'CSE303.3', 72, 7, 1781682),
(151, 'CSE303.2', 42, 0, 1783512),
(152, 'CSE303.2', 42, 15, 1784847),
(153, 'CSE303.1', 12, 18, 1788337),
(154, 'CSE303.2', 42, 19, 1789481),
(155, 'CSE303.2', 42, 18, 1791753),
(156, 'CSE303.1', 12, 3, 1795656),
(157, 'CSE303.2', 42, 0, 1797625),
(158, 'CSE303.3', 72, 0, 1797789),
(159, 'CSE303.1', 12, 0, 1798883),
(160, 'CSE303.2', 42, 20, 1834433),
(161, 'CSE303.3', 72, 18, 1835298),
(162, 'CSE303.2', 42, 25, 1835874),
(163, 'CSE303.2', 42, 0, 1842333),
(164, 'CSE303.1', 12, 0, 1845457),
(165, 'CSE303.3', 72, 12, 1849651),
(166, 'CSE303.2', 42, 15, 1855787),
(167, 'CSE303.3', 72, 20, 1863951),
(168, 'CSE303.1', 12, 15, 1868128),
(169, 'CSE303.1', 12, 0, 1872128),
(170, 'CSE303.3', 72, 0, 1873255),
(171, 'CSE303.3', 72, 2, 1877262),
(172, 'CSE303.2', 42, 7, 1886577),
(173, 'CSE303.3', 72, 15, 1887973),
(174, 'CSE303.1', 12, 0, 1892367),
(175, 'CSE303.2', 42, 0, 1893863),
(176, 'CSE303.3', 72, 18, 1898334),
(177, 'CSE303.1', 13, 5, 1416455),
(178, 'CSE303.3', 73, 0, 1528882),
(179, 'CSE303.1', 13, 18, 1579288),
(180, 'CSE303.3', 73, 22, 1612985),
(181, 'CSE303.1', 13, 0, 1613273),
(182, 'CSE303.1', 13, 10, 1614142),
(183, 'CSE303.3', 73, 0, 1614733),
(184, 'CSE303.3', 73, 18, 1616161),
(185, 'CSE303.3', 73, 0, 1622731),
(186, 'CSE303.1', 13, 15, 1623112),
(187, 'CSE303.1', 13, 20, 1625654),
(188, 'CSE303.2', 43, 5, 1633554),
(189, 'CSE303.3', 73, 15, 1634352),
(190, 'CSE303.2', 43, 24, 1641252),
(191, 'CSE303.2', 43, 23, 1645333),
(192, 'CSE303.1', 13, 0, 1646434),
(193, 'CSE303.3', 73, 0, 1653725),
(194, 'CSE303.1', 13, 20, 1654432),
(195, 'CSE303.1', 13, 10, 1661638),
(196, 'CSE303.3', 73, 0, 1662147),
(197, 'CSE303.2', 43, 20, 1665491),
(198, 'CSE303.1', 13, 15, 1665555),
(199, 'CSE303.2', 43, 0, 1668314),
(200, 'CSE303.3', 73, 5, 1669953),
(201, 'CSE303.3', 73, 5, 1674181),
(202, 'CSE303.3', 73, 0, 1678812),
(203, 'CSE303.1', 13, 0, 1686272),
(204, 'CSE303.2', 43, 0, 1691291),
(205, 'CSE303.3', 73, 20, 1691483),
(206, 'CSE303.2', 43, 24, 1695837),
(207, 'CSE303.1', 13, 10, 1696326),
(208, 'CSE303.1', 13, 22, 1711619),
(209, 'CSE303.1', 13, 0, 1711729),
(210, 'CSE303.2', 43, 22, 1712983),
(211, 'CSE303.1', 13, 10, 1715578),
(212, 'CSE303.3', 73, 22, 1718437),
(213, 'CSE303.2', 43, 24, 1728125),
(214, 'CSE303.3', 73, 10, 1728139),
(215, 'CSE303.1', 13, 24, 1728439),
(216, 'CSE303.3', 73, 18, 1729416),
(217, 'CSE303.2', 43, 22, 1731817),
(218, 'CSE303.3', 73, 0, 1731852),
(219, 'CSE303.3', 73, 22, 1736425),
(220, 'CSE303.3', 73, 22, 1737824),
(221, 'CSE303.3', 73, 5, 1742892),
(222, 'CSE303.2', 43, 20, 1743714),
(223, 'CSE303.1', 13, 0, 1745484),
(224, 'CSE303.1', 13, 0, 1747457),
(225, 'CSE303.3', 73, 0, 1752538),
(226, 'CSE303.2', 43, 27, 1754681),
(227, 'CSE303.2', 43, 20, 1759787),
(228, 'CSE303.2', 43, 0, 1762565),
(229, 'CSE303.2', 43, 27, 1763881),
(230, 'CSE303.1', 13, 20, 1766156),
(231, 'CSE303.3', 73, 18, 1766176),
(232, 'CSE303.2', 43, 20, 1768463),
(233, 'CSE303.2', 43, 0, 1769463),
(234, 'CSE303.3', 73, 27, 1772947),
(235, 'CSE303.2', 43, 22, 1773277),
(236, 'CSE303.2', 43, 20, 1773384),
(237, 'CSE303.1', 13, 15, 1778274),
(238, 'CSE303.3', 73, 0, 1781682),
(239, 'CSE303.2', 43, 22, 1783512),
(240, 'CSE303.2', 43, 20, 1784847),
(241, 'CSE303.1', 13, 24, 1788337),
(242, 'CSE303.2', 43, 24, 1789481),
(243, 'CSE303.2', 43, 22, 1791753),
(244, 'CSE303.1', 13, 20, 1795656),
(245, 'CSE303.2', 43, 22, 1797625),
(246, 'CSE303.3', 73, 15, 1797789),
(247, 'CSE303.1', 13, 15, 1798883),
(248, 'CSE303.2', 43, 27, 1834433),
(249, 'CSE303.3', 73, 20, 1835298),
(250, 'CSE303.2', 43, 10, 1835874),
(251, 'CSE303.2', 43, 15, 1842333),
(252, 'CSE303.1', 13, 20, 1845457),
(253, 'CSE303.3', 73, 22, 1849651),
(254, 'CSE303.2', 43, 26, 1855787),
(255, 'CSE303.3', 73, 15, 1863951),
(256, 'CSE303.1', 13, 24, 1868128),
(257, 'CSE303.1', 13, 22, 1872128),
(258, 'CSE303.3', 73, 22, 1873255),
(259, 'CSE303.3', 73, 22, 1877262),
(260, 'CSE303.2', 43, 20, 1886577),
(261, 'CSE303.3', 73, 0, 1887973),
(262, 'CSE303.1', 13, 24, 1892367),
(263, 'CSE303.2', 43, 20, 1893863),
(264, 'CSE303.3', 73, 0, 1898334),
(265, 'CSE303.1', 14, 15, 1416455),
(266, 'CSE303.3', 74, 0, 1528882),
(267, 'CSE303.1', 14, 0, 1579288),
(268, 'CSE303.3', 74, 12, 1612985),
(269, 'CSE303.1', 14, 16, 1613273),
(270, 'CSE303.1', 14, 16, 1614142),
(271, 'CSE303.3', 74, 0, 1614733),
(272, 'CSE303.3', 74, 11, 1616161),
(273, 'CSE303.3', 74, 0, 1622731),
(274, 'CSE303.1', 14, 16, 1623112),
(275, 'CSE303.1', 14, 0, 1625654),
(276, 'CSE303.2', 44, 15, 1633554),
(277, 'CSE303.3', 74, 6, 1634352),
(278, 'CSE303.2', 44, 14, 1641252),
(279, 'CSE303.2', 44, 16, 1645333),
(280, 'CSE303.1', 14, 0, 1646434),
(281, 'CSE303.3', 74, 0, 1653725),
(282, 'CSE303.1', 14, 18, 1654432),
(283, 'CSE303.1', 14, 0, 1661638),
(284, 'CSE303.3', 74, 5, 1662147),
(285, 'CSE303.2', 44, 16, 1665491),
(286, 'CSE303.1', 14, 6, 1665555),
(287, 'CSE303.2', 44, 0, 1668314),
(288, 'CSE303.3', 74, 0, 1669953),
(289, 'CSE303.3', 74, 5, 1674181),
(290, 'CSE303.3', 74, 16, 1678812),
(291, 'CSE303.1', 14, 14, 1686272),
(292, 'CSE303.2', 44, 0, 1691291),
(293, 'CSE303.3', 74, 15, 1691483),
(294, 'CSE303.2', 44, 0, 1695837),
(295, 'CSE303.1', 14, 16, 1696326),
(296, 'CSE303.1', 14, 0, 1711619),
(297, 'CSE303.1', 14, 0, 1711729),
(298, 'CSE303.2', 44, 0, 1712983),
(299, 'CSE303.1', 14, 18, 1715578),
(300, 'CSE303.3', 74, 12, 1718437),
(301, 'CSE303.2', 44, 16, 1728125),
(302, 'CSE303.3', 74, 0, 1728139),
(303, 'CSE303.1', 14, 0, 1728439),
(304, 'CSE303.3', 74, 20, 1729416),
(305, 'CSE303.2', 44, 16, 1731817),
(306, 'CSE303.3', 74, 0, 1731852),
(307, 'CSE303.3', 74, 0, 1736425),
(308, 'CSE303.3', 74, 20, 1737824),
(309, 'CSE303.3', 74, 0, 1742892),
(310, 'CSE303.2', 44, 0, 1743714),
(311, 'CSE303.1', 14, 0, 1745484),
(312, 'CSE303.1', 14, 0, 1747457),
(313, 'CSE303.3', 74, 15, 1752538),
(314, 'CSE303.2', 44, 18, 1754681),
(315, 'CSE303.2', 44, 0, 1759787),
(316, 'CSE303.2', 44, 0, 1762565),
(317, 'CSE303.2', 44, 0, 1763881),
(318, 'CSE303.1', 14, 20, 1766156),
(319, 'CSE303.3', 74, 16, 1766176),
(320, 'CSE303.2', 44, 16, 1768463),
(321, 'CSE303.2', 44, 0, 1769463),
(322, 'CSE303.3', 74, 16, 1772947),
(323, 'CSE303.2', 44, 18, 1773277),
(324, 'CSE303.2', 44, 0, 1773384),
(325, 'CSE303.1', 14, 14, 1778274),
(326, 'CSE303.3', 74, 13, 1781682),
(327, 'CSE303.2', 44, 16, 1783512),
(328, 'CSE303.2', 44, 0, 1784847),
(329, 'CSE303.1', 14, 0, 1788337),
(330, 'CSE303.2', 44, 0, 1789481),
(331, 'CSE303.2', 44, 15, 1791753),
(332, 'CSE303.1', 14, 19, 1795656),
(333, 'CSE303.2', 44, 0, 1797625),
(334, 'CSE303.3', 74, 0, 1797789),
(335, 'CSE303.1', 14, 0, 1798883),
(336, 'CSE303.2', 44, 18, 1834433),
(337, 'CSE303.3', 74, 20, 1835298),
(338, 'CSE303.2', 44, 0, 1835874),
(339, 'CSE303.2', 44, 14, 1842333),
(340, 'CSE303.1', 14, 0, 1845457),
(341, 'CSE303.3', 74, 13, 1849651),
(342, 'CSE303.2', 44, 10, 1855787),
(343, 'CSE303.3', 74, 20, 1863951),
(344, 'CSE303.1', 14, 15, 1868128),
(345, 'CSE303.1', 14, 16, 1872128),
(346, 'CSE303.3', 74, 19, 1873255),
(347, 'CSE303.3', 74, 18, 1877262),
(348, 'CSE303.2', 44, 10, 1886577),
(349, 'CSE303.3', 74, 0, 1887973),
(350, 'CSE303.1', 14, 16, 1892367),
(351, 'CSE303.2', 44, 6, 1893863),
(352, 'CSE303.3', 74, 0, 1898334),
(353, 'CSE303.1', 15, 2, 1416455),
(354, 'CSE303.3', 75, 0, 1528882),
(355, 'CSE303.1', 15, 5, 1579288),
(356, 'CSE303.3', 75, 0, 1612985),
(357, 'CSE303.1', 15, 0, 1613273),
(358, 'CSE303.1', 15, 9, 1614142),
(359, 'CSE303.3', 75, 0, 1614733),
(360, 'CSE303.3', 75, 20, 1616161),
(361, 'CSE303.3', 75, 0, 1622731),
(362, 'CSE303.1', 15, 10, 1623112),
(363, 'CSE303.1', 15, 0, 1625654),
(364, 'CSE303.2', 45, 0, 1633554),
(365, 'CSE303.3', 75, 6, 1634352),
(366, 'CSE303.2', 45, 25, 1641252),
(367, 'CSE303.2', 45, 15, 1645333),
(368, 'CSE303.1', 15, 0, 1646434),
(369, 'CSE303.3', 75, 0, 1653725),
(370, 'CSE303.1', 15, 17, 1654432),
(371, 'CSE303.1', 15, 0, 1661638),
(372, 'CSE303.3', 75, 0, 1662147),
(373, 'CSE303.2', 45, 0, 1665491),
(374, 'CSE303.1', 15, 2, 1665555),
(375, 'CSE303.2', 45, 0, 1668314),
(376, 'CSE303.3', 75, 0, 1669953),
(377, 'CSE303.3', 75, 0, 1674181),
(378, 'CSE303.3', 75, 1, 1678812),
(379, 'CSE303.1', 15, 0, 1686272),
(380, 'CSE303.2', 45, 2, 1691291),
(381, 'CSE303.3', 75, 0, 1691483),
(382, 'CSE303.2', 45, 5, 1695837),
(383, 'CSE303.1', 15, 1, 1696326),
(384, 'CSE303.1', 15, 14, 1711619),
(385, 'CSE303.1', 15, 0, 1711729),
(386, 'CSE303.2', 45, 20, 1712983),
(387, 'CSE303.1', 15, 10, 1715578),
(388, 'CSE303.3', 75, 20, 1718437),
(389, 'CSE303.2', 45, 0, 1728125),
(390, 'CSE303.3', 75, 0, 1728139),
(391, 'CSE303.1', 15, 20, 1728439),
(392, 'CSE303.3', 75, 0, 1729416),
(393, 'CSE303.2', 45, 27, 1731817),
(394, 'CSE303.3', 75, 0, 1731852),
(395, 'CSE303.3', 75, 20, 1736425),
(396, 'CSE303.3', 75, 0, 1737824),
(397, 'CSE303.3', 75, 0, 1742892),
(398, 'CSE303.2', 45, 3, 1743714),
(399, 'CSE303.1', 15, 3, 1745484),
(400, 'CSE303.1', 15, 13, 1747457),
(401, 'CSE303.3', 75, 0, 1752538),
(402, 'CSE303.2', 45, 5, 1754681),
(403, 'CSE303.2', 45, 5, 1759787),
(404, 'CSE303.2', 45, 15, 1762565),
(405, 'CSE303.2', 45, 0, 1763881),
(406, 'CSE303.1', 15, 18, 1766156),
(407, 'CSE303.3', 75, 10, 1766176),
(408, 'CSE303.2', 45, 0, 1768463),
(409, 'CSE303.2', 45, 0, 1769463),
(410, 'CSE303.3', 75, 5, 1772947),
(411, 'CSE303.2', 45, 0, 1773277),
(412, 'CSE303.2', 45, 0, 1773384),
(413, 'CSE303.1', 15, 6, 1778274),
(414, 'CSE303.3', 75, 0, 1781682),
(415, 'CSE303.2', 45, 0, 1783512),
(416, 'CSE303.2', 45, 28, 1784847),
(417, 'CSE303.1', 15, 8, 1788337),
(418, 'CSE303.2', 45, 27, 1789481),
(419, 'CSE303.2', 45, 17, 1791753),
(420, 'CSE303.1', 15, 4, 1795656),
(421, 'CSE303.2', 45, 14, 1797625),
(422, 'CSE303.3', 75, 0, 1797789),
(423, 'CSE303.1', 15, 3, 1798883),
(424, 'CSE303.2', 45, 22, 1834433),
(425, 'CSE303.3', 75, 16, 1835298),
(426, 'CSE303.2', 45, 0, 1835874),
(427, 'CSE303.2', 45, 6, 1842333),
(428, 'CSE303.1', 15, 0, 1845457),
(429, 'CSE303.3', 75, 0, 1849651),
(430, 'CSE303.2', 45, 0, 1855787),
(431, 'CSE303.3', 75, 17, 1863951),
(432, 'CSE303.1', 15, 4, 1868128),
(433, 'CSE303.1', 15, 10, 1872128),
(434, 'CSE303.3', 75, 28, 1873255),
(435, 'CSE303.3', 75, 28, 1877262),
(436, 'CSE303.2', 45, 7, 1886577),
(437, 'CSE303.3', 75, 10, 1887973),
(438, 'CSE303.1', 15, 12, 1892367),
(439, 'CSE303.2', 45, 0, 1893863),
(440, 'CSE303.3', 75, 1, 1898334),
(441, 'CSE303.1', 16, 7, 1416455),
(442, 'CSE303.3', 76, 4, 1528882),
(443, 'CSE303.1', 16, 12, 1579288),
(444, 'CSE303.3', 76, 8, 1612985),
(445, 'CSE303.1', 16, 4, 1613273),
(446, 'CSE303.1', 16, 10, 1614142),
(447, 'CSE303.3', 76, 0, 1614733),
(448, 'CSE303.3', 76, 20, 1616161),
(449, 'CSE303.3', 76, 0, 1622731),
(450, 'CSE303.1', 16, 8, 1623112),
(451, 'CSE303.1', 16, 0, 1625654),
(452, 'CSE303.2', 46, 0, 1633554),
(453, 'CSE303.3', 76, 13, 1634352),
(454, 'CSE303.2', 46, 17, 1641252),
(455, 'CSE303.2', 46, 13, 1645333),
(456, 'CSE303.1', 16, 0, 1646434),
(457, 'CSE303.3', 76, 0, 1653725),
(458, 'CSE303.1', 16, 14, 1654432),
(459, 'CSE303.1', 16, 15, 1661638),
(460, 'CSE303.3', 76, 5, 1662147),
(461, 'CSE303.2', 46, 5, 1665491),
(462, 'CSE303.1', 16, 0, 1665555),
(463, 'CSE303.2', 46, 0, 1668314),
(464, 'CSE303.3', 76, 0, 1669953),
(465, 'CSE303.3', 76, 8, 1674181),
(466, 'CSE303.3', 76, 0, 1678812),
(467, 'CSE303.1', 16, 0, 1686272),
(468, 'CSE303.2', 46, 11, 1691291),
(469, 'CSE303.3', 76, 0, 1691483),
(470, 'CSE303.2', 46, 7, 1695837),
(471, 'CSE303.1', 16, 9, 1696326),
(472, 'CSE303.1', 16, 18, 1711619),
(473, 'CSE303.1', 16, 6, 1711729),
(474, 'CSE303.2', 46, 13, 1712983),
(475, 'CSE303.1', 16, 5, 1715578),
(476, 'CSE303.3', 76, 20, 1718437),
(477, 'CSE303.2', 46, 18, 1728125),
(478, 'CSE303.3', 76, 15, 1728139),
(479, 'CSE303.1', 16, 14, 1728439),
(480, 'CSE303.3', 76, 13, 1729416),
(481, 'CSE303.2', 46, 16, 1731817),
(482, 'CSE303.3', 76, 17, 1731852),
(483, 'CSE303.3', 76, 19, 1736425),
(484, 'CSE303.3', 76, 10, 1737824),
(485, 'CSE303.3', 76, 0, 1742892),
(486, 'CSE303.2', 46, 2, 1743714),
(487, 'CSE303.1', 16, 9, 1745484),
(488, 'CSE303.1', 16, 1, 1747457),
(489, 'CSE303.3', 76, 0, 1752538),
(490, 'CSE303.2', 46, 19, 1754681),
(491, 'CSE303.2', 46, 10, 1759787),
(492, 'CSE303.2', 46, 4, 1762565),
(493, 'CSE303.2', 46, 15, 1763881),
(494, 'CSE303.1', 16, 0, 1766156),
(495, 'CSE303.3', 76, 8, 1766176),
(496, 'CSE303.2', 46, 11, 1768463),
(497, 'CSE303.2', 46, 0, 1769463),
(498, 'CSE303.3', 76, 19, 1772947),
(499, 'CSE303.2', 46, 0, 1773277),
(500, 'CSE303.2', 46, 9, 1773384),
(501, 'CSE303.1', 16, 4, 1778274),
(502, 'CSE303.3', 76, 7, 1781682),
(503, 'CSE303.2', 46, 13, 1783512),
(504, 'CSE303.2', 46, 19, 1784847),
(505, 'CSE303.1', 16, 17, 1788337),
(506, 'CSE303.2', 46, 17, 1789481),
(507, 'CSE303.2', 46, 15, 1791753),
(508, 'CSE303.1', 16, 5, 1795656),
(509, 'CSE303.2', 46, 14, 1797625),
(510, 'CSE303.3', 76, 8, 1797789),
(511, 'CSE303.1', 16, 10, 1798883),
(512, 'CSE303.2', 46, 19, 1834433),
(513, 'CSE303.3', 76, 17, 1835298),
(514, 'CSE303.2', 46, 0, 1835874),
(515, 'CSE303.2', 46, 0, 1842333),
(516, 'CSE303.1', 16, 0, 1845457),
(517, 'CSE303.3', 76, 8, 1849651),
(518, 'CSE303.2', 46, 0, 1855787),
(519, 'CSE303.3', 76, 16, 1863951),
(520, 'CSE303.1', 16, 15, 1868128),
(521, 'CSE303.1', 16, 6, 1872128),
(522, 'CSE303.3', 76, 19, 1873255),
(523, 'CSE303.3', 76, 18, 1877262),
(524, 'CSE303.2', 46, 18, 1886577),
(525, 'CSE303.3', 76, 18, 1887973),
(526, 'CSE303.1', 16, 7, 1892367),
(527, 'CSE303.2', 46, 0, 1893863),
(528, 'CSE303.3', 76, 6, 1898334),
(529, 'CSE303.1', 21, 13, 1416455),
(530, 'CSE303.3', 81, 2, 1528882),
(531, 'CSE303.1', 21, 0, 1579288),
(532, 'CSE303.3', 81, 15, 1612985),
(533, 'CSE303.1', 21, 9, 1613273),
(534, 'CSE303.1', 21, 9, 1614142),
(535, 'CSE303.3', 81, 14, 1614733),
(536, 'CSE303.3', 81, 14, 1616161),
(537, 'CSE303.3', 81, 0, 1622731),
(538, 'CSE303.1', 21, 9, 1623112),
(539, 'CSE303.1', 21, 8, 1625654),
(540, 'CSE303.2', 51, 0, 1633554),
(541, 'CSE303.3', 81, 15, 1634352),
(542, 'CSE303.2', 51, 15, 1641252),
(543, 'CSE303.2', 51, 10, 1645333),
(544, 'CSE303.1', 21, 9, 1646434),
(545, 'CSE303.3', 81, 0, 1653725),
(546, 'CSE303.1', 21, 9, 1654432),
(547, 'CSE303.1', 21, 14, 1661638),
(548, 'CSE303.3', 81, 9, 1662147),
(549, 'CSE303.2', 51, 14, 1665491),
(550, 'CSE303.1', 21, 13, 1665555),
(551, 'CSE303.2', 51, 17, 1668314),
(552, 'CSE303.3', 81, 0, 1669953),
(553, 'CSE303.3', 81, 9, 1674181),
(554, 'CSE303.3', 81, 13, 1678812),
(555, 'CSE303.1', 21, 9, 1686272),
(556, 'CSE303.2', 51, 17, 1691291),
(557, 'CSE303.3', 81, 2, 1691483),
(558, 'CSE303.2', 51, 14, 1695837),
(559, 'CSE303.1', 21, 9, 1696326),
(560, 'CSE303.1', 21, 16, 1711619),
(561, 'CSE303.1', 21, 8, 1711729),
(562, 'CSE303.2', 51, 17, 1712983),
(563, 'CSE303.1', 21, 19, 1715578),
(564, 'CSE303.3', 81, 19, 1718437),
(565, 'CSE303.2', 51, 18, 1728125),
(566, 'CSE303.3', 81, 0, 1728139),
(567, 'CSE303.1', 21, 14, 1728439),
(568, 'CSE303.3', 81, 14, 1729416),
(569, 'CSE303.2', 51, 18, 1731817),
(570, 'CSE303.3', 81, 14, 1731852),
(571, 'CSE303.3', 81, 14, 1736425),
(572, 'CSE303.3', 81, 9, 1737824),
(573, 'CSE303.3', 81, 0, 1742892),
(574, 'CSE303.2', 51, 16, 1743714),
(575, 'CSE303.1', 21, 0, 1745484),
(576, 'CSE303.1', 21, 13, 1747457),
(577, 'CSE303.3', 81, 14, 1752538),
(578, 'CSE303.2', 51, 10, 1754681),
(579, 'CSE303.2', 51, 0, 1759787),
(580, 'CSE303.2', 51, 18, 1762565),
(581, 'CSE303.2', 51, 0, 1763881),
(582, 'CSE303.1', 21, 12, 1766156),
(583, 'CSE303.3', 81, 14, 1766176),
(584, 'CSE303.2', 51, 14, 1768463),
(585, 'CSE303.2', 51, 0, 1769463),
(586, 'CSE303.3', 81, 14, 1772947),
(587, 'CSE303.2', 51, 14, 1773277),
(588, 'CSE303.2', 51, 14, 1773384),
(589, 'CSE303.1', 21, 9, 1778274),
(590, 'CSE303.3', 81, 9, 1781682),
(591, 'CSE303.2', 51, 10, 1783512),
(592, 'CSE303.2', 51, 17, 1784847),
(593, 'CSE303.1', 21, 15, 1788337),
(594, 'CSE303.2', 51, 19, 1789481),
(595, 'CSE303.2', 51, 18, 1791753),
(596, 'CSE303.1', 21, 9, 1795656),
(597, 'CSE303.2', 51, 14, 1797625),
(598, 'CSE303.3', 81, 0, 1797789),
(599, 'CSE303.1', 21, 14, 1798883),
(600, 'CSE303.2', 51, 18, 1834433),
(601, 'CSE303.3', 81, 14, 1835298),
(602, 'CSE303.2', 51, 18, 1835874),
(603, 'CSE303.2', 51, 14, 1842333),
(604, 'CSE303.1', 21, 0, 1845457),
(605, 'CSE303.3', 81, 10, 1849651),
(606, 'CSE303.2', 51, 9, 1855787),
(607, 'CSE303.3', 81, 18, 1863951),
(608, 'CSE303.1', 21, 18, 1868128),
(609, 'CSE303.1', 21, 10, 1872128),
(610, 'CSE303.3', 81, 18, 1873255),
(611, 'CSE303.3', 81, 18, 1877262),
(612, 'CSE303.2', 51, 14, 1886577),
(613, 'CSE303.3', 81, 14, 1887973),
(614, 'CSE303.1', 21, 10, 1892367),
(615, 'CSE303.2', 51, 0, 1893863),
(616, 'CSE303.3', 81, 9, 1898334),
(617, 'CSE303.1', 22, 13, 1416455),
(618, 'CSE303.3', 82, 7, 1528882),
(619, 'CSE303.1', 22, 10, 1579288),
(620, 'CSE303.3', 82, 0, 1612985),
(621, 'CSE303.1', 22, 13, 1613273),
(622, 'CSE303.1', 22, 13, 1614142),
(623, 'CSE303.3', 82, 10, 1614733),
(624, 'CSE303.3', 82, 13, 1616161),
(625, 'CSE303.3', 82, 0, 1622731),
(626, 'CSE303.1', 22, 12, 1623112),
(627, 'CSE303.1', 22, 10, 1625654),
(628, 'CSE303.2', 52, 0, 1633554),
(629, 'CSE303.3', 82, 10, 1634352),
(630, 'CSE303.2', 52, 14, 1641252),
(631, 'CSE303.2', 52, 12, 1645333),
(632, 'CSE303.1', 22, 13, 1646434),
(633, 'CSE303.3', 82, 0, 1653725),
(634, 'CSE303.1', 22, 12, 1654432),
(635, 'CSE303.1', 22, 10, 1661638),
(636, 'CSE303.3', 82, 2, 1662147),
(637, 'CSE303.2', 52, 13, 1665491),
(638, 'CSE303.1', 22, 12, 1665555),
(639, 'CSE303.2', 52, 5, 1668314),
(640, 'CSE303.3', 82, 0, 1669953),
(641, 'CSE303.3', 82, 12, 1674181),
(642, 'CSE303.3', 82, 13, 1678812),
(643, 'CSE303.1', 22, 13, 1686272),
(644, 'CSE303.2', 52, 10, 1691291),
(645, 'CSE303.3', 82, 12, 1691483),
(646, 'CSE303.2', 52, 5, 1695837),
(647, 'CSE303.1', 22, 12, 1696326),
(648, 'CSE303.1', 22, 12, 1711619),
(649, 'CSE303.1', 22, 11, 1711729),
(650, 'CSE303.2', 52, 10, 1712983),
(651, 'CSE303.1', 22, 12, 1715578),
(652, 'CSE303.3', 82, 13, 1718437),
(653, 'CSE303.2', 52, 0, 1728125),
(654, 'CSE303.3', 82, 10, 1728139),
(655, 'CSE303.1', 22, 13, 1728439),
(656, 'CSE303.3', 82, 13, 1729416),
(657, 'CSE303.2', 52, 11, 1731817),
(658, 'CSE303.3', 82, 13, 1731852),
(659, 'CSE303.3', 82, 13, 1736425),
(660, 'CSE303.3', 82, 13, 1737824),
(661, 'CSE303.3', 82, 2, 1742892),
(662, 'CSE303.2', 52, 0, 1743714),
(663, 'CSE303.1', 22, 0, 1745484),
(664, 'CSE303.1', 22, 11, 1747457),
(665, 'CSE303.3', 82, 13, 1752538),
(666, 'CSE303.2', 52, 0, 1754681),
(667, 'CSE303.2', 52, 0, 1759787),
(668, 'CSE303.2', 52, 10, 1762565),
(669, 'CSE303.2', 52, 0, 1763881),
(670, 'CSE303.1', 22, 8, 1766156),
(671, 'CSE303.3', 82, 13, 1766176),
(672, 'CSE303.2', 52, 10, 1768463),
(673, 'CSE303.2', 52, 0, 1769463),
(674, 'CSE303.3', 82, 12, 1772947),
(675, 'CSE303.2', 52, 13, 1773277),
(676, 'CSE303.2', 52, 8, 1773384),
(677, 'CSE303.1', 22, 5, 1778274),
(678, 'CSE303.3', 82, 7, 1781682),
(679, 'CSE303.2', 52, 10, 1783512),
(680, 'CSE303.2', 52, 13, 1784847),
(681, 'CSE303.1', 22, 13, 1788337),
(682, 'CSE303.2', 52, 12, 1789481),
(683, 'CSE303.2', 52, 13, 1791753),
(684, 'CSE303.1', 22, 10, 1795656),
(685, 'CSE303.2', 52, 10, 1797625),
(686, 'CSE303.3', 82, 12, 1797789),
(687, 'CSE303.1', 22, 11, 1798883),
(688, 'CSE303.2', 52, 12, 1834433),
(689, 'CSE303.3', 82, 12, 1835298),
(690, 'CSE303.2', 52, 10, 1835874),
(691, 'CSE303.2', 52, 12, 1842333),
(692, 'CSE303.1', 22, 0, 1845457),
(693, 'CSE303.3', 82, 8, 1849651),
(694, 'CSE303.2', 52, 13, 1855787),
(695, 'CSE303.3', 82, 13, 1863951),
(696, 'CSE303.1', 22, 13, 1868128),
(697, 'CSE303.1', 22, 13, 1872128),
(698, 'CSE303.3', 82, 13, 1873255),
(699, 'CSE303.3', 82, 13, 1877262),
(700, 'CSE303.2', 52, 5, 1886577),
(701, 'CSE303.3', 82, 5, 1887973),
(702, 'CSE303.1', 22, 13, 1892367),
(703, 'CSE303.2', 52, 0, 1893863),
(704, 'CSE303.3', 82, 13, 1898334),
(705, 'CSE303.1', 23, 11, 1416455),
(706, 'CSE303.3', 83, 8, 1528882),
(707, 'CSE303.1', 23, 13, 1579288),
(708, 'CSE303.3', 83, 14, 1612985),
(709, 'CSE303.1', 23, 12, 1613273),
(710, 'CSE303.1', 23, 10, 1614142),
(711, 'CSE303.3', 83, 13, 1614733),
(712, 'CSE303.3', 83, 8, 1616161),
(713, 'CSE303.3', 83, 0, 1622731),
(714, 'CSE303.1', 23, 12, 1623112),
(715, 'CSE303.1', 23, 10, 1625654),
(716, 'CSE303.2', 53, 0, 1633554),
(717, 'CSE303.3', 83, 7, 1634352),
(718, 'CSE303.2', 53, 11, 1641252),
(719, 'CSE303.2', 53, 11, 1645333),
(720, 'CSE303.1', 23, 11, 1646434),
(721, 'CSE303.3', 83, 0, 1653725),
(722, 'CSE303.1', 23, 0, 1654432),
(723, 'CSE303.1', 23, 10, 1661638),
(724, 'CSE303.3', 83, 8, 1662147),
(725, 'CSE303.2', 53, 10, 1665491),
(726, 'CSE303.1', 23, 13, 1665555),
(727, 'CSE303.2', 53, 11, 1668314),
(728, 'CSE303.3', 83, 0, 1669953),
(729, 'CSE303.3', 83, 8, 1674181),
(730, 'CSE303.3', 83, 13, 1678812),
(731, 'CSE303.1', 23, 10, 1686272),
(732, 'CSE303.2', 53, 10, 1691291),
(733, 'CSE303.3', 83, 12, 1691483),
(734, 'CSE303.2', 53, 9, 1695837),
(735, 'CSE303.1', 23, 13, 1696326),
(736, 'CSE303.1', 23, 11, 1711619),
(737, 'CSE303.1', 23, 13, 1711729),
(738, 'CSE303.2', 53, 10, 1712983),
(739, 'CSE303.1', 23, 12, 1715578),
(740, 'CSE303.3', 83, 9, 1718437),
(741, 'CSE303.2', 53, 8, 1728125),
(742, 'CSE303.3', 83, 7, 1728139),
(743, 'CSE303.1', 23, 12, 1728439),
(744, 'CSE303.3', 83, 15, 1729416),
(745, 'CSE303.2', 53, 10, 1731817),
(746, 'CSE303.3', 83, 11, 1731852),
(747, 'CSE303.3', 83, 13, 1736425),
(748, 'CSE303.3', 83, 15, 1737824),
(749, 'CSE303.3', 83, 8, 1742892),
(750, 'CSE303.2', 53, 11, 1743714),
(751, 'CSE303.1', 23, 0, 1745484),
(752, 'CSE303.1', 23, 12, 1747457),
(753, 'CSE303.3', 83, 11, 1752538),
(754, 'CSE303.2', 53, 15, 1754681),
(755, 'CSE303.2', 53, 0, 1759787),
(756, 'CSE303.2', 53, 11, 1762565),
(757, 'CSE303.2', 53, 0, 1763881),
(758, 'CSE303.1', 23, 10, 1766156),
(759, 'CSE303.3', 83, 10, 1766176),
(760, 'CSE303.2', 53, 11, 1768463),
(761, 'CSE303.2', 53, 0, 1769463),
(762, 'CSE303.3', 83, 11, 1772947),
(763, 'CSE303.2', 53, 13, 1773277),
(764, 'CSE303.2', 53, 11, 1773384),
(765, 'CSE303.1', 23, 9, 1778274),
(766, 'CSE303.3', 83, 8, 1781682),
(767, 'CSE303.2', 53, 12, 1783512),
(768, 'CSE303.2', 53, 11, 1784847),
(769, 'CSE303.1', 23, 13, 1788337),
(770, 'CSE303.2', 53, 10, 1789481),
(771, 'CSE303.2', 53, 11, 1791753),
(772, 'CSE303.1', 23, 10, 1795656),
(773, 'CSE303.2', 53, 11, 1797625),
(774, 'CSE303.3', 83, 12, 1797789),
(775, 'CSE303.1', 23, 12, 1798883),
(776, 'CSE303.2', 53, 8, 1834433),
(777, 'CSE303.3', 83, 15, 1835298),
(778, 'CSE303.2', 53, 11, 1835874),
(779, 'CSE303.2', 53, 11, 1842333),
(780, 'CSE303.1', 23, 0, 1845457),
(781, 'CSE303.3', 83, 11, 1849651),
(782, 'CSE303.2', 53, 14, 1855787),
(783, 'CSE303.3', 83, 15, 1863951),
(784, 'CSE303.1', 23, 11, 1868128),
(785, 'CSE303.1', 23, 15, 1872128),
(786, 'CSE303.3', 83, 13, 1873255),
(787, 'CSE303.3', 83, 15, 1877262),
(788, 'CSE303.2', 53, 14, 1886577),
(789, 'CSE303.3', 83, 10, 1887973),
(790, 'CSE303.1', 23, 13, 1892367),
(791, 'CSE303.2', 53, 0, 1893863),
(792, 'CSE303.3', 83, 11, 1898334),
(793, 'CSE303.1', 24, 28, 1416455),
(794, 'CSE303.3', 84, 13, 1528882),
(795, 'CSE303.1', 24, 23, 1579288),
(796, 'CSE303.3', 84, 21, 1612985),
(797, 'CSE303.1', 24, 4, 1613273),
(798, 'CSE303.1', 24, 26, 1614142),
(799, 'CSE303.3', 84, 9, 1614733),
(800, 'CSE303.3', 84, 15, 1616161),
(801, 'CSE303.3', 84, 0, 1622731),
(802, 'CSE303.1', 24, 12, 1623112),
(803, 'CSE303.1', 24, 4, 1625654),
(804, 'CSE303.2', 54, 0, 1633554),
(805, 'CSE303.3', 84, 13, 1634352),
(806, 'CSE303.2', 54, 22, 1641252),
(807, 'CSE303.2', 54, 18, 1645333),
(808, 'CSE303.1', 24, 26, 1646434),
(809, 'CSE303.3', 84, 0, 1653725),
(810, 'CSE303.1', 24, 26, 1654432),
(811, 'CSE303.1', 24, 13, 1661638),
(812, 'CSE303.3', 84, 4, 1662147),
(813, 'CSE303.2', 54, 6, 1665491),
(814, 'CSE303.1', 24, 4, 1665555),
(815, 'CSE303.2', 54, 27, 1668314),
(816, 'CSE303.3', 84, 0, 1669953),
(817, 'CSE303.3', 84, 6, 1674181),
(818, 'CSE303.3', 84, 19, 1678812),
(819, 'CSE303.1', 24, 26, 1686272),
(820, 'CSE303.2', 54, 17, 1691291),
(821, 'CSE303.3', 84, 4, 1691483),
(822, 'CSE303.2', 54, 25, 1695837),
(823, 'CSE303.1', 24, 26, 1696326),
(824, 'CSE303.1', 24, 11, 1711619),
(825, 'CSE303.1', 24, 6, 1711729),
(826, 'CSE303.2', 54, 30, 1712983),
(827, 'CSE303.1', 24, 26, 1715578),
(828, 'CSE303.3', 84, 21, 1718437),
(829, 'CSE303.2', 54, 20, 1728125),
(830, 'CSE303.3', 84, 14, 1728139),
(831, 'CSE303.1', 24, 20, 1728439),
(832, 'CSE303.3', 84, 5, 1729416),
(833, 'CSE303.2', 54, 8, 1731817),
(834, 'CSE303.3', 84, 22, 1731852),
(835, 'CSE303.3', 84, 27, 1736425),
(836, 'CSE303.3', 84, 6, 1737824),
(837, 'CSE303.3', 84, 2, 1742892),
(838, 'CSE303.2', 54, 12, 1743714),
(839, 'CSE303.1', 24, 0, 1745484),
(840, 'CSE303.1', 24, 19, 1747457),
(841, 'CSE303.3', 84, 18, 1752538),
(842, 'CSE303.2', 54, 29, 1754681),
(843, 'CSE303.2', 54, 0, 1759787),
(844, 'CSE303.2', 54, 17, 1762565),
(845, 'CSE303.2', 54, 0, 1763881),
(846, 'CSE303.1', 24, 6, 1766156),
(847, 'CSE303.3', 84, 18, 1766176),
(848, 'CSE303.2', 54, 21, 1768463),
(849, 'CSE303.2', 54, 0, 1769463),
(850, 'CSE303.3', 84, 15, 1772947),
(851, 'CSE303.2', 54, 18, 1773277),
(852, 'CSE303.2', 54, 18, 1773384),
(853, 'CSE303.1', 24, 22, 1778274),
(854, 'CSE303.3', 84, 18, 1781682),
(855, 'CSE303.2', 54, 28, 1783512),
(856, 'CSE303.2', 54, 27, 1784847),
(857, 'CSE303.1', 24, 20, 1788337),
(858, 'CSE303.2', 54, 21, 1789481),
(859, 'CSE303.2', 54, 15, 1791753),
(860, 'CSE303.1', 24, 19, 1795656),
(861, 'CSE303.2', 54, 19, 1797625),
(862, 'CSE303.3', 84, 12, 1797789),
(863, 'CSE303.1', 24, 19, 1798883),
(864, 'CSE303.2', 54, 25, 1834433),
(865, 'CSE303.3', 84, 5, 1835298),
(866, 'CSE303.2', 54, 19, 1835874),
(867, 'CSE303.2', 54, 15, 1842333),
(868, 'CSE303.1', 24, 0, 1845457),
(869, 'CSE303.3', 84, 9, 1849651),
(870, 'CSE303.2', 54, 15, 1855787),
(871, 'CSE303.3', 84, 9, 1863951),
(872, 'CSE303.1', 24, 27, 1868128),
(873, 'CSE303.1', 24, 24, 1872128),
(874, 'CSE303.3', 84, 7, 1873255),
(875, 'CSE303.3', 84, 9, 1877262),
(876, 'CSE303.2', 54, 22, 1886577),
(877, 'CSE303.3', 84, 15, 1887973),
(878, 'CSE303.1', 24, 34, 1892367),
(879, 'CSE303.2', 54, 0, 1893863),
(880, 'CSE303.3', 84, 26, 1898334),
(881, 'CSE303.1', 31, 24, 1416455),
(882, 'CSE303.3', 91, 6, 1528882),
(883, 'CSE303.1', 31, 23, 1579288),
(884, 'CSE303.3', 91, 12, 1612985),
(885, 'CSE303.1', 31, 12, 1613273),
(886, 'CSE303.1', 31, 12, 1614142),
(887, 'CSE303.3', 91, 10, 1614733),
(888, 'CSE303.3', 91, 0, 1616161),
(889, 'CSE303.3', 91, 0, 1622731),
(890, 'CSE303.1', 31, 12, 1623112),
(891, 'CSE303.1', 31, 24, 1625654),
(892, 'CSE303.2', 61, 0, 1633554),
(893, 'CSE303.3', 91, 12, 1634352),
(894, 'CSE303.2', 61, 34, 1641252),
(895, 'CSE303.2', 61, 23, 1645333),
(896, 'CSE303.1', 31, 12, 1646434),
(897, 'CSE303.3', 91, 0, 1653725),
(898, 'CSE303.1', 31, 25, 1654432),
(899, 'CSE303.1', 31, 20, 1661638),
(900, 'CSE303.3', 91, 9, 1662147),
(901, 'CSE303.2', 61, 23, 1665491),
(902, 'CSE303.1', 31, 27, 1665555),
(903, 'CSE303.2', 61, 11, 1668314),
(904, 'CSE303.3', 91, 0, 1669953),
(905, 'CSE303.3', 91, 11, 1674181),
(906, 'CSE303.3', 91, 23, 1678812),
(907, 'CSE303.1', 31, 12, 1686272),
(908, 'CSE303.2', 61, 30, 1691291),
(909, 'CSE303.3', 91, 6, 1691483),
(910, 'CSE303.2', 61, 24, 1695837),
(911, 'CSE303.1', 31, 12, 1696326),
(912, 'CSE303.1', 31, 27, 1711619),
(913, 'CSE303.1', 31, 0, 1711729),
(914, 'CSE303.2', 61, 23, 1712983),
(915, 'CSE303.1', 31, 26, 1715578),
(916, 'CSE303.3', 91, 19, 1718437),
(917, 'CSE303.2', 61, 11, 1728125),
(918, 'CSE303.3', 91, 9, 1728139),
(919, 'CSE303.1', 31, 22, 1728439),
(920, 'CSE303.3', 91, 19, 1729416),
(921, 'CSE303.2', 61, 34, 1731817),
(922, 'CSE303.3', 91, 0, 1731852),
(923, 'CSE303.3', 91, 9, 1736425),
(924, 'CSE303.3', 91, 19, 1737824),
(925, 'CSE303.3', 91, 23, 1742892),
(926, 'CSE303.2', 61, 11, 1743714),
(927, 'CSE303.1', 31, 0, 1745484),
(928, 'CSE303.1', 31, 27, 1747457),
(929, 'CSE303.3', 91, 0, 1752538),
(930, 'CSE303.2', 61, 23, 1754681),
(931, 'CSE303.2', 61, 0, 1759787),
(932, 'CSE303.2', 61, 31, 1762565),
(933, 'CSE303.2', 61, 0, 1763881),
(934, 'CSE303.1', 31, 0, 1766156),
(935, 'CSE303.3', 91, 0, 1766176),
(936, 'CSE303.2', 61, 11, 1768463),
(937, 'CSE303.2', 61, 0, 1769463),
(938, 'CSE303.3', 91, 0, 1772947),
(939, 'CSE303.2', 61, 23, 1773277),
(940, 'CSE303.2', 61, 25, 1773384),
(941, 'CSE303.1', 31, 27, 1778274),
(942, 'CSE303.3', 91, 11, 1781682),
(943, 'CSE303.2', 61, 11, 1783512),
(944, 'CSE303.2', 61, 34, 1784847),
(945, 'CSE303.1', 31, 23, 1788337),
(946, 'CSE303.2', 61, 34, 1789481),
(947, 'CSE303.2', 61, 34, 1791753),
(948, 'CSE303.1', 31, 25, 1795656),
(949, 'CSE303.2', 61, 11, 1797625),
(950, 'CSE303.3', 91, 9, 1797789),
(951, 'CSE303.1', 31, 20, 1798883),
(952, 'CSE303.2', 61, 31, 1834433),
(953, 'CSE303.3', 91, 17, 1835298),
(954, 'CSE303.2', 61, 31, 1835874),
(955, 'CSE303.2', 61, 25, 1842333),
(956, 'CSE303.1', 31, 0, 1845457),
(957, 'CSE303.3', 91, 12, 1849651),
(958, 'CSE303.2', 61, 23, 1855787),
(959, 'CSE303.3', 91, 20, 1863951),
(960, 'CSE303.1', 31, 27, 1868128),
(961, 'CSE303.1', 31, 27, 1872128),
(962, 'CSE303.3', 91, 24, 1873255),
(963, 'CSE303.3', 91, 24, 1877262),
(964, 'CSE303.2', 61, 30, 1886577),
(965, 'CSE303.3', 91, 24, 1887973),
(966, 'CSE303.1', 31, 29, 1892367),
(967, 'CSE303.2', 61, 0, 1893863),
(968, 'CSE303.3', 91, 19, 1898334);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `sectionID` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_of_exams` tinyint(4) NOT NULL,
  `enrolled` tinyint(4) NOT NULL,
  `facultyID` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `termID` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`sectionID`, `num_of_exams`, `enrolled`, `facultyID`, `termID`) VALUES
('CSE303.1', 3, 30, '44100723', 211),
('CSE303.2', 3, 30, '44101322', 211),
('CSE303.3', 3, 30, '44199791', 211);

-- --------------------------------------------------------

--
-- Table structure for table `segment`
--

CREATE TABLE `segment` (
  `segment` int(10) UNSIGNED NOT NULL,
  `schoolID` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deptID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `programID` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `termID` tinyint(3) UNSIGNED NOT NULL,
  `enrolled` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` mediumint(9) NOT NULL,
  `student_name` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `student_name`, `contact`) VALUES
(1416455, 'Not Available', '1416455@iub.edu.bd'),
(1528882, 'Not Available', '1528882@iub.edu.bd'),
(1579288, 'Not Available', '1579288@iub.edu.bd'),
(1612985, 'Not Available', '1612985@iub.edu.bd'),
(1613273, 'Not Available', '1613273@iub.edu.bd'),
(1614142, 'Not Available', '1614142@iub.edu.bd'),
(1614733, 'Not Available', '1614733@iub.edu.bd'),
(1616161, 'Not Available', '1616161@iub.edu.bd'),
(1622731, 'Not Available', '1622731@iub.edu.bd'),
(1623112, 'Not Available', '1623112@iub.edu.bd'),
(1625654, 'Not Available', '1625654@iub.edu.bd'),
(1633554, 'Not Available', '1633554@iub.edu.bd'),
(1634352, 'Not Available', '1634352@iub.edu.bd'),
(1641252, 'Not Available', '1641252@iub.edu.bd'),
(1645333, 'Not Available', '1645333@iub.edu.bd'),
(1646434, 'Not Available', '1646434@iub.edu.bd'),
(1653725, 'Not Available', '1653725@iub.edu.bd'),
(1654432, 'Not Available', '1654432@iub.edu.bd'),
(1661638, 'Not Available', '1661638@iub.edu.bd'),
(1662147, 'Not Available', '1662147@iub.edu.bd'),
(1665491, 'Not Available', '1665491@iub.edu.bd'),
(1665555, 'Not Available', '1665555@iub.edu.bd'),
(1668314, 'Not Available', '1668314@iub.edu.bd'),
(1669953, 'Not Available', '1669953@iub.edu.bd'),
(1674181, 'Not Available', '1674181@iub.edu.bd'),
(1678812, 'Not Available', '1678812@iub.edu.bd'),
(1686272, 'Not Available', '1686272@iub.edu.bd'),
(1691291, 'Not Available', '1691291@iub.edu.bd'),
(1691483, 'Not Available', '1691483@iub.edu.bd'),
(1695837, 'Not Available', '1695837@iub.edu.bd'),
(1696326, 'Not Available', '1696326@iub.edu.bd'),
(1711619, 'Not Available', '1711619@iub.edu.bd'),
(1711729, 'Not Available', '1711729@iub.edu.bd'),
(1712983, 'Not Available', '1712983@iub.edu.bd'),
(1715578, 'Not Available', '1715578@iub.edu.bd'),
(1718437, 'Not Available', '1718437@iub.edu.bd'),
(1728125, 'Not Available', '1728125@iub.edu.bd'),
(1728139, 'Not Available', '1728139@iub.edu.bd'),
(1728439, 'Not Available', '1728439@iub.edu.bd'),
(1729416, 'Not Available', '1729416@iub.edu.bd'),
(1731817, 'Not Available', '1731817@iub.edu.bd'),
(1731852, 'Not Available', '1731852@iub.edu.bd'),
(1736425, 'Not Available', '1736425@iub.edu.bd'),
(1737824, 'Not Available', '1737824@iub.edu.bd'),
(1742892, 'Not Available', '1742892@iub.edu.bd'),
(1743714, 'Not Available', '1743714@iub.edu.bd'),
(1745484, 'Not Available', '1745484@iub.edu.bd'),
(1747457, 'Not Available', '1747457@iub.edu.bd'),
(1752538, 'Not Available', '1752538@iub.edu.bd'),
(1754681, 'Not Available', '1754681@iub.edu.bd'),
(1759787, 'Not Available', '1759787@iub.edu.bd'),
(1762565, 'Not Available', '1762565@iub.edu.bd'),
(1763881, 'Not Available', '1763881@iub.edu.bd'),
(1766156, 'Not Available', '1766156@iub.edu.bd'),
(1766176, 'Not Available', '1766176@iub.edu.bd'),
(1768463, 'Not Available', '1768463@iub.edu.bd'),
(1769463, 'Not Available', '1769463@iub.edu.bd'),
(1772947, 'Not Available', '1772947@iub.edu.bd'),
(1773277, 'Not Available', '1773277@iub.edu.bd'),
(1773384, 'Not Available', '1773384@iub.edu.bd'),
(1778274, 'Not Available', '1778274@iub.edu.bd'),
(1781682, 'Not Available', '1781682@iub.edu.bd'),
(1783512, 'Not Available', '1783512@iub.edu.bd'),
(1784847, 'Not Available', '1784847@iub.edu.bd'),
(1788337, 'Not Available', '1788337@iub.edu.bd'),
(1789481, 'Not Available', '1789481@iub.edu.bd'),
(1791753, 'Not Available', '1791753@iub.edu.bd'),
(1795656, 'Not Available', '1795656@iub.edu.bd'),
(1797625, 'Not Available', '1797625@iub.edu.bd'),
(1797789, 'Not Available', '1797789@iub.edu.bd'),
(1798883, 'Not Available', '1798883@iub.edu.bd'),
(1834433, 'Not Available', '1834433@iub.edu.bd'),
(1835298, 'Not Available', '1835298@iub.edu.bd'),
(1835874, 'Not Available', '1835874@iub.edu.bd'),
(1842333, 'Not Available', '1842333@iub.edu.bd'),
(1845457, 'Not Available', '1845457@iub.edu.bd'),
(1849651, 'Not Available', '1849651@iub.edu.bd'),
(1855787, 'Not Available', '1855787@iub.edu.bd'),
(1863951, 'Not Available', '1863951@iub.edu.bd'),
(1868128, 'Not Available', '1868128@iub.edu.bd'),
(1872128, 'Not Available', '1872128@iub.edu.bd'),
(1873255, 'Not Available', '1873255@iub.edu.bd'),
(1877262, 'Not Available', '1877262@iub.edu.bd'),
(1886577, 'Not Available', '1886577@iub.edu.bd'),
(1887973, 'Not Available', '1887973@iub.edu.bd'),
(1892367, 'Not Available', '1892367@iub.edu.bd'),
(1893863, 'Not Available', '1893863@iub.edu.bd'),
(1898334, 'Not Available', '1898334@iub.edu.bd');

-- --------------------------------------------------------

--
-- Table structure for table `syllabus`
--

CREATE TABLE `syllabus` (
  `syllabusID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `num_of_outcomes` tinyint(4) NOT NULL,
  `courseID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `syllabus`
--

INSERT INTO `syllabus` (`syllabusID`, `num_of_outcomes`, `courseID`) VALUES
('1', 6, 'CSE101'),
('10', 5, 'CSE216'),
('11', 4, 'CSE303'),
('12', 6, 'CSE307'),
('13', 6, 'CSE309'),
('14', 7, 'CSE310'),
('15', 7, 'CSE313'),
('16', 5, 'CSE315'),
('17', 7, 'CSE316'),
('18', 5, 'CSE317'),
('19', 4, 'CSE406'),
('2', 7, 'CSE104'),
('20', 5, 'CSE417'),
('21', 6, 'CSE420'),
('22', 7, 'CSE421'),
('23', 5, 'CSE424'),
('24', 8, 'CSE425'),
('25', 5, 'CSE426'),
('26', 5, 'CSE451'),
('27', 5, 'CSE452'),
('28', 4, 'CSE454'),
('29', 4, 'CSE458'),
('3', 6, 'CSE201'),
('30', 7, 'CSE459'),
('31', 7, 'MAT203'),
('32', 6, 'MAT301'),
('4', 5, 'CSE203'),
('5', 5, 'CSE204'),
('6', 7, 'CSE210'),
('7', 2, 'CSE211'),
('8', 3, 'CSE213'),
('9', 5, 'CSE214');

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `termID` tinyint(3) UNSIGNED NOT NULL,
  `year` smallint(6) NOT NULL,
  `trimester` tinyint(4) NOT NULL,
  `enrolled` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`termID`, `year`, `trimester`, `enrolled`) VALUES
(211, 2021, 1, 12031);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `universityID` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `university_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vice_chancellor` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enrolled` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`universityID`, `university_name`, `vice_chancellor`, `enrolled`) VALUES
('IUB', 'Independent University, Bangladesh', 'Dr. Tanweer Hasan', 33782);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment`
--
ALTER TABLE `assessment`
  ADD PRIMARY KEY (`assessmentID`),
  ADD KEY `assessment_sectionid_foreign` (`sectionID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseID`),
  ADD KEY `course_deptid_foreign` (`deptID`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculumID`),
  ADD KEY `curriculum_programid_foreign` (`programID`);

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`deptID`),
  ADD KEY `dept_schoolid_foreign` (`schoolID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`facultyID`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `peobjective`
--
ALTER TABLE `peobjective`
  ADD PRIMARY KEY (`peobjectiveID`),
  ADD KEY `peobjective_programid_foreign` (`programID`);

--
-- Indexes for table `ploutcome`
--
ALTER TABLE `ploutcome`
  ADD PRIMARY KEY (`ploutcomeID`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`programID`),
  ADD KEY `prog_fk01` (`deptID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`questionID`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`schoolID`);

--
-- Indexes for table `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`scoreID`),
  ADD KEY `score_sectionid_foreign` (`sectionID`),
  ADD KEY `score_questionid_foreign` (`questionID`),
  ADD KEY `score_studentid_foreign` (`studentID`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`sectionID`),
  ADD KEY `section_facultyid_foreign` (`facultyID`),
  ADD KEY `section_termid_foreign` (`termID`);

--
-- Indexes for table `segment`
--
ALTER TABLE `segment`
  ADD PRIMARY KEY (`segment`),
  ADD KEY `segment_termid_foreign` (`termID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `syllabus`
--
ALTER TABLE `syllabus`
  ADD PRIMARY KEY (`syllabusID`),
  ADD KEY `syllabus_courseid_foreign` (`courseID`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`termID`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`universityID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `peobjective`
--
ALTER TABLE `peobjective`
  MODIFY `peobjectiveID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `segment`
--
ALTER TABLE `segment`
  MODIFY `segment` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assessment`
--
ALTER TABLE `assessment`
  ADD CONSTRAINT `assessment_sectionid_foreign` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`) ON DELETE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_deptid_foreign` FOREIGN KEY (`deptID`) REFERENCES `dept` (`deptID`) ON DELETE CASCADE;

--
-- Constraints for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD CONSTRAINT `curriculum_programid_foreign` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`) ON DELETE CASCADE;

--
-- Constraints for table `dept`
--
ALTER TABLE `dept`
  ADD CONSTRAINT `dept_schoolid_foreign` FOREIGN KEY (`schoolID`) REFERENCES `school` (`schoolID`) ON DELETE CASCADE;

--
-- Constraints for table `peobjective`
--
ALTER TABLE `peobjective`
  ADD CONSTRAINT `peobjective_programid_foreign` FOREIGN KEY (`programID`) REFERENCES `program` (`programID`) ON DELETE CASCADE;

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `prog_fk01` FOREIGN KEY (`deptID`) REFERENCES `dept` (`deptID`);

--
-- Constraints for table `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `score_questionid_foreign` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE,
  ADD CONSTRAINT `score_sectionid_foreign` FOREIGN KEY (`sectionID`) REFERENCES `section` (`sectionID`) ON DELETE CASCADE,
  ADD CONSTRAINT `score_studentid_foreign` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE;

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `section_facultyid_foreign` FOREIGN KEY (`facultyID`) REFERENCES `faculty` (`facultyID`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_termid_foreign` FOREIGN KEY (`termID`) REFERENCES `term` (`termID`) ON DELETE CASCADE;

--
-- Constraints for table `segment`
--
ALTER TABLE `segment`
  ADD CONSTRAINT `segment_termid_foreign` FOREIGN KEY (`termID`) REFERENCES `term` (`termID`) ON DELETE CASCADE;

--
-- Constraints for table `syllabus`
--
ALTER TABLE `syllabus`
  ADD CONSTRAINT `syllabus_courseid_foreign` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
