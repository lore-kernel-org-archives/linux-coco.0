Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF191E5A73
	for <linux-coco@lists.linux.dev>; Thu, 11 Apr 2024 17:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712855436; cv=fail; b=oqPc9PP7bBNC6DQBCVKDzpa2ykRVPEokr5DYiERa9zJENpXAcUo2eG3GAuYok9VmCNbUiutT2gX6KM4QYIRS1K0B8YjnkAGOS0Cb4NUnXuc7feIHh/6hOWOetSOFkhRubfIt+VA947bcJvAIcUEctpuk5j4hrllSn4alZf95VgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712855436; c=relaxed/simple;
	bh=jJMuAlf926O1ecvyERIgHm/nP4Ib5UrmcMl6+FwfjVc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CYXHaKaWY3n1EvyuKcFL+WOTGLQoJMwLsZr7kHHe/1ng83mYHTLUJhG3QrCD/ke8+OQQbABbVDJd0FAktQUdX7rG+L9mfpMB9gvZAMMZazXbW6u8Od8fj2kZN1uf0km3Ft5Oe/lzv+0IrXV76fqTjP2MH5fkAsfTUhRQa5JkDDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ+qK4Eg; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ+qK4Eg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712855435; x=1744391435;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jJMuAlf926O1ecvyERIgHm/nP4Ib5UrmcMl6+FwfjVc=;
  b=KQ+qK4EgwohFSB7WD91T831HQbFwIb0s+Nw54ab2lGPoIifM9r8gadlt
   HPWC9ObjGdkJJimDkwtt1gfsk2yVhCmWKlv38z4m+oCQhV2jxrrBCjJWh
   Ha6EGkTXmipoMwkYPiibVfPELZFF92ECK8mM+gdcrJ5NKCg2/bSkcVqmT
   qJXjanejVNXG7GZ0WUfTpE8Rw8gHk2q1+d0ZR3f72uYzzKnUWvx+W7MgO
   W2CT8XPHQlwhcF1gR/LrpilQUViTx1beNFbhn22ztSAbAUIG8O0pLjySF
   KSdqNejyLY0Vp+MmbywNxtn9gO5k6We7P8bjJ0i3AYGF3slJjByzdnyu8
   w==;
X-CSE-ConnectionGUID: kHsmhHwiS66XJfc9Dv377g==
X-CSE-MsgGUID: 4GVlOnOeTLGHNiZ6aCyrMg==
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:oraxBKo8f+a0VgFOZ5+MtXPyn0VeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmDafmLZ2ekfYp/aYTlpBhX6JDUm9JiHgc5qn03Ei8T8JacVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhtFie0SsKFa+C5xZVa/f/WHuKU5MnsY3kpGVYMpB8J0E8lw6hgxNYz2bBVOivV0
 fvqucrTJVS57DB9N2MQ+sqrpQhm1BjIkGpwUmcWO7YT4zcyq1FPVMhDff3odiOiKmVpNrXSq
 9jrnenRElzxok9F5uONyt7TbkAMS7jOCgmC4lI+t3+K2UAqSoQai87XBdJEAatlo2zhc+NZk
 b2hgaeNpTIBZcUgrsxGCkUFTHsuVUFx0OSvzXCX6aR/xqBdGpfm660G4EoeZOX09gvsaI3nG
 DNxxD0lN3i+a+yKLL2TEcNimOMzKtXXEZJA621Y4wP2JvY8TsWWK0nKzYcwMDYYiMVQHPvFb
 pJBOHxhaVLBZQFCPhEcD5dWcOWA3yG5LWUe8QnI4/NrsgA/zyQouFTpGMPUfNOOTMMTjkeRo
 G3u/mLlDxVcP9uaodaA2iL12rOQx3OTtIQ6E7uc06dqnAepz2E5UgwRdgu4ufWdsxvrMz5YA
 wlOksY0loA++VKmSvHwUx7i5nGeuQMEQJxRFIUHBBqlxK/K4guCDzBcH3hPbZonstM7QXoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrYUD58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:Y0kT66j5SuAErtwKA8+I6mZetnBQX6p23DAbv31ZSRFFG/FwyP
 re+MjzhCWE7Qr5BktQ++xoYJPwM0819fZOkPIs1MSZLXzbUQyTXcRfBOrZsn/d8kLFh5FgPS
 kLSdkBNDSdNykCsS++2njKLz9C+qjCzEnLv5au854Fd2gDBM8Aj3Ybe2HrdHGeBjM2dabRfK
 DsuPavzADQA0j/G/7LekXtKNKz2uEj+qiWGSIuNloM0iXLpzWu77LxDhif2Tkjcx4n+9wf2F
 mAuTbUooG4vd+G6jK07QXuBtNt9ecJzOEuOOW8zuwubhn8gAehY4psH5eYuioune2p4FE21P
 HRvhYJJa1ImjTsV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhLhebgDS5yMbzZdBOe
 NwrjukXqhsfEj9dRfGloL1vtZR5xeJSE8Z4LYuZrpkINcjgfFq3NMiFQhuYeM99WrBmfca+a
 9VfZDhDb9tACWnRmGcsW91zNO2WHMvWh+AX0gZo8SQlyNbhXZj0iIjtY0id9g7hdgAorR/lq
 v5255T5f9zZ95Tabg4CPYKQMOxBGCISRXQMHiKKVCiEK0cIXrCp5P+/b1wvYiRCd815Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA8sLzhQ7jgNzGFVTkV4oudiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7QJVWIWl2arxYhj/6YSPCnivmEPygigWASoebGFPEK0dtZl/C
X-Talos-CUID: =?us-ascii?q?9a23=3AtlTfzmv9eFDsnCjWYh129Ds26It+WHPD62fWP3O?=
 =?us-ascii?q?VGDk4VIW7e3C7+Llrxp8=3D?=
X-Talos-MUID: 9a23:3g09VwgEvT9Zf3P4sBUr+MMpM8FMxv2uFBo3mJgs4diDFnxzIzu5tWHi
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8144733"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8144733"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 10:10:33 -0700
X-CSE-ConnectionGUID: 14jMiskJSySpDwG4dG7EJw==
X-CSE-MsgGUID: U8aunNScSBSknqv14RUPSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="21030583"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Apr 2024 10:10:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 10:10:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 10:10:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 10:10:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 10:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HRRhNjtNMjZx2XbSJXWu2pmS6pN5cA5aQdEhWEL51tqz0ViaJl1dG5Ole6j+GHHJ4FZzbKeW89COrRNhnc4vTTwsmxa1RcJhySHpfn1n+x2awUW+LI6nXGHx82wjq1JtR2xv5w9EgN0EvGctNOFjFp43o0bUbTKrX6a5x2L9a+7+vPhqF92+kZCUO4URD/aWPDP36Qv9yo3dR36n6cjWwU2FPaicMKFUubYOQdikKxuiii7zv7wt91q+4/QTJhwdsMOuJBBDmVPFYxemnhssv/6wJUNb97vFQFkVnpWlAFrVMBBscGU/90Rxo8fJtIltdogpZreUwzeEYwmexo0uCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJMuAlf926O1ecvyERIgHm/nP4Ib5UrmcMl6+FwfjVc=;
 b=DP77QpiMaL2tJzru/5Sm/fyv0BFU6cCkJlpB+IhhyVMgfs0c0Pzzk2HvPyW8kz5RB9Y+xqOv1QKh732Fvo4Nfo9AAGjZ7gPu0UUbnk+aMMWY7Vlf59bpsxbLNdbe3/dXJEkQgNECvC1tKvtGrcPTcvePYq9VbLyE0dvsRjsxwLAaGR9nKoli6YPxB51D0PoYnoOgmcJTCm5RSat6Rqn7CAZtCgfqnyqt4iJlobpQOHpYmGcZuBaMl3uM60LGw94Eg9VfxkIj4tiiJ97CTxT5Yk/uht++RJ0NIfWC7HgS0CQ/FBjTgp/QHAxxUnjrVJyd9Sk3uKxkneicpKV4QIdkeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3504.namprd11.prod.outlook.com (2603:10b6:805:d0::17)
 by DM4PR11MB8160.namprd11.prod.outlook.com (2603:10b6:8:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Thu, 11 Apr
 2024 17:10:29 +0000
Received: from SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::128f:856a:11b7:1d25]) by SN6PR11MB3504.namprd11.prod.outlook.com
 ([fe80::128f:856a:11b7:1d25%6]) with mapi id 15.20.7472.007; Thu, 11 Apr 2024
 17:10:29 +0000
From: "Xiang, Qinglan" <qinglan.xiang@intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
	"devel@edk2.groups.io" <devel@edk2.groups.io>, "kraxel@redhat.com"
	<kraxel@redhat.com>
CC: "Yao, Jiewen" <jiewen.yao@intel.com>, Dionna Amalie Glaze
	<dionnaglaze@google.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>, "James
 Bottomley" <jejb@linux.ibm.com>, Michael Roth <michael.roth@amd.com>, "qinkun
 Bao" <qinkun@google.com>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "Aktas, Erdem" <erdemaktas@google.com>, "Peter
 Gonda" <pgonda@google.com>, "Johnson, Simon P" <simon.p.johnson@intel.com>,
	Cfir Cohen <cfir@google.com>, "Annapurve, Vishal" <vannapurve@google.com>,
	"Madhanagopal, Ranga" <ranga.madhanagopal@intel.com>
Subject: RE: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
Thread-Topic: [edk2-devel] [RFC PATCH] OvmfPkg/SecurityPkg: Add build option
 for coexistance of vTPM and RTMR.
Thread-Index: AQHae7ExDojlpEcMQUidaqlRqr5fRLFCeBiAgAB/ymCAAH0nAIAAZe6AgASYWgCAACeXAIAZxSBQgABiLACAABUEgIAAHiHQgAAJjACAAAEjAIAAO8yAgAAxYuA=
Date: Thu, 11 Apr 2024 17:10:03 +0000
Deferred-Delivery: Thu, 11 Apr 2024 17:09:57 +0000
Message-ID: <SN6PR11MB35044E55A04044CA55C5D22BEA052@SN6PR11MB3504.namprd11.prod.outlook.com>
References: <CAAH4kHbAi=Jn7Lw82idGGmQYnAhJnhoS9u8wBMOZsp7iLiOWxw@mail.gmail.com>
 <PH0PR11MB587959168F72B20E0AC836438C312@PH0PR11MB5879.namprd11.prod.outlook.com>
 <u76teout4bwpg5yoklah6xfkrpcn4lw5nosw5lmph7sfjipqnz@gagzyh3xrkie>
 <CAAH4kHbeGborxwDOzxeMbTjU4Xo79v-OVSHXYWQiJxg-yWQfWQ@mail.gmail.com>
 <ZgF3ACjFj8LtUWgv@himmelriiki>
 <CAAH4kHbqpaCgZJpF55x2NGWL22rz1ucRewYmR=K2chw2kP6sKA@mail.gmail.com>
 <MW4PR11MB5872BBA0D379C40E071300B98C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <CAMj1kXGm5RPNAzshaTAb7fnB80m8S+q0gbNxWSA3i9Dp-AL8uw@mail.gmail.com>
 <dd6vsgt7aayspdhzkqrjsthuiexig4apvhc4ikoeewx62iqmva@rajndsnzoppq>
 <MW4PR11MB5872EEE1B69DECA4559DD48B8C052@MW4PR11MB5872.namprd11.prod.outlook.com>
 <paod4p2nuaobaevggnivxyzjcxi6fxmydo7wm2gjuzo52ep5ah@httyzmycr6bi>
 <CAMj1kXFDCThQhvVvDknV9GDzG2HWLPR4LC94CHhuckGE41Nvvw@mail.gmail.com>
 <226ff307-991d-693a-1bca-837931d08604@amd.com>
In-Reply-To: <226ff307-991d-693a-1bca-837931d08604@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3504:EE_|DM4PR11MB8160:EE_
x-ms-office365-filtering-correlation-id: cb039ddf-3694-4490-81dd-08dc5a4a49fb
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k95P7Arh/NvyVZ02V++w88lrg5E2kirge7J08FX46inAkWTITRYcfojFynHzHelkmwxOkpfFAeBE8L7lVIvmWiMGOUxpOjlN63XHhOWsPoWGbYfuNQcjwkC10nPXlYlfQVnS0MuPddfkNHgA+h78swdrz4jvCJ9hFi3TmkhmrBKU9GfrrRGR8v3WtVcGFrZhuX8nnbkc9NnWh3Q8aRTsEnNCEAnVYa2q3uNC/1lCeAFF/3RXuPPcqSCCQyI9253psezT4cGcVEf6Lb9s22fX+ijEv/4g2JRSu9YoEZ6Oo8Aym4qn4UVNUz8YP39Nuh2ctbghj7pSP+G7nzCyoit9uykqD/B/wqZqU5ZunmyvBatV62XKd+7f9KHxX6C7xLCO6DsdrcOak0WG/d/A9+eGIsjlyRP/mUr6KclGW5tDp5uzi9QJcwdsfvi/tperaWMkibJc2HgT4RCpfMQOLXGvT7C4NgltNKR0TplEsXX/byz3ONprHDHGxGBrh6FfX8WPkBcZ1SNCEvBlqi1w8Oo7LydIvRYmAq9PbPj6PVTFkRjk4TMh/3czcMvCDLB4VHUBZvCJ0uXdzdZ+2dJkz7gN6SDN/rCJHs2GPcfNOpZER8Xhelus0h68onHnS87AnV3eP1hPqvjkfimWszeQfYlbj+Xauy18IXGKYyYxL99OSUNMKkjOC0kTygjWEHfue8O1YDLfyZQuy9Fsi37cg4kNHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3504.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm81RUVoZElUckpkTGk5MG14V0d4UHhQZk9yT1hGVGd1TGJrQzErUHJsWk1w?=
 =?utf-8?B?bmZlOVB3MFlZZ3hwNVJlRW1aUmwzcGMyMkY1UUxSSVpkNDB3YTJJRFlzRFB4?=
 =?utf-8?B?NE0wUmpiQWpmUWlZQ1NONkRsUHIwWjMvWGVLREhhczA4ay8vUDUvaUFaRUxw?=
 =?utf-8?B?V3E0dkJUTHBDck51US9sTWFjSmFPQzA1YThLNFM0dmhVWXVXYjhwZHRVbVd6?=
 =?utf-8?B?UVNjVUkxL2ZNRXBTaFF1Wk5WSDREY3kxR0xtU21zbTVRRHdKN3FZdEdmcnRw?=
 =?utf-8?B?L3JwN1FlU295eXI0NzZVd0tSeTlaRG1qdG1paUI0eVZyL1lsMnBWVkVRRGVH?=
 =?utf-8?B?ZUJhK1FkN280eDRweW5vZGtlQXFyZ2xyNzZuYnd0cUxSRGZuNy9OZG9keTNS?=
 =?utf-8?B?SkxsTzd3dUZVL1JHV3ZBeHAwbXorcFRWK054MHMwb25xVnVyNWZBN01QWnVL?=
 =?utf-8?B?bmVlTjRVbXluSWpsQWhoS0FNc0tWNUxvOXpqRVVtV3RFVXR0Nm5VWWk1dWVo?=
 =?utf-8?B?bXBCajN2ZElzNG1uTGJmZXBOc1pPQ3ZjeTF3Y2RzMHhpYVc2Yi9MMUdBcHVw?=
 =?utf-8?B?d3JDWENPMzBSU1JRZTB3aWF5d3RnbGw3OFNmNmpaY1BUVjNaUWhRZnpCaTgy?=
 =?utf-8?B?RlhnTjBLMzdoL0R4eEZGcUpVY0hQREMrZlJHVVhuYXl0WDRSLzdjc3ZsdytS?=
 =?utf-8?B?R2RqcXY5ZEFDcW5IdkpDeDRoSDViMi9rSnhCVTVUSGlWaUg3L0FWdFlXU1Ux?=
 =?utf-8?B?TnpDZkRCUFdUUjRhajZMb0ZUWllob202dUs1L2JYM1ZYSkFlREprQ0F0Qm51?=
 =?utf-8?B?SEZyUDdMY2dXTTE0YzB4eGJxY1R6ZWQ5RzV6T1p2WG81aTY5Q3hlN0lMS0ZS?=
 =?utf-8?B?N2FpVWljWTdsQmpuWkpndDZwNnJZQjBjV2VJYWxDVlQ2VlNXZ1V6czAzOWYr?=
 =?utf-8?B?YXZrWDRwWExpd1VQa3ExaXdXaWd1SmszOW5GNzRpRXlocUYrUVBGYTVMU0Nr?=
 =?utf-8?B?R0pxZFI3Q2NlZ280MTdYbzV5MHNkdTYzcjJDYitPd0dBZ0xabERKOHY5aUNy?=
 =?utf-8?B?QVNlUnc1ZkFXbVVFYUFtTU16b2JxZWxGWnlFbzlsNGJHaHVBZ29vQ2FzeXhJ?=
 =?utf-8?B?QVFBaUFkSCsrOEp4MG50OHlvbmhtUGxMU0NWUVF2a2luL1FDbHVrTXpPVG02?=
 =?utf-8?B?THE3VVM1SHoxcVZPZDd2UWl3V0dxU0hHQTJmazJENmJWK3BVNlJhU2J1c1d6?=
 =?utf-8?B?aExLRDJTRGNXMnltOHFtMnh1Q3IzaU9xeDBkamM5WUlUaUkyQ2NNc0NNeWVw?=
 =?utf-8?B?NFlRTXNITXNKZDhyY2pLaWNiRG9lWThWZXIrZHB1V2h1M213UTMyYTIyVkY2?=
 =?utf-8?B?T3Qvd3pRY3ltM2FpdVdZWVN1a2R4UVhGTVNoM3FUT0diSDA0dEdkZjNkZ1Ju?=
 =?utf-8?B?YmhwdmNxbUVDTHJ1cnhDMnQ4bytERDk1U1lNdlViQm9vMXhicFBHRktBUFhS?=
 =?utf-8?B?aFhTTkc5UHFoT01ZcUs4dUd1b1RwQVorcTVEQ3BoTk5qNGFJSk5vRE1YTFNC?=
 =?utf-8?B?QUZ6NjNudmRySndZZGJKU0xUaktLMTRRZkJQWjBGKzg0UHRxT3hRbzk1SmhW?=
 =?utf-8?B?d0ZDMkRFY0Y4NzhHaWk0VHplMi9qVU1VaDRSU0RSNlVIak1HU0dwUm1vb0NW?=
 =?utf-8?B?bU1sbjVabnRENGpJcGJ2NG4weXJyYVNSOUM5MkRpOXJRWjYzTmhwZXBJRUgz?=
 =?utf-8?B?ZnpxZktjMld1OVpmTThUMTBDcUdjNGZhR2p4ZzZlWGFZTEFHazF2dE80Uzdh?=
 =?utf-8?B?USt2NnJXc3hGZ1NaTjlvaEE4QnoyYjI0clpSSHUxNEc1a1J6eTBjRnpueHBp?=
 =?utf-8?B?NTBsTDVwdWRqL2VMRng4ZWpoTEIzZDR4VTBZZVJpWUNQYVpaQ0xZL0tsbEMx?=
 =?utf-8?B?Nlg2Rzk0SlB4TEhlbzZDLy83Q1hmcmtDNXpzaXBlSFVQdyt6SDdwM2w1Tjdv?=
 =?utf-8?B?M21HU2NtaUlqc244ZGRsQjlsTDZxUExWakpIcjFmWlJENDlWVitlVWtsWlRE?=
 =?utf-8?B?aFZOMHpES3VKYXNRSDd3WG9zTVVKak1PSnR4QlRONTFtOGRVVWxkN0duVm44?=
 =?utf-8?Q?evOsK08Shci3zGy5ZobS+55gx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3504.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb039ddf-3694-4490-81dd-08dc5a4a49fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2024 17:10:29.4915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOe8WTpXANP/wICSraXOnLmI/PcipYO9XFsEmFQmhm7GbUu8A+80ZzK3bDwIA0Cqmi05My13PawYiX6zUY77uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8160
X-OriginatorOrg: intel.com

KyBDZmlyLCBWaXNoYWwgYW5kIFJhbmdhIGZvciBhd2FyZW5lc3MuIA0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogVG9tIExlbmRhY2t5IDx0aG9tYXMubGVuZGFja3lAYW1kLmNv
bT4gDQpTZW50OiBUaHVyc2RheSwgQXByaWwgMTEsIDIwMjQgNzowOCBBTQ0KVG86IEFyZCBCaWVz
aGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+OyBkZXZlbEBlZGsyLmdyb3Vwcy5pbzsga3JheGVsQHJl
ZGhhdC5jb20NCkNjOiBZYW8sIEppZXdlbiA8amlld2VuLnlhb0BpbnRlbC5jb20+OyBEaW9ubmEg
QW1hbGllIEdsYXplIDxkaW9ubmFnbGF6ZUBnb29nbGUuY29tPjsgTWlra28gWWxpbmVuIDxtaWtr
by55bGluZW5AbGludXguaW50ZWwuY29tPjsgSmFtZXMgQm90dG9tbGV5IDxqZWpiQGxpbnV4Lmli
bS5jb20+OyBNaWNoYWVsIFJvdGggPG1pY2hhZWwucm90aEBhbWQuY29tPjsgcWlua3VuIEJhbyA8
cWlua3VuQGdvb2dsZS5jb20+OyBsaW51eC1jb2NvQGxpc3RzLmxpbnV4LmRldjsgQWt0YXMsIEVy
ZGVtIDxlcmRlbWFrdGFzQGdvb2dsZS5jb20+OyBQZXRlciBHb25kYSA8cGdvbmRhQGdvb2dsZS5j
b20+OyBKb2huc29uLCBTaW1vbiBQIDxzaW1vbi5wLmpvaG5zb25AaW50ZWwuY29tPjsgWGlhbmcs
IFFpbmdsYW4gPHFpbmdsYW4ueGlhbmdAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IFtlZGsyLWRl
dmVsXSBbUkZDIFBBVENIXSBPdm1mUGtnL1NlY3VyaXR5UGtnOiBBZGQgYnVpbGQgb3B0aW9uIGZv
ciBjb2V4aXN0YW5jZSBvZiB2VFBNIGFuZCBSVE1SLg0KDQpPbiA0LzExLzI0IDA1OjMzLCBBcmQg
Qmllc2hldXZlbCB3cm90ZToNCj4gT24gVGh1LCAxMSBBcHIgMjAyNCBhdCAxMjoyOSwgR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIFRodSwgQXByIDEx
LCAyMDI0IGF0IDA5OjU2OjQ4QU0gKzAwMDAsIFlhbywgSmlld2VuIHdyb3RlOg0KPj4+IFBsZWFz
ZSBhbGxvdyBtZSB0byBjbGFyaWZ5IHdoYXQgeW91IGFyZSBwcm9wb3Npbmc6DQo+Pj4gRG8geW91
IG1lYW4gaW4gdlRQTSBjYXNlLCB3ZSBleHRlbmQgYm90aCwgYnV0IHdlIG9ubHkgbmVlZCBUQ0cg
ZXZlbnQgbG9nLCBOT1QgQ0MgZXZlbnQgbG9nPw0KPj4NCj4+IEVsc2V3aGVyZSBpbiB0aGlzIHRo
cmVhZCBpdCB3YXMgbWVudGlvbmVkIHRoYXQgd3JpdGluZyBib3RoIHZUUE0gYW5kIA0KPj4gUlRN
UiBldmVudHMgdG8gdGhlIGV2ZW50IGxvZyBpcyBwcm9ibGVtYXRpYyBiZWNhdXNlIHRoZSBldmVu
dCBsb2cgDQo+PiBmb3JtYXQgaGFzIG5vIGZpZWxkIHRvIHNwZWNpZnkgd2hlbmV2ZXIgYSBnaXZl
biBldmVudCB3YXMgbWVhc3VyZWQgdG8gDQo+PiB2VFBNIG9yIFJUTVIuDQo+Pg0KPj4gSWYgdGhl
IGZpcm13YXJlIGNhbiBtYWtlIHN1cmUgYWxsIGV2ZW50cyBhcmUgbWVhc3VyZWQgdG8gYm90aCB2
VFBNIA0KPj4gYW5kIFJUTVIgdGhlIG5lZWQgdG8gdHJhY2UgdGhlbSBzZXBhcmF0ZWx5IGdvZXMg
YXdheS4NCj4+DQo+PiBTbywgeWVzLCBpbiBjYXNlIGEgdlRQTSBpcyBwcmVzZW50IHRoZSBmaXJt
d2FyZSB3b3VsZDoNCj4+ICAgIChhKSBleHBvc2UgRUZJX1RDRzJfUFJPVE9DT0wsIG1lYXN1cmUg
dG8gYm90aCB2VFBNICsgUlRNUg0KPj4gICAgKGIpIG5vdCBleHBvc2UgRUZJX0NDX01FQVNVUkVN
RU5UX1BST1RPQ09MDQo+PiAgICAoYykgbG9nIG1lYXN1cmVtZW50cyB0byBUQ0cgZXZlbnQgbG9n
DQo+Pg0KPiANCj4gQSBURFggYXR0ZXN0YXRpb24gd291bGQgcmVxdWlyZSB0aGUgUENSIHRvIFJU
TVIgbWFwcGluZyB1c2VkIGJ5IHRoZSANCj4gZmlybXdhcmUgaW4gb3JkZXIgdG8gcmVjb25zdHJ1
Y3QgdGhlIFJUTVIgdmFsdWVzIGZyb20gdGhlIFRDRyBldmVudCANCj4gbG9nLCBidXQgdGhhdCBz
ZWVtcyBmZWFzaWJsZSB0byBtZS4NCj4gDQo+IEluIGFueSBjYXNlLCBJIHRoaW5rIGl0IHNob3Vs
ZCBiZSB0aGUgZ3Vlc3QgZmlybXdhcmUncyBqb2IgdG8gYWJzdHJhY3QgDQo+IGF3YXkgdGhlIGRp
ZmZlcmVuY2UuDQoNCkFncmVlZCwgdGhpcyBhcHByb2FjaCBzZWVtcyB0byBiZSB0aGUgYmVzdCB3
YXkgZm9yd2FyZC4NCg0KVGhhbmtzLA0KVG9tDQo=
