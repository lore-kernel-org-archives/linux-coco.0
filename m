Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CAA18B1A
	for <linux-coco@lists.linux.dev>; Fri, 27 Sep 2024 15:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452370; cv=fail; b=UfuDHB3W0b2s4ZRFUrnUKntkCTWKk5MbUtybF8LGzrGEXt6uS9K5bkrg98EDKdr2DDI+ehl2atAOKq1TTohXCi3E+3YwoHqZ326umadQKpOQVTid+vGC88XmeA39UjqYSPAjK0Q5R1AW66Vc39zgjfa0DTytKQcVihqCfZRrcT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452370; c=relaxed/simple;
	bh=tUJ4NVCnIPVaHTVbBPi9m7pGr61yaxljGSfK3KYTV/c=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=m3yRT6O2VQ8Bv+53x4g0NWe9RI5r1SLmT9Csx0YrdTjBN9MS1QQB4eoUQ/mrzgEBc7JJvNfZuBOtaRPXeQlOJixh22GbZirkOSEO/RKhppmVSnkGG04GZ066Gu/sgxojtg7i82xXbPKDB37aR+8GwacGnC/XsW9WqYVbqpwgscY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLoOgtFm; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLoOgtFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727452369; x=1758988369;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=tUJ4NVCnIPVaHTVbBPi9m7pGr61yaxljGSfK3KYTV/c=;
  b=PLoOgtFmadIKr75+nCdlo07OztWx5pK/ZxQxZr2nFniHL252eoUI7VbN
   6gMMXH5ZDYl5zVJfRJaiQw4KI90BBNUrLeHlO4L/VuVxI6ZeVBbkZKtJQ
   vYaeZ57R970oDOvI/I4lbs/Q8byJ91ZAYIMKDaa3fpIp5SOv69NWNoF6Y
   RMfr2ZGyDNimExJrq9fMq8QO0105hnJurzGmg3FTThzEdaJT1xfdNKNJf
   +dZ+e+OA430igGIO149RHXS8qrib5ok73+/gDH8so/VVNpGFzNwFawA9T
   cAHVoh+eTQvVE3QmCLhC7iDld4xZyOTgj4hz0G5T/KHRUzaeBToj+nMbj
   w==;
X-CSE-ConnectionGUID: qIgbZobhT+6hWOZOQQYskQ==
X-CSE-MsgGUID: A4+Zcwk9RSuiRgLw0VUSnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="14222586"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="14222586"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 08:52:48 -0700
X-CSE-ConnectionGUID: isV5GCVfQIu/7yQh2jXsOg==
X-CSE-MsgGUID: ce/0gDjYSUWf8ugwB5VYPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72151982"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 08:52:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 08:52:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 08:52:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 08:52:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 08:52:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJp6kU6SXcEW46YD6DR5gZzyiKfddU7B+RP5FEzeK31FWktcr2tw2Hjtz0fmUarIFHaxxSV7Mdlk71Lxw4HXrjKZ6xa1CIq3qX7kytu9IxSPJGeFz23PDVkNZY/eO7hjBPRwLJGQOZn0UIop10MSo9R5Dstzvt2uML5EAeY5t+r+RrqdCN1wH5AvPlLjYmccLvrDX85H6XwRhNBRzvV/lk6lIuvMzmKCYVBy3IVGCf1qOhkEdV1BH92LWeOfNk+p/SZLCLtEocon7tCABpFiuSKN4NKMAYfbBjFRoC2Trez7twrdFn5Az7rlWGWJPJqOThr424QLmSrIpnv33L6/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUJ4NVCnIPVaHTVbBPi9m7pGr61yaxljGSfK3KYTV/c=;
 b=os0YYYjsTYietxarzMTlEMBdGzYf6Jp+ddCdi+h6ic8Kg+9pb0SKTCZi99ZbLR8Hp+IeCX0MPPXwlan3sVeL84Ta3lRGlsGther362xGBC2gNw5mjz/l8Coeia2l2k+8xAVQ1HIh01iEm3UyOJSoCPWwS2KsRhNi8VnuREW9jbErhtUc3XpmJ5bcxF0pwt+8NX/4IDwV4DRjt1fqfmK7eNu1DpI2HBXn9EUPkj6XKmfa0HeHMCyFKF1IqHZWSBQr0zhBhXMiENQStK3Faim03bMOoW9Fa3SSolcgCXYXWjnazxjMTR4SdjyMKL51IK0f2WkQnnqC3RhuOTcokB+Acw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8458.namprd11.prod.outlook.com (2603:10b6:408:1bb::20)
 by BN9PR11MB5291.namprd11.prod.outlook.com (2603:10b6:408:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Fri, 27 Sep
 2024 15:52:38 +0000
Received: from LV3PR11MB8458.namprd11.prod.outlook.com
 ([fe80::99aa:8acf:4bf4:1210]) by LV3PR11MB8458.namprd11.prod.outlook.com
 ([fe80::99aa:8acf:4bf4:1210%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 15:52:38 +0000
From: "Quigley, David" <david.quigley@intel.com>
To: Dan Middleton <dan.middleton@linux.intel.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: RE: No CCC Kernel SIG / device security meeting 9/27
Thread-Topic: No CCC Kernel SIG / device security meeting 9/27
Thread-Index: AQHbEFWiztf93OgLXUGxtta7AVvQHLJryYfQ
Date: Fri, 27 Sep 2024 15:52:38 +0000
Message-ID: <LV3PR11MB84582F1DDE696387B6272874E56B2@LV3PR11MB8458.namprd11.prod.outlook.com>
References: <7a2e450e-bc83-45f9-ae86-b1872ae0aa23@linux.intel.com>
In-Reply-To: <7a2e450e-bc83-45f9-ae86-b1872ae0aa23@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8458:EE_|BN9PR11MB5291:EE_
x-ms-office365-filtering-correlation-id: b93bd1b9-d2e0-4763-cdf1-08dcdf0c696d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OHYyT1NtdUhHWmtwaitmZXRmUFdNeHV3NU1yZzNkRWIwb05qNU50akVhUFFB?=
 =?utf-8?B?ZDlEV3o0M09UNnZxb0ViREdGY2J5RFFHMU1EWFByOVZmaGY0NEFESVB3Rk1o?=
 =?utf-8?B?S0gzeWltTWVEVGZuOUoxUW9ZT3hCM0JweEorZlY2cUtWVFQ1dE9VZHVvOUc5?=
 =?utf-8?B?dGJLRE1BT1M0R0pKT2d0blFhRHBHeGZodmQvMkxNYnRmK2RFYm5zb0djSU1N?=
 =?utf-8?B?YTNoclN6WjNlVVUwMEQ4OFE1TEVkMkg0Y2ZyVUJDa3pCL1FaTTZpWFRqaEh0?=
 =?utf-8?B?aFZYU2x6VnhuUi9uZWIwbnFmT2daeG92S3pNelM0SXpQcHM2bnBEOVAyelA5?=
 =?utf-8?B?S2tTOTd6MVhuUStya2lIOE04VDNFblFxLzdybk1KcysyTndnaGcxTFA3UU5N?=
 =?utf-8?B?bU5tdU9lNnZkMTQxa3ZzaVJxLzdTYnNyQ3pTbm03NENISk1QRXZHdWl1SXJM?=
 =?utf-8?B?UU1iZ1lHSENmNEpGUmUrMHBIY2poVUxxSytIVGpvWkttUWUwMnk3SUNZMjll?=
 =?utf-8?B?RHFSc2JPczZuckpjak5ZdFh0bTM5dXgvRnd5ZnA0bnE2Y25mN1o4Q1BScGoz?=
 =?utf-8?B?b2dGT3pJT1lTbHRkUGp2T052YWh1amV3a0dRbFR2ckx3cGROTTkrcXBrZzdH?=
 =?utf-8?B?eGhJbU9CbHpSN1RjejBFWWQrZFlMMmZkUWlFMTd6R1VKaFhCSllYSllSNmtC?=
 =?utf-8?B?cFIxYmZ0SDZCMldVVlRLSnIvWDNiRDNwcFo2TEtXbkRpTjVUYkVVUlpZY3pk?=
 =?utf-8?B?NzdkVTRPbTNXQm4wRmI4RjF3VGU5V09UU3JOTkx2NXpLVmg5V2FiYkY4YjZO?=
 =?utf-8?B?N0IwalA1dDBidXFoeThZbFU4ZmtDSXBDM1IzQ0FmZjQyYWY3aUFMRXVpclRp?=
 =?utf-8?B?RHY1ZitDZVJrSmdranNTSUpWajZxaXRrTzlIb2VObk9DT3ZwazJhd2VNZ3VF?=
 =?utf-8?B?K2hVTGdaditpYkdsWVplaGVWUTNuVGwzU3lTY3F3L0wrd2dhYnZCU1psUnNQ?=
 =?utf-8?B?c09nVzNVSEE5ZkpsWGxzeitib2JKVUZEZ3hCTTQyV0dyMTk5cGpybUlkNEVl?=
 =?utf-8?B?QldIaUw2Vk5BWWRqU3BXcWhmamM3U1pmY1kwdzZIMFpPZUFSUE01cDNIejhy?=
 =?utf-8?B?S00wQWRqaUNDSjhkTHp0Sno0bFR1SkpTTktPVHcxQ2NhUG4rODg4amhQdEtk?=
 =?utf-8?B?U2s2MW00czZuNWNYajZwc3UvSFhlOTNhVndwNkNqN0VCalJRaitpcXl3eHdV?=
 =?utf-8?B?d2Y0WUpxc2xXZjlJa3VBTVRJbUJ5TUFISUM0WldxOEY2d2dyQyt0S3NnQ0Vi?=
 =?utf-8?B?TWdYWHVSZDRxMXdYTytCWDVFUWorNkthbk5CRzZsVzhnQkxFRVRlcnAvUlk0?=
 =?utf-8?B?SVBGYkwwektMM1JUTFBHSTdKemsrQU9wc2p3eHpYUEpQMDFKY3NES0NWSlBK?=
 =?utf-8?B?RUpVUFFTRVJMZFljTjVaamp6K05URXV3QjFCazF4bGo2NnZVVUV2TUoxVUs5?=
 =?utf-8?B?TzlkUW5INC9sMVNRcGJPNTliN3paOTJxUVhCdnhzWlg1SnVVSDBkeDVVdnFx?=
 =?utf-8?B?VUxyL1ViQ2dIemM3LzJYcjM2Z0FBOXJqK0U3OW1KSDE0bjAxUDJlMVdpbGg5?=
 =?utf-8?B?L1c3c3dKTmszL3F0Yzl4VGRkdFlPWXQ5U1BnZGpCdDkzTmtRb01zSXRIL2VP?=
 =?utf-8?B?RGJIb0c3OTIyTXVNTHI0YStTdmQyOU5UQmlUL1FtSXh5bk1Vb3grMXZ5eU4w?=
 =?utf-8?B?OVgxM09TNHZCS0ZETmVXZkJRaS9kTGZNN0ZYbmgyUEk3MVZsMDVKQTdVbkpp?=
 =?utf-8?B?akhUMzZtMlZ4Q1d4eGJHQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8458.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGNoTERjS3A5OWlIWFdIRFlWSm8wd3BKd3lqUUZGenlwd2dpTVhpczdKYmtE?=
 =?utf-8?B?cGpJOHN2ODRhZlJrRC9sK0NMSzJNWjQ0OWZrdDBVWEliSzg5a0g5Y2hxamdZ?=
 =?utf-8?B?Nkwzb2NORlcwZ3B1ZW5Ed0NvNTk2a2RvVEV4MW4xcUxrclBnRjNtd1FVb3lZ?=
 =?utf-8?B?R05tWnV6Mi9QVnVLb2xkT0F1T2tWUFNjcVhDa1A5OGl6SldNR2dEdW9GRmJB?=
 =?utf-8?B?Z0lzVVRkdmFFeC9KNk9HU1VRWGFrRUZNWmxyWVlSK2pPL05LYmZaT0hXS0Jk?=
 =?utf-8?B?QkVUUUpmZkRIRXFsWkl1dUtmVGhBU29zcVRvcCszU0Y3TWNWL0UyT3dlNUNY?=
 =?utf-8?B?S29wS1RXZHQrV25mRExBZG9IVkdoZDI2MzlnREdWOVNiaGVvQ1lhZmtpejF1?=
 =?utf-8?B?QWExQU5jblB3Ti9ST0xudXFxZWhETytpVFptMk9oM1ZhRUJNUUtmZjFYc1FC?=
 =?utf-8?B?Zm5PUHloWldZQ2FiN2U3RVVxeWRDeG9vZkhYTnk0b0w1NEYrNkRxTVI2WVNp?=
 =?utf-8?B?akJmOVMybWR0a3hHcVdMaWhuOU10WkxJbXduUmJUUHc2ZVNqZUl4ek1zODQx?=
 =?utf-8?B?KzJOTlF0ZkxhbnZmU1N6RHNzQWg4WDFaVFMydk9XdEpCWGUvOVBTWnpTSUtm?=
 =?utf-8?B?ZHpFUllIMTA5MUs2MTlYc2J2amJpV21RdmNxQjB1ZHg0c1hnWlFwZ0FvczVC?=
 =?utf-8?B?VWNVMkRhM2dCM1NWaHYvOGRaeVlGSU0vRi83ZzBtakxjM0dPUys2YW5uK1Z1?=
 =?utf-8?B?a0lINjlVQVJQMkpJaUlYZnRzdnFxZzY2Q3VEUVFTR3gwNE9sVHlqQzFsZ3RH?=
 =?utf-8?B?czFVZHlVdG15ejFyc2VQTW5mR1J2Y0x1TGRmY1FrdTdyeVJGMXVndWFBSnR0?=
 =?utf-8?B?M09IcTh4UGVYcGRCenEzK0YvNE1JM1E1NTUxN09aYzBoRFhnM0c3amFmNjNP?=
 =?utf-8?B?RHBnMTNqN2JyNTZVMzZkdWRpVHlzejkxb1Y3aDIzTG1RSVNSK0pxeFZSVzNv?=
 =?utf-8?B?NjYwK3dRa3hpUWxOZHJ2THhwTUJmOXNNQ0JhNmlsbStLbW9ienJnNkZqMkJq?=
 =?utf-8?B?Zmp2WkZsQnA3ODZKdGg3eXJRbnZwRFVMT1lkYW8zV0ZCclFnT1lqT2VUUTls?=
 =?utf-8?B?Tzg4RktaN05LcUNDb0paQTRjS3djYndJTExhK3JWTCtmMDJFRnJXMnN4M0lT?=
 =?utf-8?B?Z1BoWWJkNXhmRGtwUjNaU1E4SlB4NmMrTjF3NEhnNVh1N1ptcXVUNnQ2NXJB?=
 =?utf-8?B?UndGYUwxZWEySEs0QW1maU10S3lsNXBqeHB3d1ZsdDZZaUcxUVgvTDdnaFZr?=
 =?utf-8?B?bGpZbGlzQnp6czR0T3pZVUVEQ0U0emc5V0Ftbm9xZFViQ0lDWGgvKzBDMkRO?=
 =?utf-8?B?L21UazM4ZUE0T0VhOW1pS2Zldk5iUTg3MU1wNU4xdXBSRm5DTVM1cG1jQWxh?=
 =?utf-8?B?bXUyb1Ruek9RM2w5cGczZ0orWU9jVnhFYzFBVWs4RHYxSDhUQmE5NWE0b01q?=
 =?utf-8?B?NThnUXd1cXB4bVBGZzVsTEVpdWFwSVB4M3FKdk5QbTFSY1B3ZnFJb0N5MVZO?=
 =?utf-8?B?K0pmRWpldy9tSDNqOWo4MDJmMnhoSVFWbm1JQmZjQTdHTGUzSTd4Z0EvRGNK?=
 =?utf-8?B?cWxaN3c3bVNVejh6UmV6bGF6cmFITzU2M041cGx5SnRlbUx1WHhMc0ErUXhE?=
 =?utf-8?B?aUxNZnhkWnZQT2doSTJHdnVic3FkbHl4anRweWw4RXNISHl3MGN1WW9ZMjRt?=
 =?utf-8?B?WHBmcVc5K0hiU2x6WHU2UmsyQ1Zmb1pwdFhSby9Dd210bkl3TS9RZmRSNHpj?=
 =?utf-8?B?K2JOcnNOUXlhY09NY2Qzd3NzUlBRT2NLb1hmdUlFSXNHNUk2MlVzTXEvSmsy?=
 =?utf-8?B?RkQwdzdQMllYMndqNDRLK09rMjc2c2Z2K2huV2h3OUZqM3A0dVZlVTFXLzZa?=
 =?utf-8?B?eEdkc0hoY0lBTEJlMEl2ZVQxWFlKVU1qZHIyT1h0eTA2TVlENlJBOW0vbUsr?=
 =?utf-8?B?QTM5NG8welRPQTQzOXpKL000cU1HYzJzWHIySFR5SFVKNkRuYS9HQmV2S2Ju?=
 =?utf-8?B?M3ZIMmVOVlYzQlp6NmlUeitNSWJZVnJSUEJ4Q0hNSUV6SEJ3dG03TWJObmZP?=
 =?utf-8?Q?T6jhy4GwcA52LDbAijnby9g66?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8458.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93bd1b9-d2e0-4763-cdf1-08dcdf0c696d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 15:52:38.0657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: et1azfu9+Xvq4JsJlF782zBh+j9u9OvCBxNBo6mndtMn8r6GGMZYQpdFNRbSEwrVMnBcp8Q1UlLJirh+QwofZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5291
X-OriginatorOrg: intel.com

QXJlIHRoZXJlIGFueSByZWNvcmRpbmdzIG9yIHNvbWUgc29ydCBvZiByZWNvcmQgb2Ygd2hhdCB3
YXMgZGlzY3Vzc2VkIGF0IHRoZSBtaW5pY29uZj8NCg0KRGF2ZQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogRGFuIE1pZGRsZXRvbiA8ZGFuLm1pZGRsZXRvbkBsaW51eC5pbnRl
bC5jb20+IA0KU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyNiwgMjAyNCAyOjQ5IFBNDQpUbzog
bGludXgtY29jb0BsaXN0cy5saW51eC5kZXYNClN1YmplY3Q6IE5vIENDQyBLZXJuZWwgU0lHIC8g
ZGV2aWNlIHNlY3VyaXR5IG1lZXRpbmcgOS8yNw0KDQpObyBEZXZpY2Ugc2VjdXJpdHkgLyBDb25m
aWRlbnRpYWwgQ29tcHV0aW5nIENvbnNvcnRpdW0gS2VybmVsIFNJRyBtZWV0aW5nIHRoaXMgd2Vl
ay4NCg0KVGhvc2UgbHVja3kgZW5vdWdoIHRvIHZpc2l0IFZpZW5uYSBsYXN0IHdlZWsgYXJlIHN0
aWxsIGRpZ2VzdGluZyBMUEMgY29udmVyc2F0aW9ucyB0aGlzIHdlZWsuwqAgOikNCg0KDQpSZWdh
cmRzLA0KDQpEYW4gTWlkZGxldG9uDQoNCg0K
