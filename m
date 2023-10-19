Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541CA5C
	for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 03:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyaKo+Jr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697686507; x=1729222507;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=k/XN7Cl80NsiTeV28thLI+DZ6X1Y30D12TI7cTqou2s=;
  b=AyaKo+Jr35SYrqNGQ4SZIdYcokcGLYl9bhlhqOnrM3XSwtNouTkVrgVn
   DLtTxqpj9gFy2WnjhDeOehUYXWfTeKzTsGvsY9mTk3E/FKGspbSw+jnz8
   sWPnUm7ckSfZ4d5QtNvXutPk1nXCv96++UIiUk+mxVGGxAKscpiLGYGsL
   oZAhahTeH9fNwfv8GzWgseGbvriwmZ40wBYhB02M4I0zGx74eAr6TfelA
   mX4/9CACb7W9Fy+oZwVPRcKvyMNg1CDEsEtMve2oEIhl2rrchs2yGleCf
   hvGYAqtqrwBXP3iw1KcYyzX/56Bf0fb46BDQsUWl00zAIUXQR+zVblURR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="4757045"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="4757045"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 20:35:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706705663"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="706705663"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Oct 2023 20:35:05 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 20:35:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 20:35:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 20:35:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 20:35:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OEwnYsQ+QZ4ajBAzGrNPpj6gytJMXKwYGOK67750oz04TJWnlCF3uEZ1kI/mzdZUl8xqJxl9GO10iNwAgxOZtld2eRwFpugY3CAvQGy91EYwMGXmRs/genpZbfOrCpNglwDXJMS8UEkrmJQ641eVdzt7Ac0HT3UBdtGoakiX/pYAox12o/mlPqMfDCVN9JE9TP1FkufoiS80mLQpda52wkLyZsa1+LGHaRgPH63zJMnvcvh4BQJj4NGn2ygjYtw9ERUDOp9KUbHS5K4mwjt0eXbwarPhAFkl6T3wSwKpU0fZx+MPiuC8J3Vfl5N3y5MvFqZS8yISHYZ4TrcQ3m/gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiBUFpyBm5OW+TXEry6L7cJqiAX+UjXYuuoYynrfVQU=;
 b=IrInLNszbpYl6CEbxLVpEJmV1r91aWrBXXx6tkIvyO00jOhoq6bT4mq+H69+01M4r253FXYL9+YS/tZJ3J5oCu1RpPnchgkTxM1DJx8en3ntyxWSoBeIGub0GE5qm+q6U05/XIsvRvCvgv2QcNLw4astiKV7eVzvoNKiEddFMJF7yeuTSMP/Hkv+9zeV56sO19r6Qrv4CvaCr+DWzC8QIJZBKM76RZD3ua7a10vUD2ykiuvqlLSOBno6bSEcc5HpA9pykB+BWU1/PxO6UrcKkTnr0DtK49WbfsEI2ly381Z8fvJPEnFGumQKN+/R+QlYUDUDc8KFhcGwUnOpjn/6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM8PR11MB5621.namprd11.prod.outlook.com (2603:10b6:8:38::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Thu, 19 Oct
 2023 03:35:02 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 03:35:02 +0000
Date: Wed, 18 Oct 2023 20:34:48 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <linux-coco@lists.linux.dev>
CC: Borislav Petkov <bp@alien8.de>, Tom Lendacky <thomas.lendacky@amd.com>,
	Dionna Glaze <dionnaglaze@google.com>, Brijesh Singh <brijesh.singh@amd.com>,
	Jeremi Piotrowski <jpiotrowski@linux.microsoft.com>, "Kuppuswamy
 Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
	<peterz@infradead.org>, <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v6 6/7] virt: sevguest: Add TSM_REPORTS support for
 SNP_GET_EXT_REPORT
Message-ID: <6530a3d89f717_5c0d29481@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
X-ClientProxiedBy: MW4PR04CA0375.namprd04.prod.outlook.com
 (2603:10b6:303:81::20) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM8PR11MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: 1805d20d-faf8-4078-797c-08dbd05460c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktElLDN67PfyM2o8m3X+WUHLg/hphUl6b+U9coKO0BdZYx0ccmBMlWgrVgtiDNffI0uUUMgjlPGaEMcTL7dI9SW+BkkD55wi7B19KHMhUgar3/nkTXXz5C5Tpna64xqXTZUmDgBa8sQztISarcC5gSMZ44CWl1tPXB+OC6dipgwAabOOX1YwJ5rLn0fKBpNy2paXv6OexJBOwgg6DGtD1+94ZVzwYopto/MMCeR1JXTFME+wqnciujFkVd+PA5/mv3t1k4FojPyPcnUtAc/ygWwMe44jcNiRURLQHozuOMIVvL2XSnQOZAVNKUSdgI49MjZlf7iL4n1mIF0j0plkk8IrcHbP0jKuYDvAxsVYeB/5e/9+OQ9JEDgZI6CXQxYYjlgDYzynw25nSCSOYvofGNWCPc0lEXNw4ZQc8F5ph7gVlZx0lP/AmNAS8+vcc7pXAAVQ3svjADvLU8H0PonnDoBG+llIjsU492IgBgCzv/J7xV4d5eHePyMva7HCpaq76XNHY8YnQAVdOn0O/FPZ0vVP0TdXvcBSvQp8uOqY4ppkiALPCIs4Nh9Z0vVzSZEg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(66476007)(66946007)(110136005)(8936002)(54906003)(316002)(66556008)(6486002)(6666004)(478600001)(8676002)(41300700001)(5660300002)(4326008)(4744005)(86362001)(2906002)(7416002)(38100700002)(6506007)(6512007)(26005)(82960400001)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GK551fazx+ikx4eyYcm8OtpXV3dLgtMRzolUq+2Y58RiA8jQfDvopZwgAF/9?=
 =?us-ascii?Q?Hp5wsJq5yhb92OVpnhDlshR6f7muveDIQIVE3iVCAH0mFV1ATpkunfim+KNs?=
 =?us-ascii?Q?cs/Sw+BZ6iB7sRKZIDFnBqWiPb89vht4bUOG9P6SVwxqVPt43Az7v0c8sMKA?=
 =?us-ascii?Q?+7Sg+4KYNstVX6i3voJL/dUzlPz9HRh/L/izbjEl0PMJp1OuVUI+90V/yPsA?=
 =?us-ascii?Q?dezgzIkiPUwrwoEyBodgFmJa6VapcthBgHa8yTeADBHV/NlpGoGhNESNEOqP?=
 =?us-ascii?Q?28cY/CjBtZYaGDITqncFtnfqDS2cjfqERqcZjHDNd6SuLTM17Bxb++2aqG5D?=
 =?us-ascii?Q?ryeBupt4iMF4xiRg3pJJDl2QlHzKevgw7FzicR6ruX7W5a75yRqs9S+EGjN0?=
 =?us-ascii?Q?meNr5EiFp40oXD20L2TloZwtBObEX0Co0GUwKape+m6NuK0yvNGCVl+U2XWq?=
 =?us-ascii?Q?e69n/6HknRZUnRWQHnqFDfPMmjQuzMqZszN6FEPgKtd/Vve8n2EARrnhXaCD?=
 =?us-ascii?Q?KmKGj0/po2jS7rtMX9H+eShYqdWdhqQPWDT5pj+F1thLPr0pJCgK2i/CX4ts?=
 =?us-ascii?Q?UnvhvVy9ZwKofq2osd1Y1ib1gxB++0Ow4vYwQCiLXO11gawO2DUUWszwv7ug?=
 =?us-ascii?Q?fB622zKY38lTuWADm3904dvKnuBFD/5eruym/ahd0DR3i/czYy6xxqtLXZPx?=
 =?us-ascii?Q?JBZ5Fzn+QzM1HUWWHcqcn7V/TRk/Myi7m0int9motIHXDP/h916WUXUTuwWt?=
 =?us-ascii?Q?5GcQVlHvjxP9u/At9VCKGOfBpluj7VrMy/vYO3Wy07LFHJXbeO4RS5PGeO+V?=
 =?us-ascii?Q?VFWzJYj+tfRRsDl2nNX09gu7WUUXGvyd++ah0TDk2Q51lBzhm1sF6bVbL3cJ?=
 =?us-ascii?Q?k6sGquMTw4B1ocSOrXsIINlXnlh/VP6fLsA22SOmmotbPqsJtEv+4V4ikJNv?=
 =?us-ascii?Q?K8lzp2a0lsnev2iPft4UyxpWqNyHVuiTNIlP0g3TnQkJcsWcRgSRNgOJCeli?=
 =?us-ascii?Q?8nW5AU/69hKwmWPlybBcuouPhL1ClMslpB/kF1xmF572BdyajC2scZvrHSbn?=
 =?us-ascii?Q?mSHNm3bTmda9Ept1VjVqqPxK0CD/f2MeiCRBlFll4mBSMQtMa5/d4BXGMwz3?=
 =?us-ascii?Q?UUdeQ9viVY/uACcBxotnxrcpC8DJBfDgnV61yg8DuqnrdWgqMdhcKt6B/LQH?=
 =?us-ascii?Q?+3HVgZZC2O3SzzE8W46xbR1xozg6LpdwMNQfdQPE+IYzqfOGQQzEaM6Man5X?=
 =?us-ascii?Q?YphIU91my3yW/utEEKjQQ5ffVieIa40XRmw4uPQAJcTBL+XNI8qLiBnOkjDf?=
 =?us-ascii?Q?e67+jzm0cEr9iuQ3o74/wzOLOdNKJE2mpKQFce7g7AQ8O4mnsvE83EFpzlbH?=
 =?us-ascii?Q?XJHtnhlD1MESyP5dkZSG5gFYv4QHzqDEixUHnHi+JOEN2YAlEJFm7WXSt8mc?=
 =?us-ascii?Q?Tt9RBrJpdWzqD5mPTXl22DlpdJC4jXfpcQRHFXu6XT5blU3Lq0a/nXir4tU1?=
 =?us-ascii?Q?q6+VXdJG7YkdvDwSoWqtJeLGgpjK4G0lALaU5WFccFBeU9NKtNp4baewp1+S?=
 =?us-ascii?Q?yGrkBWBH6v2JAyVMVUjEWMVWb+22nnmqMJk1LG/hvk+202uaRsgrjHxWk/47?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1805d20d-faf8-4078-797c-08dbd05460c9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 03:35:02.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HhkBjAVEztfHxrMEwd57VzEnCZpJbvkP4dxGxibA/RI5iA6D27SyjiQs2jOe/xk3pnek04epg1K8ah9hkBuaYtmmOyBaDiYFpbIrWjWzs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5621
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
> > +
> > +	if (desc->inblob_len != 64)
> 
> 64 is either ext_req.data.user_data or TSM_INBLOB_MAX really.
> May be even BUILD_BUG_ON(TSM_INBLOB_MAX != sizeof(ext_req.data.user_data)) ?

It may be the case that other implementations want a larger
TSM_INBLOB_MAX. Now that something else cares about the size of the user
data I think a new SNP_REPORT_USER_DATA_SIZE definition is appropriate.
