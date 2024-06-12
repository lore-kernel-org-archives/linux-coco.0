Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A85533FE
	for <linux-coco@lists.linux.dev>; Wed, 12 Jun 2024 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718187755; cv=fail; b=Hx0iXv+yOhV84idNaxM8swn+pHnYECn94BPqboYi3v9zOM0/2MwpMCpxOiJ8zpyf0I83FuVzqeK5rW3T8uzrh9YjPOGS9KU11y9FnzL3cYWbDddPGAZa05DsrRoirHqE0gO6ElloEsw/i27YcZ/YmFy1ic1ebbl0cYLMks32Gt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718187755; c=relaxed/simple;
	bh=FtCNH6Y4gbal4IUZMDbOH//BRH/KijUimygim7LAjks=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rLFgFM38n4ipwac5+ACzxu66Zz+0Dn4QWNk67l36z+LVa6mFTLezOHZeg/xEk+81m05a9Rl71l6jmuXABrHB4ERcmawR+NCYZPXkgKg6I0llVAQ2BuRaFxo9XY4XA3UVSt6nVRHCNc1/KP6eW1ZNcJbVZ5uf8JfGgR/GApm8Cnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu8RT4wb; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu8RT4wb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718187753; x=1749723753;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FtCNH6Y4gbal4IUZMDbOH//BRH/KijUimygim7LAjks=;
  b=Mu8RT4wbyJ0fOfXHi9ukSHFEdeh3cQMbbo6QSbKoueh1mZAjIow70GKV
   6G1FYBzxo0q22sYoCBC2Nt2TcNYNgEVaTjYK66mZQzJRa24rVYhvZrYDP
   NZyuajO0/ph25rtHsfpkfUxUkW+0eu7vXOIiW1ljyaJDaqVcPxm+xxvYD
   QtMp4kf0FyBudAUJ+BF8me2M1sWGlyzWB0iOBKT1kbFMdup4QhbmVsC3U
   Nk53HBdzRN0z0tgdf+da9U21lPN1BzyaEkHGv2JJiVGT/jrb6ZXEhSV2F
   wn6u/9cjR9uqoiMAIedzbWrgLRsuKuE0thBkfbT9u99DMs9qWswp1/maf
   w==;
X-CSE-ConnectionGUID: 60/0c3rCQQ6Gkq1pWn7REQ==
X-CSE-MsgGUID: FxOWdQYtScmQtxWcapvYkA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14777118"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="14777118"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 03:22:30 -0700
X-CSE-ConnectionGUID: pajVmEFPRjiDMXWdpUUnZg==
X-CSE-MsgGUID: 4aDdgWyERLWowN6JFo0bsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000"; 
   d="scan'208";a="40372604"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jun 2024 03:22:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 03:22:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 03:22:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 03:22:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARSSV30nuQBSXYuetP8N+9JvJC7QJHj8yXxz+ONYGzofOy0PNYRgnrt67037dEIU9mrtCMFckUf/Ztniwn2VQbZS/LmInlh/xzG6gWzpqRJvj2U41McC8RGJdtBgPu/BYO6G2kA1YfP/dfx041NNpyJ3C05LfY/uNWvVQ+eKQgT42VM8LZzQayYaauLQhZcDLAPGQ7i9mJ3uklvMcWmqIzqbZJnR82uIghdu4wpTOkdFce35f2g/+iLILBJ6KW5rE1uP098GqaP4r1jcFUE5OxCvs4iiqAg5Q8xNmo9yHAW+Z6WvlkLvf7ux3VNL+fWZzeY+RbyTI1NS+4W0l57H/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtCNH6Y4gbal4IUZMDbOH//BRH/KijUimygim7LAjks=;
 b=BGww9uCJxf6WLDv8g557KebYTK45GVBpwPAYxRzQ46NSv5vxyfJ0xDSV9fcD/YkNKyWN2SdGk+Qy2crGTSXCeDFIQ9/5DW7os/bfzBKia/NxuoHiPi0+GnHXn1Dc/GiCZ5ImiezMDTdkGeTNAxsZKMeK5A7dx2D6iNIc2Oe+Wv3QiZyG8oslG50qYgmBK7/+RyQKQuW3XgF5JcsIZTn3PFTmMVH6okwMm6qaZen2ZBYHJroYyoARga3P1lTw4gthw/uYf6HaV09jxdKNrHXB+FKeNln6U27qRH3QgByKtwxSA/KweX6k17qk0kfD89wGZCd3sSrZtpvURMeKoCq5hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by DS0PR11MB8229.namprd11.prod.outlook.com (2603:10b6:8:15e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 10:22:22 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%4]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 10:22:22 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: Stefano Garzarella <sgarzare@redhat.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>
CC: "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@hansenpartnership.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "svsm-devel@coconut-svsm.dev"
	<svsm-devel@coconut-svsm.dev>
Subject: RE: [svsm-devel] SVSM Development Call - June 12th, 2024
Thread-Topic: [svsm-devel] SVSM Development Call - June 12th, 2024
Thread-Index: AQHavEBf3aCaoznUJk+xGLBfo0dC37HD5jeAgAADfKA=
Date: Wed, 12 Jun 2024 10:22:22 +0000
Message-ID: <MW4PR11MB587216FC4E6CAFA22A5D56A18CC02@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <18df8b3afe39075dd9ab1211d17db83731d39cdf.camel@ibm.com>
 <CAGxU2F43hwr3pJjS-MdOjyVrZ5tQTG3W==vDTJmgd3YhPKr86Q@mail.gmail.com>
In-Reply-To: <CAGxU2F43hwr3pJjS-MdOjyVrZ5tQTG3W==vDTJmgd3YhPKr86Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|DS0PR11MB8229:EE_
x-ms-office365-filtering-correlation-id: 2a68ddf7-4489-411e-4b1d-08dc8ac98c3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?utf-8?B?eEpDWTZvTm10cnRjelBmRnNCSWZKYy9ESVkxZU8zQWQyM2NQcWQwNDFFMkE0?=
 =?utf-8?B?cXVxU1JlRS9Kakp3QksvY1p6RmJSS0VPZ0dxODhjRzFTaE53R0dPaHlTL1BP?=
 =?utf-8?B?MDg2a1NwV3hGYTRVeHpVMDdmb3NEM3hXaEhodlRxSmY1Z0dQYTN6czdWZVBt?=
 =?utf-8?B?Zm8rZUFnVUJhbStKTmlqVWlGRllwdmc3elN1OTRveXV0M2I0VGRMTnFtZDZm?=
 =?utf-8?B?UEpLTndRMmtnSmRZODJYbEV2VVh0ZExVVGhhVmYzcEs2RFRYOFN5a1NIWmh4?=
 =?utf-8?B?aS9MWjJNQ2d0SXVLR1FFZDcyZ25QYisxSzBWNHRUNGdqL1kyQjYxaHVUaTND?=
 =?utf-8?B?TjMwQVJrSUFDV0Rka2VkRTMvZjBvZWhVbzZlU0ZBdEUrTHg4ZVN6MjFmcmd6?=
 =?utf-8?B?QVFjQTB3T21sS3QxOVFQWTdRajZGdDFlaVhuNWltQTRPK3RwS2NlalBkZ2I5?=
 =?utf-8?B?OU14b1Y5bThHaC9GVXlhenI4aUh6Z01SWUJIdktzV21GMHVZZ0FLTEJwUjdD?=
 =?utf-8?B?UjJQUFJqUU5hdk9WNXRDSWdtd2FIcVIreWVwWW44SzBJWXJtTnV0VC9sUFJ1?=
 =?utf-8?B?VzZpTEUvQXRJNGZTanlubEVoYWJaWjlpT2Z5NThXaVBYeVBLeUJCSGFQOVhP?=
 =?utf-8?B?NVcreUpESmFNVlM2cTdxVk1NaVZnRFVBQVJJLzVBbllNWnp3eFRLeWE2d1gw?=
 =?utf-8?B?ekkrR1VPVjV1ak5HMWsrb05EZ1ozWkRxNy94YjFlazlSN0xGb0t2TUxFdHVO?=
 =?utf-8?B?bzE0WUZGcWpJdTdzdy8yTFZGYnNIMUEwR0U2R2VsN3dJa2EwVGY4WHI2YTZX?=
 =?utf-8?B?VmtzSHdqTnExV1lEQnZhcjJSd1JpUkVQYjM4T3BPdXlPc1U2S0kxQkRSSlBH?=
 =?utf-8?B?dlloK1ZVN1grcnQ5MDVQUFhjYzFFa0R3WjVWSUN4aVRxbEkrRlNuN0ZwTVRw?=
 =?utf-8?B?eVR0cCtDS3loYUpnejlYanNDalQ5V2VPaU1tTE1OMytYVXY2VjVJaTZqSWNa?=
 =?utf-8?B?NGZUSzl6ZHZYd2x6WFM5RUJLaGJSTWF6TGVtdnJtMVgrenM0MG9ZeHNtYndk?=
 =?utf-8?B?S0ZGT3JJQzRuYzF3SDFPWjcydjhaSjU4NHdzNjBUVkR2eGhRYmxCTGYxNmpK?=
 =?utf-8?B?WWhsVUdJajRsMVNHVmZyYWNJVmowbjBId0taYW5hMmk0SmlBN3VQK0pDWWVw?=
 =?utf-8?B?TS9qSnl4Z0IvaHJRaVVzTjc1ZXdDMXlsTjRLRzhsV3lkOUVmZmx6OS93S2I1?=
 =?utf-8?B?M1M0ZjFOdllQQnpNREYyMzlJbGh2WTVBbkxaL0pBN2E4RTMyYUVDelppZG1H?=
 =?utf-8?B?TjBRQURyNmRmMnFUYTBTMGJkMHpUSWxSczFWVnd4RWJMZXFENTJNZmYvdThD?=
 =?utf-8?B?WnJBVVdtc1IyUEFqYlJTWkdHa2RCTTgwaXpqZ01MSEFqcnc5ZFR3T0ZBbk14?=
 =?utf-8?B?K2hEWXRnVTdXcHBOMmRhczBYYzJBTWUyS0lVaXl6VXM5K0lic2tPSzBLbndJ?=
 =?utf-8?B?VFI0TVEyZytOdUlrUS9zTzJ3M0VGUkZEb1dqYWo4K2NjSVJFU3M5ckdxV0hu?=
 =?utf-8?B?cGxJbHc5QytHeTVZV1o0dkZCMWpYb1gybVB3SnVSTEtOWUw2MEJ2UDA0N3FZ?=
 =?utf-8?B?WTJBMU1hYWxsUlZvK283N0VnTmJVMklGcmVpaER3NVZQdWdyN0V5eVBEMUNr?=
 =?utf-8?B?bisvUW9VclpGZEFEWUxtQ1NwaTJTd2NCdmY5cmJWNElVR1hUUlZ0MThaR21v?=
 =?utf-8?Q?ULtCyq81GgD03OwVcg1sx/ERPcu6m6fuVZAMg9M?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1I3OU9BSmhKVFVpRjhXYWtYM2hDRjdFREE1NFhrM2IwanRNSkFDbEFiTXl5?=
 =?utf-8?B?M1dFSVdXTTBUWDNWa0dVS293VlVxOGI4MS91R2ZzZlNlWWNEUS9TVENvUHNI?=
 =?utf-8?B?Um9WcFlORFRFa3lLRVF5TnkyUE5KcDZtUnI3SzlyWnRQZnc0Mkl3TlZRaFpK?=
 =?utf-8?B?a1R5a1hlWFlLVE51Yi9KWUZ0bTBqM3lXNUJTN052Z1F3aWJkczUwREFMd3ZJ?=
 =?utf-8?B?empONlh6ZnFPTW43OUcxOFRERVlmNTJVcTdkVzcvVTh5UDRrNkpTRE1SaG0v?=
 =?utf-8?B?WjJpRWJoU3NsVCtNUEFROUhnb2d3ZUlIV2lrcmJXMk96THJFNURwUmdMOWt2?=
 =?utf-8?B?N0JHZlNQazlqUVFDSGJXdDFhRUZtc1ZNOEE5RThObnBZS0pjcnpmUG5mWVkw?=
 =?utf-8?B?VE1VbzJGWW1wOUNYR3lGZUxGQ3k5dUNzWGhHbVU1eGJkMjlNSlBHN0JWUUVm?=
 =?utf-8?B?K0IvM0JCamg1d3MyZjhCZHB1UkZaaVJKRjlpVFZVUlZ2ck42QytTdkV4TEM3?=
 =?utf-8?B?YzMwMVMwOWlMaGxrRURtOTlQakdrWmNXd1hqWk1EUXQ4WXBWUkpnVzZiMnp3?=
 =?utf-8?B?aDQ3SXhvSStsOTZubFQzT1ZNN1lmcFVCcTZzZWkySkZHNXJpYlFmcjBqU21T?=
 =?utf-8?B?UjNvY3FOdFc5OWNlQTlCYUpHTEVqSEQ3UEc5YWUydkdiaG5LQmk5REJUVStJ?=
 =?utf-8?B?bjUxdktIV3VQL1lPbWF3VUpsZFpkTHJEMEFiY2ZSdGt4cEFwTjJkamtYdE9J?=
 =?utf-8?B?NGJlYjZrMGcvOThPanI0RW9aV1F4cHVWUGFaN3RkUU1pY2ZtTDY5MUdleU0x?=
 =?utf-8?B?VGRHWmE3UXpSU3A3WG9QekM3bWxPRzVXOThHVW8zeUFrTVp4MlBiaGVWQ1lC?=
 =?utf-8?B?NHZCY0p0SWlJbU4vd0huNWU0QjB4bDcydFhyQmJXL3BZT2NlckN5WWZ6VC9l?=
 =?utf-8?B?L1lVSEcweFVJa21ndWVjSW4vTjBHRFBVdjRyd0M1VWNPUU9XQXF2TUFZWkZp?=
 =?utf-8?B?Q1p4ZkpheHpQY0hZazlidmovNTRGRkVhMTdreGRaNUtQTUZ2UzZ0b0lJQlk2?=
 =?utf-8?B?Tmk2VmlRMmZodzg0Q0E2cWdxYkVzWWQwanZpN0hNejQ3bjJteHZUOWIrTnR6?=
 =?utf-8?B?L3NzRDIzcjNTeE9NZHZud01DUlNrcnFyQ2xyYW5IMHZ3TjdIQzJvMDJYU1cz?=
 =?utf-8?B?TTFkaWlDbVhJaHR6dWdnZ0liNVhVOTZHNHdaclk1WW9TcW15SDBURitZL1M3?=
 =?utf-8?B?RWlrMHdjbklNNmRkbS9tcUFkM1J2anFhRWt4TVVITVVDNE02Y3Nsc2RhdTdu?=
 =?utf-8?B?ajFQWDhIdSs1Yk0vQ1FQN0VZT3FhamIzeU84Uk9NTXVyRXE5WkR2UXBDYnJ6?=
 =?utf-8?B?ckdTZk9lSk1WTGE1NkdHRW5FMHR3TFVZZVBMaU9mbEw5UHFqVndTNlJxakpx?=
 =?utf-8?B?bWtEVHV5UStXZjBabXRzYTNzT2tlRWdOK3B6N3Irc2tydFJ1UmhrV3FiY1ls?=
 =?utf-8?B?MDhKeGZUYUczSzdiRFUvUE14NmFtZy84dWViY3hRT28yMEM5bWw3amkvbW5S?=
 =?utf-8?B?S3oyZUFyZGU0MzlGd29udWkvS2ZXcWRyTGEvM0pIQ2Z5STlrRWU4bXdVYlVl?=
 =?utf-8?B?YlVTVEoyaTN1VTNlRGk1VjNzK2hMT0dXSk1FMlhpUHYrY3EyenJobldPQy9N?=
 =?utf-8?B?Ky8vY2hzTFJzVlR1NTN1R3RoVFQrL2Y2Y3FQYWR0cVhZb29SMldCdUp5OE04?=
 =?utf-8?B?cnVNalBnZDlCeHFFMWVsUlRDSnZvQ3ViN2ZkN1NVaC93VFlkd2VORVdaR3J4?=
 =?utf-8?B?akxDNzVpRG0wYTVhMWtad2xSVEtHRUZ6a0hnUUYxdDF0YXVUVE9iV1RJejk2?=
 =?utf-8?B?VzJlTXNvdHFTYjFETTBIOXV0dFludytoT1JwOU0vTWo4U1RRYk9mSHNXb2x2?=
 =?utf-8?B?SmpGQlhoOG95MTJLamVQZkVkU3VrR1U4OXJKdDJHV3VDb3ZXVWVXWlNIREpM?=
 =?utf-8?B?VnQ5cFAvNHNzVlpVM20vdmNVYjFrUGxTNVlEbGZoV3J0MEJBSDBKTHpsOElz?=
 =?utf-8?B?aGx1STNHQ3oycEZYS3BPQkZRVXY4S2VxR3ZnaGdQU3pHMHFCNFRVT05HZVho?=
 =?utf-8?Q?j03fl6vwBKKNkpgw58jQpVadh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5872.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a68ddf7-4489-411e-4b1d-08dc8ac98c3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 10:22:22.5479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aUIbsyrHczGXVXgYZINWdapKZyPg16LMzSOtGHL4iHBNamrZRXO11CPwNSevLMfAaLPx4OgQoKltoRl0b99zRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8229
X-OriginatorOrg: intel.com

Q29tbWVudCBiZWxvdzoNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IFN2c20tZGV2ZWwgPHN2c20tZGV2ZWwtYm91bmNlc0Bjb2NvbnV0LXN2c20uZGV2PiBPbiBCZWhh
bGYgT2YNCj4gU3RlZmFubyBHYXJ6YXJlbGxhDQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVuZSAxMiwg
MjAyNCA2OjAxIFBNDQo+IFRvOiBDbGF1ZGlvIFNpcXVlaXJhIGRlIENhcnZhbGhvIDxjY2xhdWRp
b0BpYm0uY29tPg0KPiBDYzogSmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbTsg
bGludXgtY29jb0BsaXN0cy5saW51eC5kZXY7IHN2c20tDQo+IGRldmVsQGNvY29udXQtc3ZzbS5k
ZXYNCj4gU3ViamVjdDogUmU6IFtzdnNtLWRldmVsXSBTVlNNIERldmVsb3BtZW50IENhbGwgLSBK
dW5lIDEydGgsIDIwMjQNCj4gDQo+IEhpIENsYXVkaW8sDQo+IA0KPiBPbiBUdWUsIEp1biAxMSwg
MjAyNCBhdCAxMDo0NuKAr1BNIENsYXVkaW8gU2lxdWVpcmEgZGUgQ2FydmFsaG8NCj4gPGNjbGF1
ZGlvQGlibS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGksDQo+ID4NCj4gPiBJIHdvdWxkIGxpa2Ug
dG8gYWRkIHR3byB0b3BpY3MgdG8gdGhlIFNWU00gbWVldGluZyBhZ2VuZGE6DQo+IA0KPiBJIHdv
bid0IGJlIGFibGUgdG8gcGFydGljaXBhdGUgaW4gdG9kYXkncyBjYWxsIGJlY2F1c2UgSSdtIG9u
IG15IHdheQ0KPiB0byBCcm5vIGZvciBEZXZDb25mLCBzbyBJIHBvc3QgYSBmZXcgdGhvdWdodHMg
YmVsb3cuDQo+IA0KPiA+DQo+ID4gLSBXaGF0IGRvZXMgVFBNIGxvY2FsaXR5WzFdIG1lYW4gZm9y
IHRoZSBTVlNNIHZUUE0/DQo+IA0KPiBJbnRlcmVzdGluZywgSUlVQyBhbiBleGFtcGxlIGNvdWxk
IGJlIHRvIHVzZSBkaWZmZXJlbnQgImxvY2FsaXRpZXMiDQo+IGZvciBTVlNNIGl0c2VsZiwgZWRr
Miwga2VybmVsLCBldGMuICByaWdodCA/DQoNCltKaWV3ZW5dIFRoZSBtYWluIHVzYWdlIG9mIFRQ
TSBsb2NhbGl0eSBpcyB0byBzdXBwb3J0IERSVE0gbW9kZWwsIGJ1dCBub3QgU1JUTS4NCkkgYW0g
bm90IHN1cmUgdGhlIHZhbHVlIHRvIHN1cHBvcnQgbG9jYWxpdHkgaWYgd2UganVzdCBhZG9wdCBT
UlRNLg0KDQoNCg0KPiANCj4gPiAtIElzIHRoZXJlIGFueSBTVlNNIGJvb3QgZXZlbnQgdGhhdCB3
ZSB3YW50IHRvIHJlY29yZCBpbiB0aGUgVFBNIFBDUnMvRXZlbnQNCj4gbG9nPw0KPiA+IEUuZy4g
YSBTVlNNIGNvbmZpZ3VyYXRpb24sIHRoZSBPVk1GIGhhc2gsIGV0Yw0KPiANCj4gVGFsa2luZyB3
aXRoIERhbmllbCwgaXQgc2VlbXMgdGhhdCBub3cgRURLMiBpcyBzZWxmLW1lYXN1cmluZyBpdHNl
bGYNCj4gaW4gUENSMCwgc28gbWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGRvIHRoaXMgaW4g
U1ZTTS4NCj4gU28gaXQgd291bGQgYmUgbmljZSB0byBoYXZlIFNWU00gbWVhc3VyaW5nIGl0c2Vs
ZiBpbiBQQ1IwLCBTVlNNDQo+IG1lYXN1cmluZyBFREsyIGluIFBDUjAsIGFuZCBFREsyIHN0b3Bw
aW5nIGRvaW5nIGl0Lg0KDQpbSmlld2VuXSBZZXMuIEludGVsIGlzIHdvcmtpbmcgb24gYSBwYXRj
aCB0byBsZXQgU1ZTTSBtZWFzdXJlIEVESzIgT1ZNRiBkaXJlY3RseSB0byBQQ1JbMF0uDQpXaXRo
IHRoaXMgY2hhbmdlLCB0aGUgRURLMiBPVk1GIG92ZXIgU1ZTTSB3aWxsIHNraXAgdGhlIFBDUlsw
XSBtZWFzdXJlbWVudCBidXQgb25seSBjcmVhdGUgZXZlbnQgbG9nLg0KDQoNCg0KPiANCj4gT2J2
aW91c2x5IFNWU00gYW5kIEVESzIgYXJlIGFscmVhZHkgbWVhc3VyZWQgYnkgdGhlIFNOUCBhdHRl
c3RhdGlvbg0KPiByZXBvcnQsIHNvIGl0J3Mgbm90IGEgYmxvY2tpbmcgdGhpbmcgZm9yIG5vdywg
c2luY2UgdGhlIGd1ZXN0IE9TIGNhbg0KPiB1c2UgdGhhdCBtZWNoYW5pc20gdG8gbWVhc3VyZSB0
aGVtLg0KPiANCj4gVGhhbmtzIGZvciByYWlzaW5nIHRoZXNlIHRvcGljcyENCj4gU3RlZmFubw0K
PiANCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vdHJ1c3RlZGNvbXB1dGluZ2dyb3VwLm9yZy93
cC1jb250ZW50L3VwbG9hZHMvUEMtQ2xpZW50LVNwZWNpZmljLQ0KPiBQbGF0Zm9ybS1UUE0tUHJv
ZmlsZS1mb3ItVFBNLTJwMC12MXAwNXBfcjE0X3B1Yi5wZGYNCj4gPg0KPiA+IFRoYW5rcywNCj4g
PiBDbGF1ZGlvDQo+ID4gLS0NCj4gPiBTdnNtLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IFN2c20t
ZGV2ZWxAY29jb251dC1zdnNtLmRldg0KPiA+IGh0dHBzOi8vbWFpbC44Ynl0ZXMub3JnL2NnaS1i
aW4vbWFpbG1hbi9saXN0aW5mby9zdnNtLWRldmVsDQo+ID4NCj4gDQo+IC0tDQo+IFN2c20tZGV2
ZWwgbWFpbGluZyBsaXN0DQo+IFN2c20tZGV2ZWxAY29jb251dC1zdnNtLmRldg0KPiBodHRwczov
L21haWwuOGJ5dGVzLm9yZy9jZ2ktYmluL21haWxtYW4vbGlzdGluZm8vc3ZzbS1kZXZlbA0K
