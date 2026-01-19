Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D076350280
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812600; cv=fail; b=n0iAIYuCmL/whThpJ+z+enpeqp1GVbtmrnoiOcVrLTsqvoSslb+5cdBjUuv8lSQS2w3AFGaLASIMfuMgDmTSuduJXfsAWQI0EIdJ29EYOZIsgC1SenKD7uPxj2o6ZJpuROybi9yJQ/myi39wFNJC95NIuGxZOGJzS2x6y+azXHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812600; c=relaxed/simple;
	bh=bvEoxOM7hYccYpi5PivKL7kP88Luv8TVgpYGEpYMmDc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CDukuuhSOW10RdPoegQhy9f1pgobqKXGIHQKB2Dk/QBFi+mRByuenZJimgtfhn3m+cfAxKChNeLhoTzDqhGNC/43s9PxjGJ18MJgZ3OfUDxC8CDRzVpYpk2i8Zid3WbR1iVYOsE7Wmb2BJQxirxYZ3OPwpUsKAMl4eFOR0sxXhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ds5x3H2a; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds5x3H2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768812597; x=1800348597;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bvEoxOM7hYccYpi5PivKL7kP88Luv8TVgpYGEpYMmDc=;
  b=ds5x3H2a0105orB1pPUzcZApuiW3T2VSfyuNQ18IkhdVPUqlTsb0UmvW
   fcAKS69PPZHvf8vEIXdGV6SQhqP2HgCaS9L1bIUPcnVZVIJkCbKh/Rtaf
   Cn4L4BBw1C6FZ0CYa+XhuV6g0Y40puyE/AeuyMeNP/nrkmXXHlC7WO631
   JMuJcZlH0gTb1EhuRo1HKAgLHF4XOJrWhC+EFUSbY1G538j2N8pKfq6Y6
   qXChYE8rbMxB8nIgtu03aReM4H6Xsn+ATniITH8v1pTljV5quSIX0FWCn
   2vZCWgPQVE8gVn1DrTcIV2JRNR0Cyoh5sOKIyA+kQlTmIYq3StRHetx26
   w==;
X-CSE-ConnectionGUID: FwLOjTN2T62xMf7HFcUfnw==
X-CSE-MsgGUID: FJChMui4RDOWZm9yl7xB1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70183495"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70183495"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:49:55 -0800
X-CSE-ConnectionGUID: iTiPqqPmTA2/HkNHQ83e8A==
X-CSE-MsgGUID: iTxT7ekWQP2ne1YxGj/8wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="205605918"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 00:49:55 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 00:49:54 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 00:49:54 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 19 Jan 2026 00:49:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygXynnrwm/Udl9mRxoYa9q044YaPJNMpeHmTF1NIlz3k3Sic9VtFIyKv5W0uxuuDffY59BH+Ef8fhViXOfCyc8xvhF3qO/WV8cHl5Chw+wHq3Y7nIX95F4nMl13INcMiF/BJfMkJa2inMaBfhm3l5jAaZV3YFud59LqALr2TU7eVqkoUYDO95/h7V+Xjn3Aw1AQDxOcAUtdr7K2LJzuAlTm716nEN9W9BZbt9uVoEOPJZGovVLCrbvrOu+71Gb0yrabj7XUzEaGdAqzFAfyDchkCn2kPltHBzemaUhKOU/MmO76mt8g1NIlgTuz8MSKGDIZdJgvvNlX1FaI7VXIlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Def6ABhTVj0bxTSVDAhu0Mt15KcKxlrBvpeMrY+RuV0=;
 b=XiYkdG0cSgJQD0wUrWN6+w5Rxgfg4KCWtejfa2fYRjHbOdOlMZ6pvjZv1CQ6L/ZVOQLIRp6ULgNlPH6mgRHr/hW5bapaOp4ea/TYUJdL24mHYaWcy1FyVzzGQvgBhMUd6h7lryVtkiPTgoWP1m9U8wTtZl5pMW3wlqUWBPBcb8TUTomPv4HURaFLq6nNhbSk9fuMIQy0Vl6njWv26+xvC8LQexRGYBAU1jPeziEbeFpoRBCLob8HGzw3T79+xbQ8iSykOQvXR5mGa2sWq7vyhe0NrHnn5Jyn0UkrX3sj8bz8xQZB5SJMRbru/4PfvZ11M4WaQcEur88fbpNxf4B8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Mon, 19 Jan
 2026 08:49:49 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::fdc2:40ba:101d:40bf%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 08:49:49 +0000
Date: Mon, 19 Jan 2026 16:49:37 +0800
From: Chao Gao <chao.gao@intel.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
CC: <linux-coco@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, <reinette.chatre@intel.com>, <ira.weiny@intel.com>,
	<kai.huang@intel.com>, <dan.j.williams@intel.com>,
	<yilun.xu@linux.intel.com>, <sagis@google.com>, <vannapurve@google.com>,
	<paulmck@kernel.org>, <nik.borisov@suse.com>, Farrah Chen
	<farrah.chen@intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin"
	<hpa@zytor.com>
Subject: Re: [PATCH v2 19/21] x86/virt/tdx: Establish contexts for the new
 TDX Module
Message-ID: <aW3wIRuLFSkGU+KI@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-20-chao.gao@intel.com>
 <0a73607f-fe0b-4bd5-bc01-cd90841a39fa@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a73607f-fe0b-4bd5-bc01-cd90841a39fa@linux.intel.com>
X-ClientProxiedBy: SI2P153CA0010.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::13) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4492ad-3b69-4001-6538-08de5737b42f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SvOndzZqj7B5fxmV3KWPWDw6GvEDz0D5179eJT8SY+JdRmiOux11rizCyReI?=
 =?us-ascii?Q?lT6wuNTohY40iOfFp++EwaDkf2VXAYhtETh6uJq03J54dhpzMWMK7eAZFHlN?=
 =?us-ascii?Q?GFwYUUSiKaCFA/NX6Dbr7R9dRFKQRj/BDQq7nXWlUjK5crNslYwnKrz3Sswg?=
 =?us-ascii?Q?U+OOvIyqJ8k7mF0bivKa5qNzIrhR5+iDcuW78YCE7z7MwLoAuImOFRnbSPqS?=
 =?us-ascii?Q?xORXLq8lCnclDkokGTPxcAS1nh8pTtp3ONqLTN2bi9Iip0CM/VpcNZTdAVb2?=
 =?us-ascii?Q?k6VYimVMcCo2ERP86hsA/pWNUFknvgqz9rG7yoFxM751tm8RGYvruCoX4u9o?=
 =?us-ascii?Q?DbJ7oNj/jRueYwkWzwPOxp22YrXebW3K50/29LPis8rft9/3rkutB7DBBNnL?=
 =?us-ascii?Q?NmYMrF8M5X8ExP/0i+ifPXeOy5DZ1cmXTOHdkWqWWqQ+v25fyV8RDb/RGWuJ?=
 =?us-ascii?Q?KcxCMj12s38Nemr0Cr4OENOiMk1dzE7c16aIYN1lWGYeqluIOscMHuZAa1Z1?=
 =?us-ascii?Q?TIW6XfjSZPsSloSriMGGTM6U2WUTHmaIoq8au6uMh5tBKrHkqP2QHc0SmlPq?=
 =?us-ascii?Q?30eylULFbxbrtjVNkCdgMuKeOKf2NfDVZKkC3sgVMOQCBFjlgIi035CcSv53?=
 =?us-ascii?Q?CECLkGh6gjEhpGW6N9qOOVDv0Yjh5FevrADdtFDj3IgtLQ6AsHbKKagqYVfv?=
 =?us-ascii?Q?v3JzVLULigBx/Ch2V0v+N+GEPiFPSzrZWHCsFKMGc0KgyHWcbCEmZ/Tg7+m5?=
 =?us-ascii?Q?k5pJhTR/JnAmF3+eS2WabQMlfemqFcD9RTlzpBpTFZTPmESBqrRpllM6/Ydg?=
 =?us-ascii?Q?GMQxrvHIT+9ZGSdNTsnyiBeaxtnA+92kupN45im7jqDbb5xhNt18/t6dSGCK?=
 =?us-ascii?Q?oVzGaG7IVh0lcnj5e/iKXltsMKUK76AVVIKEcVFpLzDxK38paIXJqtqakHxN?=
 =?us-ascii?Q?x/BBR5ibQl6hG1wSaP0qqMInezHOUW4AvW8PdLznduG8Zyh0O+LaGb31n3MK?=
 =?us-ascii?Q?wRd3jLJ4Pq5cqO2l7PLkdVcpHgyACvvvqiVRPCj7BXVOUqIf8tLIpJ1aYFHu?=
 =?us-ascii?Q?yfwLbb7g174IcR2HcgNUNYz2QXoVqah3VB8QQ943LAb/KI3jMSVxuJx3PRpS?=
 =?us-ascii?Q?kU9MPMdTvYpkOR1hN6oySx7h95QBTPiMlHeWPPMpaimH7WAKCgUF7fVCrdui?=
 =?us-ascii?Q?kmp1B/V+607YwuIgR2y2gW4tB3nRqLU8FqG/Ji16LsdkD1kzeIwlVAnWEHJ3?=
 =?us-ascii?Q?6CSEE6MMPTjHxU6F7fu/mKopWN8W/hjdYNR9lCHBmLww8Ofmh8Z5dshvTmVM?=
 =?us-ascii?Q?lVsaHc5fQKu7sirxRpm0XLxTMHCppuLEkm4f3C+n2B6/o5GG+zgJxzFBYPhV?=
 =?us-ascii?Q?fnkRTybkwCxjjugeOt5x49nWmB2mODVw3mnkHjbir5Rmfmoo/xv3vxNvRg4e?=
 =?us-ascii?Q?3Gi2i3/k9XbGJKSlgAmmer9Lnd+k2HBkC2Du5J9pJ29AXKl8J37b00PZdxLb?=
 =?us-ascii?Q?a6RNW3WN/zui49vln2/wcVrs6NKPTgbdrlyUTwD30Crl/fjMmiEHSeEnMG1K?=
 =?us-ascii?Q?cIIFQ6kenbayo6inLmY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N421cirxdaWGQxlZ7xcaINntQnCg6fOEaP9GeqkfUDzDe8XRS1NoECO/nTAP?=
 =?us-ascii?Q?C1mafPSyYQ7dppY3Er8DI5I9CyAAvYvleEKH8+6rf4hVbfslEBirDQ4Lr9cc?=
 =?us-ascii?Q?AwubVecvHjprD+kmFIXOdKazsZewg7FZT2HPJecOw0+bt0YP2eHQrwg//ZG3?=
 =?us-ascii?Q?NGzIKIH+sI/k/v52ba8YlZfpSQk7nhuJlhuyYY9HBRVSe+LKbkR0p7pn125V?=
 =?us-ascii?Q?v/RGa7ksvaQCIleXFyRaBY6GxNXWsKhOu3QIP6GM4UF0JlhIUloSAGzfT8sU?=
 =?us-ascii?Q?unS9k1Bz5bLr06fswI9hU2aHoLcaQzyOIgfycxbJ3/z+ivPH1UXXMgg3W5l6?=
 =?us-ascii?Q?Z8iTrwWV0Zh7zGJAy7zFlEUFlxsaDQdtC3MS0h+duD2Pl6nHxh4dfFzKo61l?=
 =?us-ascii?Q?6ggHnKAD6c9FMBLfj6FK5pEdTNJyFp3nMd4eoYjeX19YdVR/T2SySP48RPIw?=
 =?us-ascii?Q?9HjovWlgipXRTEn14hZ9CPBFkn2LJzHeU4RNU7OZ1nB2gdaCwgOt5nq7ss3H?=
 =?us-ascii?Q?jC5jo0rARSWV3Ligii6wNZBEYT9+MuC4Fv6vFBZBq7xvCvGNYsF0qWyiTyBU?=
 =?us-ascii?Q?O9A7M/mOmyLfAfGuY8mJl2tssCqIihSpBdlBE5dXJ7pw/4Wxg1Kf0J9L6pQr?=
 =?us-ascii?Q?ejtj3gcgDEJsxeS2Vmu23mT6Cuh91tq4wvPVdSMNcmTF6TYzhgTG7TUJaG8A?=
 =?us-ascii?Q?a6bCSQTaXm9lsR2AMlRl71wBOntukHXUCo3X3izGmWdPOrG9bYW5cGq+qUYS?=
 =?us-ascii?Q?pmKoHkXW+vOmRCaFJDbelrsQvKQ0xvBm5Vat6aZqu9igAkRSR0vwqClU5aTL?=
 =?us-ascii?Q?klMmFe6GqM6zBHVXFZAe8H58Xh/uD2aFVQWFUuwf1hVFiRFJfvmH+L1Dt82i?=
 =?us-ascii?Q?N13gJKMsO7RC2HEmIce27WIZr4Wqz2fsLY6U6E4zX9o3b5XPSpj1jE2HWMCJ?=
 =?us-ascii?Q?+SMA80K9jKhnSTyigq8rAzy+UkdcxKiK6i0pRnl2vUlhkBBwEoe2ejlGGu7q?=
 =?us-ascii?Q?YGtntIucmi+5ltwefs4Pdvdtn2QDDUYgR3xdSbsUBmmVEEzw4DXtKAAdEt/d?=
 =?us-ascii?Q?WNldUQBbVoRJesOo7FwqG68y3iXZ1LfYCfbtw4nwTU3XADwtRndAoH8Wtzhg?=
 =?us-ascii?Q?0hWIdyrgG1i2Kp4DQs/LkJiK59xAE5delXErRIY/F1YZT3m+Rb1q9L9Z8Cy6?=
 =?us-ascii?Q?pyGHVkX22sXQcG2vjJgaYuNFGGbdpuMY2AYss/ZGL5vRXwQIiCYJX3BPibxV?=
 =?us-ascii?Q?RUqDYFNMDWztf83ciOO1mXT5yFY3UY3f2EdOMpXHrlDY01fxbiTaNtvg0kPi?=
 =?us-ascii?Q?LlDbcuQzNh0P8gCjsyvlzPWFXE2T38Xs4X64uI9yDYcWPzk09Wr5r6tVpCnv?=
 =?us-ascii?Q?Hdh3RjSLtibVX0YMroTfMd0gnVhEdT1S0hfiDDVF5gnpHF+hpc6QlVbNyZNd?=
 =?us-ascii?Q?7g2+0tEQ98eM9pFewT3qq8ZjKXSDZj2qEV4vcAwjvR6J9s1iL9DkNaZqA7ky?=
 =?us-ascii?Q?gz3/dllsuREuaSdbiwu7pU7ELF63V97sZh4vqdmuwDgMWuUPwpKpCTBhAfLG?=
 =?us-ascii?Q?NfFVCyAUwW853fqJsEaMGJKS4uII1v++ZTVsRJqO1cGtohnkQjPWxK/xM8hK?=
 =?us-ascii?Q?vNMjvQp03hmuCCMG08YcBZmz+mOwpQ9lrBBuLrPSwPefGfT1UoJ4YvXfAeQl?=
 =?us-ascii?Q?ant1LViyZNPHgnZlpnW4VkztvCPSyJt0U/YqGRm2oL65XgE/UWT50R6se5sx?=
 =?us-ascii?Q?Ssc1pxRSCA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4492ad-3b69-4001-6538-08de5737b42f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 08:49:49.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S69+HdE5EJZXCms8X+yhGG6D2YtkaM2lk1Wqj2T0J6kkRt52k+PfNOMIMZPf9mwHi3QhFmyKlCbq1+oe82rFGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
X-OriginatorOrg: intel.com

>> +int tdx_module_run_update(void)
>> +{
>> +	struct tdx_module_args args = {};
>> +	int ret;> +
>> +	ret = seamcall(TDH_SYS_UPDATE, &args);
>
>Since it's a seamcall error, shouldn't it be u64?

Good catch. I will use seamcall_prerr(), which returns an int.

>
>> +	if (ret) {
>> +		tdx_module_status = TDX_MODULE_ERROR;
>> +		pr_info("module update failed: %d\n", ret);
>
>pr_info -> pr_err?

Yes.
