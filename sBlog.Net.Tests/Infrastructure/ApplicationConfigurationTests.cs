using System.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using sBlog.Net.Configuration;
using sBlog.Net.Infrastructure;

namespace sBlog.Net.Tests.Infrastructure
{
    [TestClass]
    public class ApplicationConfigurationTests
    {
        [TestCategory("Unit"),TestMethod]
        public void CanReadAThemeFromWebConfig()
        {
            var themeSettings = BlogStaticConfig.Theme;
            Assert.IsNotNull(themeSettings);
            Assert.AreEqual("PerfectBlemish", themeSettings.SelectedTheme);
        }

        [TestCategory("Unit"),TestMethod]
        public void CanReadConnectionString()
        {
            var connectionString = ApplicationConfiguration.ConnectionString;
            Assert.IsNotNull(connectionString);
            Assert.AreEqual("Server=localhost;Database=sblog;user id=msuser1;password=msuser1;", connectionString);
        }

        [TestCategory("Unit"),TestMethod]
        public void CanReadHasherTyeFromWebConfig()
        {
            var hasherType = ApplicationConfiguration.HasherTypeName;
            Assert.IsNotNull(hasherType);
            Assert.AreEqual("sBlog.Net.Domain.Hashers.Sha5Hasher", hasherType);
        }

        [TestCategory("Unit"),TestMethod]
        public void CanReadCacheDurationFromWebConfig()
        {
            var cacheDuration = ApplicationConfiguration.CacheDuration;
            Assert.IsNotNull(cacheDuration);
            Assert.AreEqual(15, cacheDuration);
        }

        [TestCategory("Unit"),TestMethod]
        public void CanReadBitlyUserNameFromWebConfig()
        {
            var bitlyName = ApplicationConfiguration.BitlyUserName;
            Assert.IsNotNull(bitlyName);
            Assert.AreEqual("sampleaccount", bitlyName);
        }

        [TestCategory("Unit"),TestMethod]
        public void CanReadBitlyApiKeyFromWebConfig()
        {
            var bitlyKey = ApplicationConfiguration.BitlyApiKey;
            Assert.IsNotNull(bitlyKey);
            Assert.AreEqual("samplekey", bitlyKey);
        }

        private static readonly SblogNetSettingsConfiguration BlogStaticConfig = ConfigurationManager.GetSection("sblognetSettings")
                                                                     as SblogNetSettingsConfiguration;
    }
}
