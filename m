Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D5832825C
	for <linux-coco@lists.linux.dev>; Thu,  4 Dec 2025 21:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884567; cv=fail; b=pp9sL0an8OBwKYfWiNd+tdtDkm4SOBeZdMSiMFA4Kxp4zvtvKtkgzaE2/LsK+wT8XAfugpQTNHfg2BLEk3rBoVxRoGq6gww/Oi9s+MPRoSPputVvHrJ28xFCo44rFjTiAMEZfrcr1v4b/oFFsi2Fb6GDJr7jlr6+j5RJOsZCojo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884567; c=relaxed/simple;
	bh=wcxLlP6/+ws4RQjzusrNbO91Nnx1XzbUe/vWcRYnKek=;
	h=From:Date:To:CC:Message-ID:Subject:Content-Type:MIME-Version; b=F0r0dCDANOxHnPAeCEeaBNd0mNzlQu33AJzV8LYBUNwegoTPokDfvtNkUsQCC92jytR94bV1YYICC1P43QHoPTrqFUO4JzF189FHYLTLq8mmv56wgNciLbcXnaeTXd1H7ay4/dOIYBt9a/UbmxUP/Bcc1ZnlxDPyUeqAA/qJ3as=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wkos3dEg; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wkos3dEg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764884565; x=1796420565;
  h=from:date:to:cc:message-id:subject:
   content-transfer-encoding:mime-version;
  bh=wcxLlP6/+ws4RQjzusrNbO91Nnx1XzbUe/vWcRYnKek=;
  b=Wkos3dEglb1t8j94e5ewK2fKWjNbM+6Y513IPd1itwPqQLZpEhz+rvOi
   ODYME7fhOc++21PMvlLItMKfae2Dh9jT0OJnaLGqGzFjB0pFdesAyZlF4
   adnGc4oQhgEt6wtq+ZPQ0VYDtkrGC9MQShx9Mr2ExfypMsSggb/aiFnuZ
   jpPbtn90OEKHaM+RTlGYf/2kq4fhxrITge2iPQLo4g9tOxJqMvMaEJNyF
   KVmVJyBjfO/YStJQ4vlYUVi2hT4EygLNQk3c4QcgqXjpZsCG/CPiLaQDG
   VvRUvPcT8ewLztVG6z/cVzxEt+qlXhzKeocQg41bd00iMxtfAqDeWzaKq
   A==;
X-CSE-ConnectionGUID: Xgui/g6tSK+hqT62AQSczA==
X-CSE-MsgGUID: m3RwnEUbQjyxb0FTwmfdTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66640182"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66640182"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 13:42:44 -0800
X-CSE-ConnectionGUID: 8CfG/ydFQ6uKSx6i8pGkBw==
X-CSE-MsgGUID: cXjTuPk9RaGTB3IDBjlnGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="195327510"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 13:42:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:42:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 13:42:43 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 13:42:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVAk3Jy6qd5uSIVN0evvhAQTN11zsBZZh5Wjo7e8GZ4F3ttO9pnY6K4LSv8ZGPq+Ka0deAGe03bn1qT4fityb0JS6/SxaJ1cH8JHj7OXCFvKbWspXsUkoQrNAmw76Bjm+KtUD+VwPHhJ5wzVA00fnfnuFY6fa6r2yEVmsf8mzy8uXirWeVsCtLhcF3MalGFeMYtRzafTkqQCd3ofGB7sHsQyTXmBsPmbJ7U4jeXksfg5Khzhv8eWe7yMILoe7Ocwlc2sDPevjnmM6TSM1uQqYT/rcyUXRM8XpbtlFRXSCjq9A2QecWvr5wo0aqUC0MSLQvF1iW2oNH6DyrX9eJJOkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcxLlP6/+ws4RQjzusrNbO91Nnx1XzbUe/vWcRYnKek=;
 b=KkrBBGtSgSMORpl/+v1fpncsfWiWZ24Stydf+rSA2Or3K6vTT5K1p+h8NWCtwGyyFQTBm4pXlD7/VYp5lRJJbqXQdP0Xtf9GSHkKOfMpg746roxpiEOc6wzDxapC134WZ6O157qgamoAKAd+6zMH1xxbaZEYaFw9kKI+15KUsfwaOiXZYAenyRP+ddkl9I81Rp4wDpQZ1wv1ypAlVCQIFMEaCFDzD+F/OVg4QuGEf8E/mQwsd98v483PBbUDakgFq4uU39eEkIHcr572pHomBTIZnI9BLiP4JmncEVR/xwHD0iFvZnyJLsOapVUwRYGJkOigSDSNWWabx3Npexq1gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:42:41 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::1ff:1e09:994b:21ff%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 21:42:41 +0000
From: <dan.j.williams@intel.com>
Date: Thu, 4 Dec 2025 13:42:39 -0800
To: <linux-coco@lists.linux.dev>
CC: <srutherford@google.com>
Message-ID: <6932004f3be7_1b2e100b0@dwillia2-mobl4.notmuch>
Subject: CCC Kernel Sig Thursday night (PST) calls cancelled through New Years
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0347.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: e07af6f5-84f0-4ff6-0bc6-08de337e0ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDFiTlM5N20wSFdGSWkrRFE1QjFZbUpQTzRCZ1c1L2RqNFJmUk9zWncyQ3dH?=
 =?utf-8?B?U2dhTkgzb09ZaFc5Z1hyMUcwQ3pEb2p1VEo2bzBmV3ZLNGEwd1F0aHcwOHF2?=
 =?utf-8?B?ek5QOFRxNHZRbDVSbDZWRjJOb1pqTURpeXhvUFVlK3hGeFEzUnV0OUVuVGlN?=
 =?utf-8?B?TU1UYnNpMmxvTms4cksvamFpV210RVM3d25NcXZDM1NrQzVIdlY3MUR5NlRm?=
 =?utf-8?B?UldGamJPTmpuQ0pmS2RORG0yeW40UzBKb2Zuakp4MVVSNjJpKzRyMnNKTjJn?=
 =?utf-8?B?NXEyRFpTdXVyanh6amRDNFZJOFZ1VUxGdnRxQUFack80RjR0M3BCbVEyYU1E?=
 =?utf-8?B?VTlwWmFhMTRmd1BHdEd1YldmZ0wxZ0p0bWVLb2pkbk1hSm5LT1Njb01ZbUVr?=
 =?utf-8?B?UWkvOE5lcW0yd1R5WHdFSFdiZXgzUExZTXFRUHFaaDFPeTJsczVRWXpMMnhz?=
 =?utf-8?B?N0FjeVB3b3JLd3pUNzlaa3VmY0F0RHFxRDBwQ1hLdkdaTzhIQnQ5b3RheXVY?=
 =?utf-8?B?RnZlRXB2UU1CdGJlMFRYOEt5YTFhNFVja0FWUGdQc2dROFpPdW91KzBTc2xW?=
 =?utf-8?B?TUdaSnpqOGtwZWZ0U0wrUWw3OThuWWNsb0JlL1dqS0hpd3RZbmRHNWxNak5K?=
 =?utf-8?B?cFkzUzEzMHVnMktYeFFrdDBTcnBFYVd0a2VKaDBBQXltck5jbm42RTc5VFAv?=
 =?utf-8?B?SDB1dFdzQzBwTG5BemV6cmFxRllMUlI3NE9KTTE5WWFsUWthQytMUmkxUDVp?=
 =?utf-8?B?Y05PZ2dNNEhHanJ4TFRxa3FmaDlKdVhNUEpZRitTWEtkT2NoTmwybVRCNENE?=
 =?utf-8?B?eDRlZXNhL0E5WmptS3FkakJ0RDFoSHZGcGRPTEQrRm91WnMydExMYTd6Qm9r?=
 =?utf-8?B?MEJxcjNhY2d2WW9wNEVYb1VHdXg2dWtSN3ViMWhyaUc3MjBhRm9XTnBIUkZa?=
 =?utf-8?B?MnV3ckhWYjZIZ1duRWo4akRzVURsa0pYc25FNEMvZEJvbnQ5LzFJN3pKdUVw?=
 =?utf-8?B?WWdJcUVuRUZQZDZQUjV1ZHFLRUM5Zm5XU0swZDdhc3EwcEJ3YmhGTGxZbGc1?=
 =?utf-8?B?eWQ3alh6SitKOFBaTjV1WFEwT2oxUzhZSHNDdGk4MEt6VGc5VG5YaVczR0lU?=
 =?utf-8?B?aTJxdHVxVW9KUGF6ZzBaVDVIK1ZKTnd4MWY2VHRyT0FrZzA3b0RST0VZN0V3?=
 =?utf-8?B?VXY5ajRYWFovcHM4RTZaQ0t6dzhRQmFUbklPbHkveGZETlhaQ2RoSVBSSVQ3?=
 =?utf-8?B?c0pnTURNaEFib2hGSVk4d0pEdWhKb2V6TGN5cGlOemtJWTEwL0NoZWlHeGZq?=
 =?utf-8?B?bEFWRFdXSGdiUDY5TmV6dDUxR09kYnhVQWJqWlNGMFgvNXY1V3F3N3JkUDhn?=
 =?utf-8?B?TzB2cHZva2M5a0dldTQ3RUx5djhYWitkMDZ1K3hDMWhWUTdLYzBGVTVobHB1?=
 =?utf-8?B?YTlVYmdXUXJkMWUzdElGVURDNm85OXRDeGlqUEFvd1lUc2Z5ZnJreThvUHpO?=
 =?utf-8?B?WkJsV01yVVlCVmc3M1VTaXJhQ3lDR09mK29GdHY4dkVYMkt6OFQvNnplYis4?=
 =?utf-8?B?a1BHSlhndFQ5VEhORUZteE5RNnhGTzQrMG4xS0pZSHpoWi9lMkJuT0FTZGVu?=
 =?utf-8?B?azlJQzhDQTlXeFlIalpWdmpaUXUzYmxZc2dhWE5KTzc2RXpyeXVWcUY3MVZC?=
 =?utf-8?B?aDIycytxditZNlhtb2FXUGg1VnZ1OGVaWHpGZUw5bndUY1ZpMzNNVjNrdXZK?=
 =?utf-8?B?c0twcGkrZFN0TjRWajZEOSttd0JZdjRmenVGZ3pEbk8zYWJjRFNuVm8xbUto?=
 =?utf-8?B?TUFjbkJPL2JxYkdkVC9vcHF1dHBpSzJLaXN0LzBZL0k2MnFFaXE3MzdTaHEx?=
 =?utf-8?B?UXRpOXdXdnd6QmI0UklRam1rQVg0YnUyWENvbWwwYTR2bis4cXYrdFcrcmhZ?=
 =?utf-8?Q?iEiSKPrw5Tt73XU8tHD7/Gri63WRYOEo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFZeVVmUWJyNlI5R0E5bG5Tb2tOaU9pdm9ubmk0REJZUnFLM2dtUm5pNEVX?=
 =?utf-8?B?ZFBlRVBnaVpqRWxwbG95RmIyL3lCaHFIa3BLaXZFT3R0YlJtZURWbVJJb3B0?=
 =?utf-8?B?anhGRjRPNHhWblRvMzN4OE9FclR5bHArUFZGMUM2Nk5qWEVuN09veW05Q1RR?=
 =?utf-8?B?RmRBZkMyR3Q0QTZvYkwyQTRWeUNqVnY3THpTcFk1cnFSRzVZeGFNNzJ2TXFL?=
 =?utf-8?B?clArWHBTSnk4UTV5bUFTeUFJdmhscXJsRFE0SlZ2R1c4Wkt3RU5IRmZGU1ZD?=
 =?utf-8?B?NkdVZS9kYzN4YzgranhJYVQ3RXFjSVh3VUlNUUs0ZE5kRXY2czZwZmlzUDI5?=
 =?utf-8?B?RTVVMzZqSjdOSGhYT0FrYXU2em4zdEdoUWZheGlKSHh5Y3hvRzNCU0V0VHlm?=
 =?utf-8?B?eERrME1PZkRYTnJieHpVQ25FK2JuZGVyWFVvZSszditrYTJYRVErc3RYVi9t?=
 =?utf-8?B?b0ptc1d0UnMxcEhVQ2tFejdxNEFFaXpMajRrRzVPSUtNUkdjaC91WHIzQlV3?=
 =?utf-8?B?WmpiR1d0QmxqS3BNci9IdmZsc1BrQlgyQ0lEY3hHZDhBWWROVnZlSUVJUW94?=
 =?utf-8?B?UUkzTXphNTlSeVdkelMzRHVreVVBTmE1eEdHQXNWdjVudXkwRnNZRXRaSzFt?=
 =?utf-8?B?UVVuWEVscyt3aWNmNDBxLzByc1ppVUJXM0RQUkNFYzdqUGdNSjNybW5jR3Rr?=
 =?utf-8?B?ZW96ejJlcnR3Y3pzVkRuZVR3VnI0VmlSSy94bFhDVkNSeXJZMWpDSmQ2MnFT?=
 =?utf-8?B?Z3dpUHluZVpzanNsUmJQTDIzWUw3blJOUmFOWTZvbE9xeTBHR05Bd0NnTU9k?=
 =?utf-8?B?T2NjZUlVR25pSGlYRDlxWUtGaEpzWTJoK09IZ1A3TVZ1eWJtUkJrcFBnMkNM?=
 =?utf-8?B?SytOSWhQN3hVSko4azVvOVRuWWV3a3J0MHBqRWRLU1hLRTVyM2lnTHFaNVFl?=
 =?utf-8?B?d0plYXd1WVVjS3llSy9aaHNGekwvZ1dHWHAvVVR0blo1dmxROHY1WEtmcy9o?=
 =?utf-8?B?dHRDV0ZNY3dDYXVVN1Y5VlNqZUp2TlBCU1BoWGcxYmcxRzFKWVBsWUV4NFJn?=
 =?utf-8?B?Z08vZVovdlF4WnU5U2RYMlVSZTVybW40dVc0QkMzMEo0SjFBZEJRTjFWc3h2?=
 =?utf-8?B?d09xOE1hT2tOTGxzV2JzTzJHUUhvMko5NUNzb2xCbzRaMHp2Uy9JNlZWSGxJ?=
 =?utf-8?B?M3MzV08rZ00wUE9WVkU3Ky9BSW1iaW1jTlhtbkZaeFRXSWlJY0RjZGFpRm43?=
 =?utf-8?B?Q1BkYnVUYjJQc21ZMVlDMGlpNkR1UzVmVXZHelA4OWd3UU9ISzNNdVIwbEZE?=
 =?utf-8?B?UGdBSVNzaWJlVUV1djE4d25heW43NUowaHVQd0UrZjZiVkNISERrTmMzMnJj?=
 =?utf-8?B?WStablNGcXVGa1UrOEozbmJTemE4eXFLd1RVRFFBSU1VaURqak91SjB6dCsx?=
 =?utf-8?B?cjRZc3BWRVV6MUdVWmtzRkRDN1JyUnA2Z0U3Vy9JSWw5MHNFaXhtVENMVzM2?=
 =?utf-8?B?MEZBQjY1blY4SUZIbDcvdXYwYmEyUHVmS2diQkI5L3UrZEZJclQyVnhqd29W?=
 =?utf-8?B?bWdnR0hTcFZJT3VSSDNxN2lDWFNMdXlRSng2MDNDclNlQmJzZzllRUdmekV5?=
 =?utf-8?B?c2lIWFpiRDZQSktVU0IwRXJjcUtMa0lXa0VTMG9wNjBaTGQ3SWU0eVlnd3c4?=
 =?utf-8?B?KzkxdGlkcGgrR2daeGxDQVlBbGtCVGVBOTFyRXQvTGRwaEVtMGdrWDhkUFN0?=
 =?utf-8?B?bHpvNnNaVnoyTDdTWk8weDRGOWpzN2tIRzB4bDVBekh3QUFOcnVjbDAzUlhS?=
 =?utf-8?B?MzNsVDNTbHZuUHRPZS9yUUxzK01uYWlTSU5wMlhVdC95VjBJaTVVTnR0ZlNs?=
 =?utf-8?B?ZW1hRGk0cW80R254YjVXdCs5K1lCQ3BhUnY0eUl5d1N5akIwQXBjMFloeFZh?=
 =?utf-8?B?RkR4cFJvaW9aTWl6Rmt5VWlqTjRKSHFTUG9ZUjBiR0p4c2JqcndLMTVrY1Jz?=
 =?utf-8?B?NEJtLzhaZ282allrMk1pRVJFU1VYUURuaW9Bejk0anYrbGpiaktNSlRKUnZB?=
 =?utf-8?B?blVhUjhEc1JTUWovbGxpdFNxRXVmenhyNllxNU9rdDBKOGN3LzJQTitZTEI0?=
 =?utf-8?B?WXcxSzU0Q2swYXlueiszY05DWnF1K1QzQ2t3UEtIWXRkOUMxajFYYzQ4OTRu?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e07af6f5-84f0-4ff6-0bc6-08de337e0ce2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 21:42:40.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChPKpWQTQaK7VrDYgUEuGsD6awPSx9+lwdoNHIsNtxMcBDHMkgnZAXT5V/ObuUjCLhOles8hzAYxtwp3Qcp/z/g+Y9XIeizMWCfHXWtwdIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
X-OriginatorOrg: intel.com

FYI, the Confidential Computing Consortium meeting titled "Linux Kernel
SIG IOMMUFD Meeting" is cancelled through New Years. We have Plumbers
next week to have productive discussions on next steps, then expect most
folks to disappear for the holidays.

See you at Plumbers next week, either in person or remote!
