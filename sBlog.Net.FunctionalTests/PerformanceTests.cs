using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Configuration;
using System.Net;
using System.Diagnostics;

namespace sBlog.Net.FunctionalTests
{
    [TestClass]
    public class PerformanceTests
    {
        private TestContext testContextInstance;
        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        [TestCategory("Performance"), TestMethod]
        public void SimplePeformanceTest()
        {
            string homePageUrl = ConfigurationManager.AppSettings["sBlogHomePage"];
            string allowedTime = ConfigurationManager.AppSettings["SimpleTestAllowedTimeSeconds"];
            int thresholdTime = int.Parse(allowedTime);

            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            // Excercise the website using selenium etc

            stopWatch.Stop();
            int totalSeconds = (int)stopWatch.Elapsed.TotalSeconds;
            TestContext.WriteLine("SimplePeformanceTest completed in {0} seconds. Threshold was {1} seconds", totalSeconds, thresholdTime);

            Assert.IsTrue(totalSeconds < thresholdTime);
        }
    }
}
