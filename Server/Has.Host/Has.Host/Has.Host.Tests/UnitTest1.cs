using System;
using NUnit.Framework;
using ServiceStack;
using ServiceStack.Testing;
using Has.Host.ServiceModel;
using Has.Host.ServiceInterface;

namespace Has.Host.Tests
{
    [TestFixture]
    public class UnitTests
    {
        private readonly ServiceStackHost appHost;

        public UnitTests()
        {
            
        }

        [OneTimeTearDown]
        public void TestFixtureTearDown()
        {
            appHost.Dispose();
        }

        
    }
}
