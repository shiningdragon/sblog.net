using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Configuration;
using System.Net;

namespace sBlog.Net.FunctionalTests
{
    [TestClass]
    public class BasicFunctionalTests
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

        [TestCategory("Functional"),TestMethod]
        public void TestHomePageAvailable()
        {
            string homePageUrl = ConfigurationManager.AppSettings["sBlogHomePage"];

            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(homePageUrl);
            req.Method = "GET";

            using (HttpWebResponse response = (HttpWebResponse)req.GetResponse())
            {
                TestContext.WriteLine("Request to {0} returned with {1}", homePageUrl, response.StatusCode);
                Assert.AreEqual(response.StatusCode, "OK");
            }
        }
    }
}
