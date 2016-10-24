﻿#region Disclaimer/License Info

/* *********************************************** */

// sBlog.Net

// sBlog.Net is a minimalistic blog engine software.

// Homepage: http://sblogproject.net
// Github: http://github.com/karthik25/sBlog.Net

// This project is licensed under the BSD license.  
// See the License.txt file for more information.

/* *********************************************** */

#endregion
using System;
using System.Linq;
using sBlog.Net.DB.Services;
using sBlog.Net.DB.Comparers;
using sBlog.Net.DB.Enumerations;
using System.Collections.Generic;
using sBlog.Net.Domain.Interfaces;

namespace sBlog.Net.DB.Helpers
{
    public class SetupStatusGenerator
    {
        private readonly ISchema _schemaRepository;
        private readonly IPathMapper _pathMapper;

        public SetupStatusGenerator(ISchema schemaRepository, IPathMapper pathMapper)
        {
            _schemaRepository = schemaRepository;
            _pathMapper = pathMapper;
        }

        public SetupStatus GetSetupStatus()
        {
            var setupStatus = new SetupStatus();

            setupStatus.StatusCode = SetupStatusCode.NoUpdates;
            setupStatus.Message = "Your instance is up to date!";

            return setupStatus;
        }

        private IEnumerable<SchemaVersion> GetSchemaVersions()
        {
            var allEntries = _schemaRepository.GetSchemaEntries()
                                              .Select(
                                                  e =>
                                                  new SchemaVersion
                                                      {
                                                          MajorVersion = e.MajorVersion,
                                                          MinorVersion = e.MinorVersion,
                                                          ScriptVersion = e.ScriptVersion
                                                      })
                                              .ToList();
            allEntries.Sort(new SchemaVersionComparer());
            return allEntries;
        }
    }
}
