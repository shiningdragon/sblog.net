using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Configuration;
using System.Net;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.IE;
using OpenQA.Selenium.Remote;

namespace sBlog.Net.FunctionalTests
{
    [TestClass]
    public class BasicFunctionalTests
    {
        private string homePageUrl = ConfigurationManager.AppSettings["sBlogHomePage"];
        private IWebDriver driver;


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

        [TestCategory("Functional"), TestMethod]
        public void TestHomePageAvailable()
        {     
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(homePageUrl);
            request.Method = "GET";

            // This is a temporary fix to ignore ssl errors as I am using self signed certs on deployed websites currently
            request.ServerCertificateValidationCallback += (sender, certificate, chain, sslPolicyErrors) => { return true; };

            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                TestContext.WriteLine("Request to {0} returned with {1}", homePageUrl, response.StatusCode);
                Assert.AreEqual(response.StatusCode, HttpStatusCode.OK);
            }
        }

        [TestCategory("Functional"), TestMethod]
        public void BasicSeleniumTest()
        {
            driver.Navigate().GoToUrl(homePageUrl);
        }

        [TestCleanup()]
        public void TestCleanup()
        {
            driver.Quit();
        }

        [TestInitialize()]
        public void TestInitialise()
        {
            InternetExplorerOptions options = new InternetExplorerOptions();
            options.IgnoreZoomLevel = true;
            driver = new InternetExplorerDriver(".\\Drivers\\", options);
        }
    }
}
