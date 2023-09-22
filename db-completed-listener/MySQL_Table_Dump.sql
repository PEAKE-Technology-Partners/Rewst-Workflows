--
-- Database: `rewst`
--

-- --------------------------------------------------------

--
-- Table structure for table `Rewst_Executions`
--

CREATE TABLE `Rewst_Executions` (
  `Execution_ID` varchar(255) NOT NULL,
  `Workflow_Name` varchar(255) DEFAULT NULL,
  `Workflow_ID` varchar(255)  NOT NULL,
  `Workflow_URL` varchar(255) DEFAULT NULL,
  `Org_Name` varchar(255) DEFAULT NULL,
  `Org_ID` varchar(255) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Time_Saved` double DEFAULT NULL,
  `End_Time` datetime DEFAULT NULL
);
--
-- Indexes for dumped tables
--

--
-- Indexes for table `Rewst_Executions`
--
ALTER TABLE `Rewst_Executions`
  ADD PRIMARY KEY (`Execution_ID`);
COMMIT;
