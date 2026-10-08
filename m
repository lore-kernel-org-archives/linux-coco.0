Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F4236A35A
	for <linux-coco@lists.linux.dev>; Thu,  8 Oct 2026 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791441922; cv=fail; b=t6URi6c4nEOuYco47ftNLQKIJHFX9uFmBkoZ+GWuGV3uV4o4t0w0M5FOeb0vlAxw7YHDnSLfPUmkt1dxTJ7IUmNFsyaL/V1n9BuGHEGK0VSdU1KnOpVo/0X/ZtO/v4BnlwycSRLJ+zY45Tjg/rGe7iYG/6PIK3VicniEDRa7eNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791441922; c=relaxed/simple;
	bh=0OeGEzJI8NIJEpN1f4s7r0gX2dnV/siaBId2TnrL418=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c6oNDfFq7jQK0MullSmUXer+faaUNM8xvm3F62GMtkR1JecsZkjougbTWkAI4caaWJBrFiWZAtxI4N42ZzsIuKby6P5YhCEOWejJr/i7qLV5FnEHLI51m5KdOSG8FQd7twxjX7qF5FfhboTfZ+LtYjslUCHixkGXTaCXNBwiqqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvAOTDQM; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvAOTDQM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791441920; x=1822977920;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0OeGEzJI8NIJEpN1f4s7r0gX2dnV/siaBId2TnrL418=;
  b=HvAOTDQM5lKe5A+j0h+q4pGerTBGm7itit3CQ287qfQLX8djKLn1y7to
   PYqsZl6NLqjBbAV/aC4IQfmAPtJSf8hXLtFBC6Sx9dsrxTQTMyAIihWAG
   KZDGiAsxSyd/SA1G8JtzB2o6bmxP7bqzeq/7FaSsBbrLu1tFG+c+z1Bzo
   sI8UivHNHgUsUQj3f36Kdrgfh4aiegSLljDnDCj8X1F1yrKoXyTcOwi2m
   C+z4rMpAXRE7aK9rOgfYIbq2WHScXOFvBkH2c0BEyaH8gbQOKIojsj2RE
   oGeODIJDNI70SlBqFAyPexXRf8CAYS5FSScdw8XnN4J7C8IMr8gy3FXGH
   Q==;
X-CSE-ConnectionGUID: EEHip+JxT1qtGgAK2l6RBQ==
X-CSE-MsgGUID: +vTj7KWISbC3UtPQheCMaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="224975"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="224975"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:45:20 -0700
X-CSE-ConnectionGUID: goGHnfi/S2CVvIZ6yNC6bA==
X-CSE-MsgGUID: b7qXPCwVS8qFqM5LYuruDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="46462"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:45:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:45:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 23:45:18 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 23:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RbkU/t9tuPRhA7xKCTUfEGubwdHE87ePDi3ihWhQCBg3Se4YxUZuRz5jKaEZKXTn7Jtm2l33xlHgRXRudziP9jrb7lm0UBf+EbZGZA69fCB7Xwk+O7EzNBCtdyNr9OCoU0UAcDIK5k5YpJOKmzD4LMWnV5GUqfAJ0wDBeYgjSva8JMveorKN0SGqpBo3RZ2AT0Loo4Hn/n1W23EiZ1cUJ6BwMf6hdzXLlFjTVNMC4eDSB0Um/oj39E05u1xAGyobYgrOQSV025NPfnwL0ajnXXfJA/0WqIYnkC/0dGaSrwcsupAVr+WPRGXtMaP7+RuTydHoj7FefY4IhyBh8b2xUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGCT/Tai5zMwZjcRr2eGDsWrVoDgDsb6HoQfRovqGwg=;
 b=EY/84ASz8s41Qh3LeP7FnlL/feB7yIpygocGMvhy6Q6kFK++7uofbOP8DeiQEk5MPsWivXu+wM3DuXTImYWdsTvm4YDcNA/ZHUtmaCVM220F7NjYehyZOgvNwJdryKYCGpDrEktLB7tYlxCuxr63/uNpAy+q6cdSgX2otaiQpKqdxU9Nug98PRlxFO87wA9s19m+mnSVJkNiSUEw7trfSBhr0K0xTs2CDcd0UNNSO3ozqju7gr2XBzJ53nUMW4Qpj6Apb2JTmrdIAe1HQLXE8klUkcUe1h9IFSFku4ZkuZCD++xBUqeEJ8zdwNJiDRm6ZQpSJTti+fUMXdMnjIME1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9136.namprd11.prod.outlook.com (2603:10b6:208:574::12)
 by IA4PR11MB9057.namprd11.prod.outlook.com (2603:10b6:208:55d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 06:45:15 +0000
Received: from IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b]) by IA3PR11MB9136.namprd11.prod.outlook.com
 ([fe80::37b4:37a9:4f3:518b%5]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 06:45:15 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Xu Yilun <yilun.xu@linux.intel.com>, "Fang, Peter" <peter.fang@intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-coco@lists.linux.dev"
	<linux-coco@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"hpa@zytor.com" <hpa@zytor.com>, "Hansen, Dave" <dave.hansen@intel.com>,
	"kas@kernel.org" <kas@kernel.org>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "aik@amd.com" <aik@amd.com>,
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "seanjc@google.com"
	<seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "Gao, Chao"
	<chao.gao@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Li,
 Xiaoyao" <xiaoyao.li@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>, "Peng,
 Chao P" <chao.p.peng@intel.com>
Subject: RE: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest
 module
Thread-Topic: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest
 module
Thread-Index: AQHdS9q1tfxbPCXw5keeWCW2L3QwOrbnui8AgADxnQCACpyCwA==
Date: Thu, 8 Oct 2026 06:45:15 +0000
Message-ID: <IA3PR11MB91366518288A65E26D9C9BA192932@IA3PR11MB9136.namprd11.prod.outlook.com>
References: <20260924041032.1096569-1-zhenzhong.duan@intel.com>
 <20260924041032.1096569-2-zhenzhong.duan@intel.com>
 <ar2JlI0ApPCb_C2G@intel.com> <ar5UQg/Q4zePFSzb@yilunxu-OptiPlex-7050>
In-Reply-To: <ar5UQg/Q4zePFSzb@yilunxu-OptiPlex-7050>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9136:EE_|IA4PR11MB9057:EE_
x-ms-office365-filtering-correlation-id: f8dec4db-e019-4198-41ff-08df2507b5be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|11063799006|4143699003|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: fJhhoyISbKEIZ5z3eCn8mgElmKzZPWebpIJAOLNQGyttcDP3xLvY4gOjiaj0fKQFFqqrCKMjGlIKySSfvzl9SmbpfOxACG7TfYR0NlQQFPxsai5TlYRtRnlvYir6JfGf9RwNHqz1cwbkqGuFhWaO24su5DBLCKEFi8H6fXq7YpE/vkOBfsjyXFIO0CP9ry4PvmgwpwC4hGcQGqczxk4Bg00/5lOANM4IR1EtmRAlPKiX+GAlH1JYoNqB+Q9UMG7wO/Ljfd40cBvl2YVfkTdJAjZ8f+fkij1kNGVsC+jexpEbxTQq1xEI0cn0pRTBroRflgg4I+5cskvlnruHKHNudZEXXZPsdk5h7E6YmwpKWIqOP4UkxSQJxctFyQ7kcSMq+mR5K77McUZBwa/YCb51QG5xmRPy8vXHqfxewNSKpKdIw91FA2huBFcyivx9kOpxSnxLJg1SE/LRg08bM5zNIohFH4RCF4a8aALZkq0c/whPq74eyYuF83xalnhCjCMayEASCkbIW986RuHuvQaClxr+BTnlIi/Puu9vCsSn5gmWWh50QRYnLYW8jxVw1Xas0qgBjEeohU9yArStjzMGe68jld5a3ACs0mCGMi6lNQFt5tuwyT9OUN7mFl7ZhrrshRDljrHCUdWSW5rGzOywRza4uHJwUZJkH9p3PV0sQk5vV0oMXs7t7TMHi+A+V0x5ZsCXgbgh3v3eXuPeoqMAf1K7fYp5cnYDz1Mzqer81PU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9136.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I3LMScUeSDSmaYerprlqkoRTbXAhSu6QknTjcKFE35BZZm8iNvrQ7HYgTfrn?=
 =?us-ascii?Q?9bFLG8V6jyPhXwsbdaIm/a5fJUEit7GzqOXh1hQp7oSDC9OJDM6XoZ8w1WmM?=
 =?us-ascii?Q?i9o27EDWloUQsd4tdigH87zaPg3SdYIYB0xzEO/LV31suuPs2j3atVF6RHxz?=
 =?us-ascii?Q?yz3Mxtt5d2OIUtqasmgssPtPdjJFgCGPZAXxD2CJgEuZajp3J4rJwo7CJ2cY?=
 =?us-ascii?Q?ISXBc3qfSrWigNX8ARiKw5CCaNd8GWwMPQgS5HO9wgy9KJdyVwxXcbQ2pKTM?=
 =?us-ascii?Q?6CIEWgqypxapU3rJcSiYIu2Bf2kyPutSZQhnDhBLiJuWAvsBafKdA/SnQH0O?=
 =?us-ascii?Q?tpfloOMEYFL3TG0LRS5fX0ounA+OFqmaeACCrUQaEMYB1UDisdPc1mdvIOVc?=
 =?us-ascii?Q?/G2b87vwOigiS1T7Lj5LDJGacu0PInnfcgu6FStnGL//sR2NqRFGWI19C3Qo?=
 =?us-ascii?Q?zmxS/Oc9+ARiWrL+FChkkDiokvd7h9UrKKJSiM5VYwLFM3QpLWPd5p4gMZqK?=
 =?us-ascii?Q?/kk+tJEdHXc9N5i5tg+FZFr44g6nXP17PWLuJj7d8IQVSDb9rPUZH1kBzy++?=
 =?us-ascii?Q?JEKcWiFaMKfhAcCxu/G8pa5AQLOSRAoHNzOVqBrqAcY+9b5cfq051kVj59zN?=
 =?us-ascii?Q?YUHDdCtue79malvKpLbNvaffxfYrzxCuqfTWp/93V4z+uogX6trW/Z8S5mRJ?=
 =?us-ascii?Q?88LZtqp1h2OtsmiHLy9N/5YklXcNo9VR3GOg1B+t/1TUHdeFsu5YNhrz7Qjz?=
 =?us-ascii?Q?jU8uXSD7ZQLm0JVs77t2OemFDqi199nioedlvN4UdJHpJgMnKT60CrwDL0jR?=
 =?us-ascii?Q?FPEoLcKV+j8WIKCCquvKj90a8CK8E7m/C+J+yZvhaYHxLLTkfZ2Iq1hbslbm?=
 =?us-ascii?Q?wBQOS1u4A8BhkMNR+kGW8Bg7UZgioUFoW/GgkLa5iCuO2dtOa2u6MllxCP/Q?=
 =?us-ascii?Q?MpB3wntMo8/jhQDSwHPqc7A2d+nOnhwgV++gtJhkZSDKkVI+1cjctchbDKVP?=
 =?us-ascii?Q?YTX/dvyGbrPao4ZYdP1dJDuLeNRggzdbTn38rtrNc60eIL57zDdIRIBNFp8D?=
 =?us-ascii?Q?snbPhuG1+SW+HtwHnpzMgUC131+bKPVEGn00ODmvKvOfDBo5/87XrVaPMEl7?=
 =?us-ascii?Q?8UGF1qbPi+1VX2M61Fq9mq0wBw7yPcIoJbFkpS/b2C6Lu8pKfpEZCSDiw3gt?=
 =?us-ascii?Q?b/8qrgA8aXOUOzt8s4qCYD7NO8UgyoeUoJp0reZFuSDW51vZbfNrDerHeiY2?=
 =?us-ascii?Q?60XGICf/LgrNCuW+tY38as8B9NyTnLcAqzHtCCRovvISxMsbNcxcZid5Tpsr?=
 =?us-ascii?Q?5MBbLeIBY75Kpuq9Jbcvl9BeEWuFWLE7exiHzr4lh5bFku0YdfS59xL49fOS?=
 =?us-ascii?Q?nmrzacMKvz42wh5OJGib4crMNynLf1I3t4jLT7nJFf13aXlZU7uo2Cq1RMSw?=
 =?us-ascii?Q?cRXFpEmlRbGp2G7xIc1eMyRtaqimrr89zxQ1Eid7a53LaTTUNoqk6n5wUqkp?=
 =?us-ascii?Q?Kg4tTl3QfayuZGxLij3HUA+w0xYg8XRGAZI2bmGNTzQNPT8BUz90mqcrjBvH?=
 =?us-ascii?Q?8AVxZfWRBfbxHPmQUN+l6AX+vZM/vZHNJiCgtz/2YXaB6xZzq4sdl20+1KWh?=
 =?us-ascii?Q?11Y2Se7LKX7h+hqYkdjsae+mP/1IBXbf8QgNqZ8CR7udCaGXCGS1Tb5F1oD/?=
 =?us-ascii?Q?4ZipEgWIsfHjAy90Yv0MVxs0MpanJE0iRf1eQNCpS4IzrGBD2I2SVOLTuShv?=
 =?us-ascii?Q?1Br9pUFPUg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: y4LjWBbh35xMAOqU/EZlscstBRl25UQHBe41BuDGCj7xNrvjCtX683JDeV+9W7GGV/rnc8NDYDRr9KW14qYMIK9zy9pNQigsQkoslhI+XpL2bBIc4x0RILoJHavRszmI6qTgZr17ncEsvwb8LPJmzaf1kaufk81gOF9jU6JiPd8NcdyBsalJEebofQ7RUaNmWWFTlUmABBhwVybc3E41wT8jNXcCXpJiTm8AgarPMhiNrlAlAe3UzpgiKTlc+2enatGxL7kdCmbX7Mgw8jwWTb2laVnrrXYdOu+VTYLJxnZHXVYGPfh6iOYKL/XnoCop8z8YKlcE4PyGsSW71hV92Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9136.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8dec4db-e019-4198-41ff-08df2507b5be
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 06:45:15.4003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cdqfOMEBpHYpT1JlQ5hI/1EnWXY7S8KDCRoHoZv+DA68FIsuGtHNGcKlzS0HEtliUt6QKcdoq4ypm+BFOq32+XrtHK62IcLD0hAtj7ni3jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9057
X-OriginatorOrg: intel.com



>-----Original Message-----
>From: Xu Yilun <yilun.xu@linux.intel.com>
>Subject: Re: [RFC PATCH 01/15] x86/tdx: Export tdg_vm_rd() for tdx-guest m=
odule
>
>On Wed, Sep 30, 2026 at 03:13:40PM -0700, Peter Fang wrote:
>> On Thu, Sep 24, 2026 at 12:10:18PM +0800, Zhenzhong Duan wrote:
>> > Export tdg_vm_rd() to allow the tdx-guest driver module to directly
>> > read TD-scoped metadata fields from the Trust Domain Control Structure
>> > (TDCS) via TDG.VM.RD TDCALL.
>> >
>> > Since tdg_vm_rd() is read-only and cannot cause harm, exporting it
>> > directly is simpler and more flexible. This allows the tdx-guest drive=
r
>> > to read any TDCS field it needs.
>> >
>> > In a following patch, the tdx-guest driver will use tdg_vm_rd() to rea=
d
>> > TDCS_CONFIG_FLAGS field directly.
>>
>> Can this be a separate helper? I'm adding another helper for
>> TDCS_QUOTE_MAX_SIZE [1]. I think maybe their patterns should stay consis=
tent.
>>
>> Yilun, any thoughts on this?
>
>There was a helper in the series before this public RFC, but was then
>dropped, something like:
>
>int tdx_get_config_flags(u64 *flags)
>{
>	u64 sret;
>
>	sret =3D tdg_vm_rd(TDCS_CONFIG_FLAGS, flags);
>	if (sret)
>		return -EIO;
>
>	return 0;
>}
>EXPORT_SYMBOL_FOR_MODULES(tdx_get_config_flags, "tdx-guest");
>
>The concern is how risky is the tdg_vm_rd() export, and how it impacts
>the existing tdg_vm_rd() usage, and the tdh_mng_rd() export which reads
>the same data set on host.
>
>My initial concern about the cons of tdg_vm_rd() export are, the
>SEAMCALL reads any TDCS fields, some of them are writable by tdg_vm_wr()
>and there is no synchronization between them, so seems not a good kAPI.
>Reducing the scope to read-only fields (e.g. TDCS_CONFIG_FLAGS) may be a
>good start.
>
>Now there are 2 cases in flight: tdx_get_max_quote_size() helper in DICE
>and tdg_vm_rd() export here. Maybe we need more cases to see which is
>better but anyway I agree we'd better stay consistent now.

We have below existing use cases which are open-coded.
Maybe need to stay consistent to them?

             tdg_vm_rd(TDCS_TD_CTLS, &controls);
             tdg_vm_rd(TDCS_TOPOLOGY_ENUM_CONFIGURED, &configured);

Thanks
Zhenzhong
