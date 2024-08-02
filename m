Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5195F136995
	for <linux-coco@lists.linux.dev>; Fri,  2 Aug 2024 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722592996; cv=fail; b=mnhh+HZivy2xGFAEigPfQ9DjD1wCwh5FGOTbbGG5NLxM8RJwAqP6kQAZNMUGuE5KC0AF7tf4e6tJWsVPRA9YkPWYHF65lUMxOrt8QKfxZmTtHaOYA8kmQEIMFJF7bTO9TLb6oM2aWQEHJCBRrDQQMgkLPqWu/W1B/lXFJ9+Fj48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722592996; c=relaxed/simple;
	bh=Y9H9iZffKGGVkhgMazGEBtZkRXTuvLaUFOBc+Uefyo0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ep9959lpMJak3cWsUrZm/acUgz+z+ouWg2Ba530DoI77+zug+lq0GrzOYNPgefQAlEkSFbsaMeMvgBYHCIlbJhkJbR/Kq/omqyPh7+PMAM6wkcMwEsEzj4qnCGGKeWbItsgmeQFMCWuUFYpWMomUNkCq3YT2Srs/0xrEUmvb+gI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUKtBvcz; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUKtBvcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722592993; x=1754128993;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y9H9iZffKGGVkhgMazGEBtZkRXTuvLaUFOBc+Uefyo0=;
  b=bUKtBvczF8qYa2ySGVuRlTsI319jjN44jAtcAiRUklhwsBwrwFGOszvZ
   9hSVjByZuheEXpWmQtXimcaCNzYk79fOvR1cDXaCHy1XM2hZLlg6PBc9d
   pqEwM5TREh2FTemooN/YUz5Ja9j8y+P1i83wfJjNYTb+0uDO1WFrLSx3E
   y6ovADGT6l12WZawtpbVB1YndzoiqhRECyxC1BFAegjUTuBj/078rz+hX
   6uj4rtDpDPAXVbDf6RfcM0ow0/0Pm8lwQjRN+uofeyocJ+I04mr4Yr7gw
   fvj7GlR0loPxjpbSlLKYHGYK5qlvX95OFnG8rT3DUnAbCeaBJC8IvtJ9O
   Q==;
X-CSE-ConnectionGUID: tS0dK8vYTXi+iCHqfirRmA==
X-CSE-MsgGUID: sdZaOq0CSGq3zOM7WdhQBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24370070"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="24370070"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 03:03:11 -0700
X-CSE-ConnectionGUID: tDi4l+EBQ56VQMSZH5a/gA==
X-CSE-MsgGUID: Izr0YHhmSRCE5rAZqedcHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="60176482"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Aug 2024 03:03:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 03:03:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 03:03:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 03:02:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cn33Tcx2P3HzvLkwUe8cNl+rRrbklaNH7jlt4qzZ2R3huwm4dG2Yc9BlTxut3j4sm4qr9Le188zBbVvgfE3q618aGQQKaIL3VNi1ZH5TDfmVPnhCDW3FJjDihcqMHyD7cSdZsbN8Rd3s8O/kcmLJIDubIMJgfzJeSn5mHb7na1Hy/VQ6zXnhE0U25lqPt/hX+6VjiR37n53xyJdvxgzawLtWRo6sMTFMjlZuEHCT6OWCJ9oIFG5PYWhVDeA3qQNviLiQT9u9dNpaDwfaFADWNLTEUb9l4ht5EJij3uk3qovafHGTBQCmu+aa2umgBG3X5tjsNOsgxsNMVOF5IU6miw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9H9iZffKGGVkhgMazGEBtZkRXTuvLaUFOBc+Uefyo0=;
 b=Hhy+u0mIS3UnatxWzwH4lPKqSTXRZqGbCvKK+TuR7ZU/PpYMcA9nnNHMhLfUMJXhTLvBRj2cgOdahL03GX0scSyCQ5rSA8anz7gppE7iW426nB+oM9ipJByv6likfs0130UYGjhQtHNr3fLysXLX5zATmdkf49+EMwtI9nxdaLji3uhY/96IcmB7rlo2se9aTO1ckMF2VAtijqXMVXuRAFXa5buuyXqZ8fgeFw6HWc1lIWhY2K/2sSE4sEgdXtknDJoD9jvCLI8QnulZhOYTczf0Vex6axX1wOLjWgj4TbWluiL3WNhI5jfS0460blnK4SxRQw5utZpMy7YCEGgsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 by SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.33; Fri, 2 Aug
 2024 10:02:55 +0000
Received: from MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2]) by MW4PR11MB5872.namprd11.prod.outlook.com
 ([fe80::6444:ca4c:aa3e:f8d2%7]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 10:02:55 +0000
From: "Yao, Jiewen" <jiewen.yao@intel.com>
To: Dionna Amalie Glaze <dionnaglaze@google.com>
CC: "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Jeremi Piotrowski
	<jpiotrowski@linux.microsoft.com>, Claudio Siqueira de Carvalho
	<cclaudio@ibm.com>, =?utf-8?B?UsO2ZGVsLCBKw7ZyZw==?= <jroedel@suse.com>,
	"Lange, Jon" <jlange@microsoft.com>, "Dong, Eddie" <eddie.dong@intel.com>,
	"Johnson, Simon P" <simon.p.johnson@intel.com>, "Reshetova, Elena"
	<elena.reshetova@intel.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
	"Perez, Ronald" <ronald.perez@intel.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>
Subject: RE: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Topic: Coconut-SVSM - vTPM support for Intel TD Partitioning
Thread-Index: AQHazb9RgtF5ECaWSE2iVvmX08EwbLITKjDwgAByhACAAEwjsA==
Date: Fri, 2 Aug 2024 10:02:55 +0000
Message-ID: <MW4PR11MB5872DEFD23186C142F6FA0CA8CB32@MW4PR11MB5872.namprd11.prod.outlook.com>
References: <MW4PR11MB5872CE9BEF8361203F72EDFD8C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58727350055C0E00D6CA0DC08C3B2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <e2912269a273824e05714174fc04d45361ce71b5.camel@linux.ibm.com>
 <8c389411-c547-488f-93d2-ac953e212eaf@linux.microsoft.com>
 <f450d9b8c427a7d3c5ac53882d004280fc9b945a.camel@linux.ibm.com>
 <a8536552-c523-47ab-84e6-b2a1210bd366@linux.microsoft.com>
 <900e624ab5ff2ad8c1a69662450b42a442baa828.camel@linux.ibm.com>
 <MW4PR11MB5872A33D7ACFDDB34EEDC6958CDE2@MW4PR11MB5872.namprd11.prod.outlook.com>
 <MW4PR11MB58721C73775C3AD60D8C50338CB22@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAAH4kHYCAwsSk_NTdQpYKisG2o2AMd-8rsy8x=yPJYWNREMD4g@mail.gmail.com>
In-Reply-To: <CAAH4kHYCAwsSk_NTdQpYKisG2o2AMd-8rsy8x=yPJYWNREMD4g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5872:EE_|SA1PR11MB7040:EE_
x-ms-office365-filtering-correlation-id: 3c045198-5354-4dd0-7522-08dcb2da477d
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VW4xZ0x5RXpCRFNsSmtUWTR4Nnh5cDR1cmlhQXdRek5zUUFpaXk0RmhRRVEw?=
 =?utf-8?B?WXRrbVRKNE5nQUY5YllPcVQzMjNsVlFPNFVPRnhEb0NMcVdXMk96UUdLTlRZ?=
 =?utf-8?B?Ulo2TGZIQk44U3hUQ2QvbHIrRWdFK2tZU0VKekkrbG03RHVZU0sxZXEwRUs0?=
 =?utf-8?B?MG5WYklKSDNkanVMbUdzUWFoTnozYTYxbVRGTnc3L1JPTENySTlTY3hTZnkx?=
 =?utf-8?B?b3VxYm1rMGVwZEw0ZHFvdzZINHFvMGpRMTBGUW1VR3p4MmNPWnVFZERDdTl5?=
 =?utf-8?B?andNaUpXbGxIcHYwTis2KzVqMjZOMSt4TmNiQVVGd24wYjRVS1JnSHo5YW12?=
 =?utf-8?B?Z1gvUTRaTmwwZGFQQjkraHZoRU9kcWFEb0p6MlgzVjR5WXJQb3F3TzlUeENy?=
 =?utf-8?B?WUdwb2ZiaXZ2d3dORDZrM1dISWdjbGpMYmtJamRlZzVMV2NCem42VFhYVjZn?=
 =?utf-8?B?QXU1SDE0dzRDVzMrNkl3RVMvOUl6UktJVUk3OExobTdBZlVndUtlWXZLWTAw?=
 =?utf-8?B?Z2RwTFdvSnkzQktLa3YyVjU4d1dGS2ZNTVBXQisxNDdNRVU3T0RDRXpTc1RS?=
 =?utf-8?B?aW5wekRjNmJVc0c3OGVURGVBdHdBNVZweHNRcVdoSDdPY3ZVTXIxS3kyVFA0?=
 =?utf-8?B?TjRoTzFEdlNmNTlMU0FFMFZNZUs4QmZKRnhjNUYvczNRVUhzMnhZVG9HcnJD?=
 =?utf-8?B?ampham91d3BLRkFWeTBGaFhha0o5ckVBNG5XMk1iQ2gvcjBXeUpWdnU5MEpW?=
 =?utf-8?B?a3pRRGRkQkEyV092WUZ0MUVXU0lSMndmZzY4QXFzUVZvSmRWQklMMkNPZ2pB?=
 =?utf-8?B?cW9NTDdjUkxTSFJwelZZZm1HSWhHQ3Q0STZOU0xNQ0phd2JIWU5zdWlwKzdj?=
 =?utf-8?B?N2ZPN294UTh3ck1WdU1DbzNVZnhPb2JPRzFxWDdpd3NDdEM1TUY2TlB6TzM1?=
 =?utf-8?B?WnJ5cVZUZUVqa1NscTBGSWxCeXQ4cHA4UnhCRkt3SkROeTdUZzJpeTY3bXZM?=
 =?utf-8?B?bm5TTVRhaWx2N2NEOGlVOURyMGwyMlFjYUF3K2cxZm5HZlBvMFZjaERpY0tC?=
 =?utf-8?B?T24zRkNmekkxd0l2S3B3TDdiRE5Rb0JxbWlJSGUxRFVkd1hGTEg2SjNMdG5K?=
 =?utf-8?B?UDFaK1lvQnlXaWhqQXV4TlhzQnVnTkFRaGxKUkNiSmcvNWN3SW5Va1FLRlZL?=
 =?utf-8?B?NDlzeVlEM1hWNU5mUTlvUWdpOUVZYXhnRHd3Q0p2NldqTXVkMkRXU1VybzVq?=
 =?utf-8?B?WmpGWGxtK2QyT21yd1FnalZ1K1h6TG05ZjN5eitZVmE0R3VvbUZsODVadkRo?=
 =?utf-8?B?U2c3VkZNMEd0alVqa2dBRmsydm5Dbnl3bXpnWjlzekRWSkxhZzB5TG1wVnlt?=
 =?utf-8?B?Mk5RNGhMRDNmamdBb0tYak8zd0l0NzR2Mkx5ZWNhNHNjbkZWYWI1bWd5V3p5?=
 =?utf-8?B?bWtWcDNHRnRhU3hnY1dFbDd0cWxrbTgvbEdEZUE4dDF4UWsxc2J3SURTQnZH?=
 =?utf-8?B?MlprNTNTRCtJa1MvSGRyY0JrL3pJYkJHSTdka3hReWRPaFlYUkFSSUJhU1Vq?=
 =?utf-8?B?Y2RGbG1QRWdJaXlpZzZyY1o5ZzAxdzk0WWd6M3lVWUxwYmdRTHMvVkJhNTV3?=
 =?utf-8?B?bG4yNFo1LzJJRTRidlhyZHRPWnkrNDROSVNDMlpESEVxb2J6VENRajNyNTdN?=
 =?utf-8?B?SXJtc25SeHI0Uy9DYkZtY2hvNnJuYVVPZjJhZTlhc3JWQURXdGlJV0RYUSti?=
 =?utf-8?B?Qzlka0hqczJqUGFJR25YZWF2dnZZL3M0TCtQUG1OZ2JSYm1BT3YwR2xZZ1NF?=
 =?utf-8?Q?LTVJGc+pUZN3WIQLNZBXYcq6AwDNiRCxtXoAs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5872.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnQreTZjR1czenFvb01oUU56aSt0ZDl2Z3hxMGhzWFVUQWNQYVVtNksrUEJS?=
 =?utf-8?B?ZjAwazdwKzBOSjF0MmFzdjZwRXR2eTR0NEtiaEh0Tmg4VGNHQlFpSXh2Ylh4?=
 =?utf-8?B?b0xoVFJIYjlleVd0WnQzYm8vckRyYzBabjNtWEN4SU1SVDFJekt4Zk1FaytE?=
 =?utf-8?B?aDlxYWV2aDZ3QjREUXpubkEyaFJUZVBkcnZncHlhUXZRWkMyamljbDVGN2Fo?=
 =?utf-8?B?dm5henFYLzRDSU5RdncwT01jUUlLai9ISzVad3MvY3VsNXJNTE1YTDdVRlJI?=
 =?utf-8?B?RGkwV3BQMUJaSlc1STgrSHRzcm1sVjJmcVVjVitIZ2ZOWkpuOFdwLzArUkl2?=
 =?utf-8?B?Zk5aMHJnb00xaWtFWXo4R1BCeC9UYXJhK0t1R0hxbUIzUjRwM2JBUEIyNWVE?=
 =?utf-8?B?VmNLNFd6UzFUTlFYTkx3RzVuUlVLRFZ2dHVQV2FLZmR5ZlpNYWVHR1krdlhu?=
 =?utf-8?B?TmNrclVmU0tGZHpOVXlxeHJZUFlXUnhyZTBZcnV0THI1ZS9sOHJVdmdLYXh0?=
 =?utf-8?B?Y0l3eWx1RWR0R3FmekdPaUVkbUxNSThlMEZqMmpGaXk3S0ZQZGxIODZWRHBJ?=
 =?utf-8?B?a2loeDREeGlBdFFVazNRa0sxeGRoUkl2TXliQ3EreWt4ZlEwUG9XY0lWOWNs?=
 =?utf-8?B?WFJlK3cvT2pxdGtSU1ZNVFZ4Sk9iVUJ3U2ZocVFHajVTSW1va3VNZE91U3FF?=
 =?utf-8?B?NUJnVUlGc0o0eGVGZ0pxdUVVTmNlYmlWV3lyUXg5ZmxQYVNmUnBFWVIrOVRa?=
 =?utf-8?B?NWlsYzZ6c0RUQUQvanZpTndoRUFBek82enA0V2NmbGc2UTQ5UkNYNndHWGo5?=
 =?utf-8?B?UHRCZE5IOGg3NklmNlBtYXhpWFJUbVZQeENDd2pTY0JpTGlsNCtjZS9rOFhZ?=
 =?utf-8?B?TndCMSt3TFBYWHlKMm5vR3lYOGxuSEtXZkRFR3p4bUg4djJTbUlrcEZvWjNj?=
 =?utf-8?B?dHhLQjZqRDh3dlhFTzhsSlJEMGZZM0tXK0tpOVVCVDNoUnNCajJpRzJFYjJh?=
 =?utf-8?B?bjNGbW0rTzNRSFJncFFyNGFHQ2phY2ZUNG1nMlZlbUFUWEdjNzd0ZHdhYi9W?=
 =?utf-8?B?TTZ4SFQ1MGV3c1AvbXF3MEMxZEJnVnZCQXNKaDBlRVBKRTF2M1pHaHV2WWxz?=
 =?utf-8?B?QUgzWW5yTHNPUVRncWVUVzdZUFUvNXA2R3UvTkw3Rm1MNlB6WVRaeXg5OEFi?=
 =?utf-8?B?Y2IyNXg3SWFmUXlaWEd5RDN5LzM5bmdPQUxXRGNIN3N2amdZNE1XY1hqWHA1?=
 =?utf-8?B?bDZobU5CYmMxV1p2T0MzSjQwSlNKZEl3b0xVNldZc2RIK3lGbjNMUmRjU3Rr?=
 =?utf-8?B?ZFlPVzJQQ1lTUkl0OFZDL3B3em1iTHJmYXBsdnJXLy9RaHJFazVIR3ZLbEdI?=
 =?utf-8?B?QUxtL0l0eGlCc0g2K3BTQWhYRXl2N1l3Q1BwbGNteVdVRWl1Ui9RNjRZRHd4?=
 =?utf-8?B?UW1abHZXWkxweWNZVlAxTmlTbkEydWJUcFBsS3kvYmVMeE9EcHA4Ym8zcXhQ?=
 =?utf-8?B?aktHVlozeDZCUzFNZEZOS0o1UWFZeHByc0JRSTFjdDB2M1lRZVhjWnJGL1p5?=
 =?utf-8?B?OXJ3dDZzZU1INk9JMFpmWTBhVWhQaHNRamxKWll2L1cweDZhU1BONGxXNkRa?=
 =?utf-8?B?TVdta0RsNnpRYnpjSDh2VTJqbDZLcGFTL29hdUpWM0V4bm9waHFYalRlRTlw?=
 =?utf-8?B?SUpBa2ZMQ1VTWTFUY2o3L2xrVjNmTXJYRjMvRGJJbWJXcVlRRUxOcWJJdCsw?=
 =?utf-8?B?aU9zeVBYendDRXhjL3E4eXJUU2NGUmZQaHBNQVNrZnRaaXRJZEpQRWVuV2Ju?=
 =?utf-8?B?UkQ3aTl1b3haT0ViWlJKWGM4N3VPM1BBVWFMSUdQQXJENHRBU0RBNWJ1RUha?=
 =?utf-8?B?VmlTMUtWZXUzTG1FUzB1UWtNZFFhK0ZFVmQ3ajJ6VnZEVUFjNjdkN0xoc3hC?=
 =?utf-8?B?U2E5VUZkVW1FSGVORE9yVGtnK25vVW04K3IrQUxZY05HWEhEbzR3eXRwcXVW?=
 =?utf-8?B?clJsVklHUTVCa21CZzBVL1c4bjQweWFPaUFYaXpPZFJGVkczaEZJL3N0UHFx?=
 =?utf-8?B?YmZyMnF5c3IwcVZsdnA1Rjc3UFZUM1Z4NFkweEd1bHhBUkRjRWVIVU01cUdS?=
 =?utf-8?Q?42Jn/Hnod4ljec0XxMMDzNG2R?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c045198-5354-4dd0-7522-08dcb2da477d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 10:02:55.1328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ad9WWHfEP1DgFTikoi4pNxvfh3ZxPMWJJWf6NWtv3C87n77x6rKMDjq9vcQ1rrKvHjKPWC/OFGMHt+/UnD/zWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com

SGkgRGlvbm5hDQpBcHByZWNpYXRlIHlvdXIgdmFsdWFibGUgZmVlZGJhY2shDQoNCkkgd2lsbCBi
ZSBvdXQgb2Ygb2ZmaWNlIGluIG5leHQgd2Vlay4gQXMgc3VjaCBJIHdpbGwgcmVzcG9uc2UgaW4g
bmV4dCAyIHdlZWtzLg0KDQpJbiB0aGUgbWVhbnRpbWUsIHBsZWFzZSBzZW5kIHRoZSBsaXN0IG9m
IGVycm9yIHlvdSBmaW5kIGlmIHBvc3NpYmxlLiBXZSB3aWxsIG1ha2Ugc3VyZSBpdCBmaXhlZCBp
biB0aGUgbmV4dCB2ZXJzaW9uLg0KDQpUaGFuayB5b3UNCllhbywgSmlld2VuDQoNCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEaW9ubmEgQW1hbGllIEdsYXplIDxkaW9u
bmFnbGF6ZUBnb29nbGUuY29tPg0KPiBTZW50OiBGcmlkYXksIEF1Z3VzdCAyLCAyMDI0IDE6MjMg
UE0NCj4gVG86IFlhbywgSmlld2VuIDxqaWV3ZW4ueWFvQGludGVsLmNvbT4NCj4gQ2M6IGplamJA
bGludXguaWJtLmNvbTsgSmVyZW1pIFBpb3Ryb3dza2kgPGpwaW90cm93c2tpQGxpbnV4Lm1pY3Jv
c29mdC5jb20+Ow0KPiBDbGF1ZGlvIFNpcXVlaXJhIGRlIENhcnZhbGhvIDxjY2xhdWRpb0BpYm0u
Y29tPjsgUsO2ZGVsLCBKw7ZyZw0KPiA8anJvZWRlbEBzdXNlLmNvbT47IExhbmdlLCBKb24gPGps
YW5nZUBtaWNyb3NvZnQuY29tPjsgRG9uZywgRWRkaWUNCj4gPGVkZGllLmRvbmdAaW50ZWwuY29t
PjsgSm9obnNvbiwgU2ltb24gUCA8c2ltb24ucC5qb2huc29uQGludGVsLmNvbT47DQo+IFJlc2hl
dG92YSwgRWxlbmEgPGVsZW5hLnJlc2hldG92YUBpbnRlbC5jb20+OyBOYWthamltYSwgSnVuDQo+
IDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgUGVyZXosIFJvbmFsZCA8cm9uYWxkLnBlcmV6QGlu
dGVsLmNvbT47IGxpbnV4LQ0KPiBjb2NvQGxpc3RzLmxpbnV4LmRldg0KPiBTdWJqZWN0OiBSZTog
Q29jb251dC1TVlNNIC0gdlRQTSBzdXBwb3J0IGZvciBJbnRlbCBURCBQYXJ0aXRpb25pbmcNCj4g
DQo+IFRoYW5rcyBmb3IgdGhpcyB3cml0ZXVwLCBKaWV3ZW4uIEkgc2VlIHNvbWUgcGFyYWxsZWxz
IHRvIHRoZSBldlRQTQ0KPiBwYXBlciBidXQgc29tZSBkaXZlcmdlbmNlcyB0aGF0IEkgZmluZCBh
IGxpdHRsZSBjdXJpb3VzLg0KPiANCj4gMS4gVGhlIEVLcHViIGlzIGVwaGVtZXJhbCBhbmQgZnVs
bHkganVzdGlmaWVkIGJ5IHRoZSBURCBxdW90ZSBhcm91bmQNCj4gaXQsIHNvIHRoZXJlIGlzIG5v
IG5lZWQgZm9yIGFuIFguNTA5IGNlcnRpZmljYXRlIGZyb20gd2l0aGluIHRoZSBTVlNNLg0KPiBU
aGVyZSBtaWdodCBiZSBzb21lIHZhbHVlIGZvciB0aGUgcGxhdGZvcm0gdG8gY291bnRlcnNpZ24g
dGhlIEVLcHViDQo+IHdpdGggc29tZSBpbnN0YW5jZSBpbmZvcm1hdGlvbiwgc28gaWYgYW55dGhp
bmcgSSB3b3VsZCBvbmx5IGNvbnNpZGVyDQo+IHRoZSBTZXJ2aWNlIENBLXNpZ25lZCBFSyB0byBt
YWtlIHNlbnNlLiBUaGUgZXZUUE0gcGFwZXIgY29tbXVuaWNhdGVzDQo+IHRoZSAiRUsgY2VydCIg
Ynkgc3Rhc2hpbmcgdGhlIHF1b3RlIHRoYXQgd3JhcHMgdGhlIEVLcHViIGluIHRoZSBOVlJBTQ0K
PiBpbmRleCBmb3IgdGhlIEVLIGNlcnQgKDB4MWMwMDAwMikuIEluZGVlZCB0aGUgYXV0aG9ycyBv
ZiB0aGUgcGFwZXINCj4gYWxyZWFkeSBjaGFuZ2VkIEtleWxpbWUgdG8gdmVyaWZ5IHF1b3RlcyBp
biB0aGlzIGZvcm0uDQo+IA0KPiBCeSByZXF1aXJpbmcgWC41MDkgc2VsZi1zaWduaW5nLCB5b3Ug
YXJlIG5vdyBwdWxsaW5nIGluIGEgYnVuY2ggb2YNCj4gdW5uZWNlc3Nhcnkgc2VyaWFsaXphdGlv
biBjb2RlLiBGb3IgdGhlIENBLXNpZ25lZCBFSywgeW91IGNhbiBnZXQgYW4NCj4gWC41MDkgY2Vy
dCBpbiByZXNwb25zZSB0byBhIENvbmNpc2UtQ1NSDQo+IGh0dHBzOi8vd3d3LmlldGYub3JnL2Fy
Y2hpdmUvaWQvZHJhZnQtaWV0Zi1jb3NlLWNib3ItZW5jb2RlZC1jZXJ0LQ0KPiAwNy5odG1sI25h
bWUtYzUwOS1jZXJ0aWZpY2F0ZS1zaWduaW5nLXJlDQo+IHdoZXJlIENCT1Igc2VyaWFsaXphdGlv
biBpcyBtdWNoIHNpbXBsZXIuDQo+IA0KPiAyLiBJIGNhbiBhcHByZWNpYXRlIHRoZSBzZXBhcmF0
b3IgZXZlbnRzIGZvciBhdm9pZGluZyBhbiBlbXVsYXRpb24NCj4gYXR0YWNrLCBidXQgdGhpcyBs
aW1pdHMgeW91ciBhYmlsaXR5IHRvIGhhdmUgbXVsdGlwbGUgTDIgVk1zIHdpdGgNCj4gdGhlaXIg
b3duIHZUUE1zIHRvIGJlIGxhdW5jaGVkIGF0IGRpZmZlcmVudCB0aW1lcy4gSXQgc2VlbXMgbW9y
ZQ0KPiBhcHByb3ByaWF0ZSB0byBoYXZlIGEgcGFyZW50IGtleSB0aGF0ICBlYWNoIHZUUE0gaXMg
dW5kZXJuZWF0aCwgYnV0DQo+IEknbSBub3Qgc2F2dnkgZW5vdWdoIHdpdGggdGhlIGF2YWlsYWJs
ZSBoaWVyYXJjaGllcyB0byBrbm93IGlmIHRoYXQNCj4gcGFyZW50aW5nIHJlbGF0aW9uc2hpcCBp
cyBwb3NzaWJsZS4gVGhpcyB3b3VsZCBhY3R1YWxseSBtYWtlIGFuIEVLY2VydA0KPiBtYWtlIHNl
bnNlLCBzaW5jZSBpdCdkIGJlIHNpZ25lZCBieSB0aGlzIHBhcmVudCBrZXkgb2YgdGhlIGVwaGVt
ZXJhbA0KPiBMMVZNTS4gU28sIG5vdCBvbmUgb2YgeW91ciBsaXN0ZWQgb3B0aW9ucy4NCj4gDQo+
IFRoaXMgZGl2ZXJnZXMgZnJvbSB0aGUgZXZUUE0gcGFwZXIgc2luY2UgdGhleSB3ZXJlIHRhcmdl
dGluZyBTRVYtU05QDQo+IHdpdGhvdXQgbmVzdGVkIFZNcy4NCj4gDQo+IDMuIE1pZ3JhdGlvbiBp
c24ndCBkaXNjdXNzZWQgbXVjaC4gRG8geW91IGhhdmUgYSBtaXRpZ2F0aW9uIGluIG1pbmQgdG8N
Cj4gYSBwbGF0Zm9ybS1ob3N0ZWQgYXR0YWNrIHdoZXJlIGEgbWlncmF0ZWQgVk0gaXMgY2xvbmVk
PyBUaGUgbnVsbA0KPiBoaWVyYXJjaHkgc2VlZHMgd291bGQgYmUgdGhlIHNhbWUgYnV0IHRoZSBW
TXMgd291bGQgZXZvbHZlIGRpZmZlcmVudGx5DQo+IHdpdGggZGlmZmVyZW50IHRyYWZmaWMgYW5k
IHRoZW4gY29tcHJvbWlzZSB0aGVpciBzZWN1cml0eSBwcm9wZXJ0aWVzLg0KPiBNYXliZSB0aGUg
bWlncmF0aW9uIFREIGp1c3QgYWNjZXB0cyBhIHNpbmdsZSBjb25uZWN0aW9uIGZyb20gdGhlDQo+
IHRhcmdldCBWTSBhbmQgcmVmdXNlcyBhbnkgZXh0cmEgY29ubmVjdGlvbj8NCj4gDQo+IDQuIENs
YXJpZmljYXRpb24gcXVlc3Rpb246IMKnMi42IGEgbmV3IHBhcmFncmFwaCBzdGFydHMgd2l0aCBh
DQo+IHJlZmVyZW5jZSB0byBhICJjb25uZWN0aW9uIGJldHdlZW4gdGhlbSIgYnV0IEknbSBub3Qg
c3VyZSB3aG8gdGhlDQo+IHBhcnRpZXMgb2YgdGhlICJ0aGVtIiBhcmUuIElzIHRoaXMgdGhlIGNv
bm5lY3Rpb24gb2YgdGhlIFRQTSBxdW90ZSB0bw0KPiB0aGUgVEQgcXVvdGUgYnkgbWVhbnMgb2Yg
dGhlIFREIHF1b3RlIGNvbnRhaW5pbmcgYSBoYXNoIG9mIHRoZSBFS3B1Yj8NCj4gSSBjb3VsZCBh
bHNvIHJlYWQgInRoZW0iIGFzIEwxIGFuZCBMMi4NCj4gDQo+IDUuIENsYXJpZmljYXRpb24gcXVl
c3Rpb246IGlzIHRoZSBwcmVzZW5jZSBWTUNBTEwncyByZXNwb25zZSBIT0JzIGZvcg0KPiB0aGUg
VERWRiB0byBhZGQgdG8gdGhlIGhvYiBsaXN0IGZvciBpbmNsdXNpb24gaW4gdGhlIGV2ZW50IGxv
ZyBzbyB0aGF0DQo+IHRoZXJlIGlzIG5vIG5lZWQgZm9yIFNWU00gdG8gcHJvZHVjZSBhbiBldmVu
dCBsb2c/IEluIHRoaXMgY2FzZSwgd2h5DQo+IGluIMKnMi40IHN0ZXAgMy4xIHRoZSBURFZGIGNy
ZWF0ZXMgYW4gZXZlbnQgZm9yIHRoZSBTVlNNIHZlcnNpb24/DQo+IFdvdWxkbid0IFNWU00gYmUg
dGhlIGFwcHJvcHJpYXRlIG9uZSB0byByZXBvcnQgaXRzIHZlcnNpb24/IE5vdCBzdXJlDQo+IHdo
YXQgSSBtaXNzZWQuDQo+IA0KPiBJIGNhdWdodCBzb21lIHNwZWxsaW5nIGFuZCBncmFtbWFyIGVy
cm9ycyBpZiB5b3UnZCBsaWtlIG1lIHRvIHNlbmQNCj4gdGhvc2Ugb2ZmIGxpc3QuDQo+IA0KPiBP
biBUaHUsIEF1ZyAxLCAyMDI0IGF0IDM6MzjigK9QTSBZYW8sIEppZXdlbiA8amlld2VuLnlhb0Bp
bnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkNCj4gPiBBcyBmb2xsb3cgdXAsIHdlIGhhdmUg
ZHJhZnRlZCB0aGUgdlRQTSBkb2N1bWVudCBhbmQgcHV0IHRvDQo+IGh0dHBzOi8vZ2l0aHViLmNv
bS9pbnRlbC1zdGFnaW5nL3RkLXBhcnRpdGlvbmluZy1zdnNtL2Jsb2Ivc3ZzbS10ZHAtDQo+IHZ0
cG0vRG9jdW1lbnRhdGlvbi9URCUyMFBhcnRpdGlvbmluZyUyMGJhc2VkJTIwdmlydHVhbCUyMFRQ
TSUyMERlc2lnDQo+IG4lMjBHdWlkZSUyMFJldiUyMDAuNS4xLnBkZi4NCj4gPiBJdCBkZXNjcmli
ZXMgdGhlIGN1cnJlbnQgVEQgUGFydGl0aW9uaW5nIGJhc2VkIHZUUE0gZGVzaWduLg0KPiA+DQo+
ID4gVGhlIGNoYXB0ZXIgNSBkZXNjcmliZWQgdGhlIFREVk1DQUxMIGJldHdlZW4gTDIgZ3Vlc3Qg
YW5kIEwxIFZNTSwgdG8NCj4gZGV0ZWN0IHRoZSBwcmVzZW5jZSBvZiBMMSB2VFBNIHNlcnZpY2Ug
YW5kIGluaXRpYWwgbWVhc3VyZW1lbnQuDQo+ID4gUGxlYXNlIGxldCB1cyBrbm93IGlmIHlvdSBo
YXZlIGFueSBmZWVkYmFjay4NCj4gPg0KPiA+IFRoYW5rIHlvdQ0KPiA+IFlhbywgSmlld2VuDQo+
ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBZYW8sIEpp
ZXdlbiA8amlld2VuLnlhb0BpbnRlbC5jb20+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgSnVseSA0
LCAyMDI0IDExOjA4IEFNDQo+ID4gPiBUbzogamVqYkBsaW51eC5pYm0uY29tOyBKZXJlbWkgUGlv
dHJvd3NraQ0KPiA8anBpb3Ryb3dza2lAbGludXgubWljcm9zb2Z0LmNvbT47DQo+ID4gPiBDbGF1
ZGlvIFNpcXVlaXJhIGRlIENhcnZhbGhvIDxjY2xhdWRpb0BpYm0uY29tPjsgUsO2ZGVsLCBKw7Zy
Zw0KPiA+ID4gPGpyb2VkZWxAc3VzZS5jb20+DQo+ID4gPiBDYzogTGFuZ2UsIEpvbiA8amxhbmdl
QG1pY3Jvc29mdC5jb20+OyBEb25nLCBFZGRpZQ0KPiA8ZWRkaWUuZG9uZ0BpbnRlbC5jb20+Ow0K
PiA+ID4gSm9obnNvbiwgU2ltb24gUCA8c2ltb24ucC5qb2huc29uQGludGVsLmNvbT47IFJlc2hl
dG92YSwgRWxlbmENCj4gPiA+IDxlbGVuYS5yZXNoZXRvdmFAaW50ZWwuY29tPjsgTmFrYWppbWEs
IEp1biA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47DQo+IFBlcmV6LA0KPiA+ID4gUm9uYWxkIDxy
b25hbGQucGVyZXpAaW50ZWwuY29tPjsgbGludXgtY29jb0BsaXN0cy5saW51eC5kZXYNCj4gPiA+
IFN1YmplY3Q6IENvY29udXQtU1ZTTSAtIHZUUE0gc3VwcG9ydCBmb3IgSW50ZWwgVEQgUGFydGl0
aW9uaW5nDQo+ID4gPg0KPiA+ID4gSGkNCj4gPiA+IFdlIHBvc3RlZCB0aGUgaW5pdGlhbCB2ZXJz
aW9uIG9mIHZUUE0gc3VwcG9ydCBmb3IgSW50ZWwgVEQgUGFydGl0aW9uaW5nIGZlYXR1cmUNCj4g
dG8NCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1zdGFnaW5nL3RkLXBhcnRpdGlvbmlu
Zy1zdnNtL3RyZWUvc3ZzbS10ZHAtdnRwbS4NCj4gPiA+DQo+ID4gPiBGZWF0dXJlIGluY2x1ZGVz
Og0KPiA+ID4gLSB2VFBNIENSQiBNTUlPIGludGVyZmFjZQ0KPiA+ID4gLSB2VFBNIENBIGdlbmVy
YXRpb24gd2l0aCBURFggcmVtb3RlIGF0dGVzdGF0aW9uDQo+ID4gPiAtIHZUUE0gRW5kb3JzZW1l
bnQgS2V5IGNlcnRpZmljYXRlIGFuZCBDQSBwcm92aXNpb24NCj4gPiA+IC0gVERQIEwyIGd1ZXN0
IHZUUE0gZGV0ZWN0aW9uIHRocm91Z2ggVERWTUNBTEwNCj4gPiA+IC0gU1ZTTSB2VFBNIHN0YXJ0
dXAgYW5kIG1lYXN1cmVtZW50IChTVlNNIHZlcnNpb24gYW5kIFREVkYpLg0KPiA+ID4gLSBFcGhl
bWVyYWwgdlRQTSBOVlMNCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGluaXRpYWwgdmVyc2lvbiBhbmQg
d2UgYXJlIHdvcmtpbmcgb24gdGhlIGltcHJvdmVtZW50Lg0KPiA+ID4gQW55IGZlZWRiYWNrIGlz
IHdlbGNvbWUhDQo+ID4gPg0KPiA+ID4NCj4gPiA+IEF0IHNhbWUgdGltZSwgd2UgZmluZCBhIHBv
dGVudGlhbCBpc3N1ZSBodHRwczovL2dpdGh1Yi5jb20vY29jb251dC0NCj4gPiA+IHN2c20vc3Zz
bS9pc3N1ZXMvNDA0LiBJZiB5b3UgY2FuIHRha2UgYSBsb29rIGFuZCBwcm92aWRlIHlvdXIgdGhv
dWdodHMsIHRoYXQNCj4gPiA+IHdvdWxkIGJlIGdyZWF0Lg0KPiA+ID4NCj4gPiA+IFRoYW5rIHlv
dQ0KPiA+ID4gWWFvLCBKaWV3ZW4NCj4gPg0KPiA+DQo+IA0KPiANCj4gLS0NCj4gLURpb25uYSBH
bGF6ZSwgUGhELCBDSVNTUCwgQ0NTUCAoc2hlL2hlcikNCg==
