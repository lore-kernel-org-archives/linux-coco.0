Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D0B28680
	for <linux-coco@lists.linux.dev>; Wed, 25 Oct 2023 20:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B745a89t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698264414; x=1729800414;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=mNZRunmVlJfScIRtBpgmaZS/X+ENev8IvI/OcBx2REE=;
  b=B745a89tNExE/SoehEb9KafRAkcJ/N2RVf9Z4sf07Ug5fnXC77NvpXKQ
   GNTgGFKxlbKIUxBFo4z2igVaMW4JXW+e5w+5/AppMoKMjUYMz2xkRwle9
   eRK+MGK0l4UjBSuXymTKWoxFjGABeinsI+okxTd5nUGdDlA9pUtkHhN/o
   RAOvIBs8ReSgFh1R2bSkBOuYnftidC5AJmZHK9+t/NxtPYM9allik8ZO1
   TbFEkudtrtz9vhip0Hdw8TQ6hyD9e68e9SmtwVbXSonLDPquigfdfV6PU
   q++39LptF8BMP6nxkIKmO/AiNyUz8I9isjIzOMtZsaLu9WcqA2nuITAwp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="367602537"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="367602537"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 13:06:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="882557192"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="882557192"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Oct 2023 13:06:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 13:06:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 25 Oct 2023 13:06:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 13:06:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SclxNHHnX0Gl55PP//vOXc9w4xo3rklk0fFUrlgsDyHYp6HcK4jf8aSUd2ZOGcK/f8vQnZDd27iZ1IMIU16HEo/Fj9qU1xW4NsoVoR+Xhz7Gu6uMwNbeQhAQ+i+TXbOmZeUB0TDYvxrMTjo2mV8QG9TQachzt9RWht/t+9kBJQ2rN8KXe3MuupFxEuOTwYlrlxNF469hLj2rhXbrp8/yR5UWYioKIsDofL6oreIUhey+OGWE6HX9kCj0MJqRQSyvWNyh8qPAsCY2O2WBX+sggaX5PpxIeMzD7RTl7iFea7ZycmCr/L0kKNdbgqK5TqsehIvCh0S6oY8BFiKvu4B6rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lHhvcq2D8B7AC6s6bQ2BPioYv5Rq+PkaN2SWscx3TQ=;
 b=Fo+28NT35MaIie64mekN4pg8fexglEioLJK0t+Va89K2Znt4IdcqIlx1YUHPGRdFIlIKHrWhVOJ61V8lvDgz64bqEMjKII6cz3jwCxjHnPvhle8FeeOH3DUFJYCbZEJy/DiF2GmcXIHpPv+rTqJ08nDprlCTu1R8ExsvoAYPPNuW3M865kZ1TdvflKM+QI/4yAu3+4tepA1fg7hL6vxYSLWKD/Sns1aVK9+i2kxP0f2FllHCxdOhhjdSIq1PDNq01XEmw8D3jPIa+dd0RzlZTzXEkkg2t0iTUrmq+9bkuTOd5LyjjgGEEMq57j769gdFEc5JTUTtgIccsXQmIXClvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 20:06:49 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::e75f:ec47:9be1:e9e4]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::e75f:ec47:9be1:e9e4%4]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 20:06:49 +0000
Date: Wed, 25 Oct 2023 13:06:47 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Qinkun Bao <qinkun@google.com>, Dan Williams <dan.j.williams@intel.com>
CC: <linux-coco@lists.linux.dev>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, Dionna Amalie Glaze
	<dionnaglaze@google.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Peter Gonda <pgonda@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz
	<sameo@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky
	<thomas.lendacky@amd.com>, <peterz@infradead.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <kmoy@google.com>, Chong Cai
	<chongc@google.com>
Subject: Re: [PATCH v7 3/7] configfs-tsm: Introduce a shared ABI for
 attestation reports
Message-ID: <65397556ee5cc_7258329495@dwillia2-xfh.jf.intel.com.notmuch>
References: <169776458564.1705513.13069337506739791098.stgit@dwillia2-xfh.jf.intel.com>
 <169776460274.1705513.13197205255470913945.stgit@dwillia2-xfh.jf.intel.com>
 <9483D8AA-82D5-408A-8D17-67916A880982@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9483D8AA-82D5-408A-8D17-67916A880982@google.com>
X-ClientProxiedBy: MW4PR02CA0005.namprd02.prod.outlook.com
 (2603:10b6:303:16d::14) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5e31c0-259c-43ee-a6a5-08dbd595ec6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D/nL9KoK0ErgvQz30nPR5EVAJdQhcpiM3J+VS00a8MnRGJ/kHcbVWWP0oUeMv5n3f13VxwpaeM7WNw6o31DToxowEp08/vYaXjlxFurPtEZxpdwpVcI2BJ76j9QpBWdlA3yEM/uCN/3xk/PRYJQnuuzLaO1EnvAdrf0Saf5KNSArzLvKjiYr+xnU+O7sNFSP/7W3dlnYdrO93/Gnn3aKR2WxsNXKPKpCObzZ5ieaAGHrhkjOKOcFMHbXJKG9XX1AH5XVYgmxBVtudQI5AOjXDochzuB/5diVkciSAU1vVXhbDsH8385znKMpEcsmUolbz9W+n7TcPsXz5hMqVQRrqLlvIZEJYvuqxmUDl7VheFQ1L5j8AYFt8c60SzVjuPTvJEV0j2J8nNobraVkCfs2Ed9KtkG/wLimmTn/YGe7OuF6YmCgPlz8oRuOt/PRE9xB7LDy8Iez3Pxk5S/yBUg0/x+z3w3qfr0PbnrU4OU2vAnkas5xu7nSDcVgXodyG6fncyv9dZBJLHVVtO/nVZdYlFp3/b+t/LllCjxCKG7FuseTVP/hrp/14i/Ptiz1ornc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6506007)(110136005)(9686003)(4326008)(8676002)(7416002)(41300700001)(478600001)(5660300002)(8936002)(2906002)(6486002)(54906003)(6512007)(66556008)(316002)(66476007)(66946007)(82960400001)(86362001)(38100700002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXNNZHd4Y0hpb3EwNDNVWHVGSFh6RWpTVWJzTkgyeHlteUExalFkd2FFeEFs?=
 =?utf-8?B?cVU1TlQxUVRyK3A5ZHJvaHUwVVk4MnBvQ0cxVUFnNEdFdm1QUTh6aHBTVVRo?=
 =?utf-8?B?N2laamRTWm55TE5ZOFQ4bUptVFNXaDNWaXZCUTVPM01xUXpHa1NUL1p3NWwz?=
 =?utf-8?B?WTg2ODUwTEFHK0QzWCtZRStZRnNZOGhWcmt2UnJMY29WK2kwQjJsOTVodUtG?=
 =?utf-8?B?MEFxQWE0VDdzYm16MUN5WjZqdGE4QzE4UnNhaTRXZ0FQODkvaTgwZ2VOR1dC?=
 =?utf-8?B?RFVMNXRvSjU2dmF2eWx3K3JUMUl6ZHczTjNlSW4wM1BkY1BqUkxWbHhVV2pu?=
 =?utf-8?B?dTlsZkk4V1VXM3cvSFJveUttQytTc1NLaHovaHJ2T3hXemdySjJEcURNSFJu?=
 =?utf-8?B?WS85QXREQ2lvYXNIOVlQQTVsSTYwbVpLblIyK3Z5dVk1Z3pMQVkwTjF4YVAw?=
 =?utf-8?B?dktjNk53RGhSZEk4U0xHLzNCbFhUSmpncktWdkU5MmNpWmtkcjQyZURYL0dW?=
 =?utf-8?B?bnR5T3dpWmhNWTRMSTVDS0RuWGIzVnl1TUNtSDlwVlRxckpLeGZwY2xPWWdZ?=
 =?utf-8?B?MFNCU3B0NSsrMFNzYUFiaEdYOXFXRFhlbW9TVitwS2JkNjZDZW9wenk4dStw?=
 =?utf-8?B?Y3cyeUpHT2lrQUJDNUhoZ2F0bDFZV3VzZC9hVGR2QmhROGdzUjJaclVVU1gy?=
 =?utf-8?B?WlZHbnEvWEU2NnNCUzIvQzlaS3pvNEFRbU55dnFTQ1RmZmZTdlNzM3o3SU5G?=
 =?utf-8?B?dkVLSkNFcUh6TnViTjgrT25JZkFyTUNtcG1QWjJ0SUxzWXpjQXlUZENjcWpD?=
 =?utf-8?B?ZEdrVUE3RHhUNnUvYldxMGdTS1lOSDVkVllmUUtmYjNTb0xOVGJXL05jVHVQ?=
 =?utf-8?B?R0V0aHF1dlkxYmtGWXlXd1VGQVZ5OFEwTzAvbUFnVEE3Q2N2WkFXQ0pkamFs?=
 =?utf-8?B?UDV1Sngrb0xCL0UyWTJWWDhiSDJ1MmJ4cC9HbWRaVnNGTm1oVkJiaXpBK21Y?=
 =?utf-8?B?Nkx2ZHg3Ujh3Z0RkQ0hKZkdIRTllbmNYbllGV1BiSmpmYkVvbmwzeTRDZi8v?=
 =?utf-8?B?OVo1ZW1NOE02L3R3SE5sLzhZUWwrMUhnTWlMY1VyOFlaQXJhdGpFODl1aUlN?=
 =?utf-8?B?UUxTM0NyRW92MVBLRWZ0aE9CWHFvNHM4Q3FmdzNESnRlRjZpVTZHMVNOaWU1?=
 =?utf-8?B?eTFYRDlOa05wUzlYSUtJQVpzOWV2RGdud1orMllMVUNDNDRqWDMzdE9tTE9O?=
 =?utf-8?B?TUs0ZFVzRURhQUo4YmUzWlFUbmtNdC9lNEM3MmhicGxrc0s0ZlVyeGNzYzVS?=
 =?utf-8?B?dGVUKzVVV0pzTjN4eDArSy83Y1FEaDVYU3lqazFlb1h0NzN1aUpSSWxPc3Qv?=
 =?utf-8?B?M0FTdUI5dEhBbndSK1ZCWEQveFVDYjMwdEFNcGFOTHMycVpDWExuUGFleHFt?=
 =?utf-8?B?UEQ1SytUdzNsRk5xWFlCZm9KNWx2QmlTaTM5bTJkLzROYmhKTyszNURwM09U?=
 =?utf-8?B?VEpIZ3R3anIwWGVjbnBQenVUTWRQVjNJNHovZDR1TWU0d05qUkVMamV1UU5a?=
 =?utf-8?B?dG92Tkh1bXdBSUJRdUpuQXJjOUtlczRWMzZ3R1BFZk5CUGlrV1ZCRTh0ZGEv?=
 =?utf-8?B?VFBPWHFNLzNaaGNFV3RUbmdIcnZsVWhqaEdKem1aeXphYjdOUlQ2QXUzTldJ?=
 =?utf-8?B?TUVkSjlHTmk5VE1tOWtsVS9wbFl6VGNuamZyN3didU1TbXA5aG4rdlB6ZUZ4?=
 =?utf-8?B?d2oydzRNbCt1SVk5S29obHFnQWZOWDZIYVFNUkZaM2lHM3pPVjhiOG85cEFI?=
 =?utf-8?B?bEVnUUVGa0VnMWZGSDlhZlg2UUlGVXFKK3E4R0RXYUVYZkpLYTJHSVZaRXY2?=
 =?utf-8?B?WmsyZHZlZm1GL3ZTdTNKUkhEVEpkNVl0U21zQ2hjOXR1QjUwZGZvUzhPNGZG?=
 =?utf-8?B?bU8zeUZXSEk1M3hkK0JjOTVMSTVzcitYVkVudDRya093Y2JTYWM4TWZLWHRB?=
 =?utf-8?B?SU41cTlWV09yOTZKb0FlcUloSXdCN0lpeFRSWW1FeWVpNDcyK0EvK1FvQWpx?=
 =?utf-8?B?L3d2QUFteTdTaG9zMWdHcG4xbzBBbSs5RmRoV2pWNEdvdEVRN0srTDlxREY5?=
 =?utf-8?B?WTNnc2Vid2o3aFJLcXNaQVNJRmQ4ZFFubkswZjlWQmhWNUZ0UWdmQXlucFVr?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5e31c0-259c-43ee-a6a5-08dbd595ec6d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 20:06:49.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5503G88oeR+4Vg8ptJNsuPTZ8dvGCNm3EZyjQAST5QCvQvewihnl5L/C62Nk8ruwtD/HiICjpipZOSGJcMRPtio2XeO2kcZehT5Wmq4CdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
X-OriginatorOrg: intel.com

Qinkun Bao wrote:
[..]
> The patch raised some internal discussions at Google. Some have concerns 
> about the potential collision problems. We have reached out to Dan. Dan 
> mentioned that “configfs puts some onus on userspace to avoid collisions”.
> I have listed the changes in the userspace here to ensure that we have the 
> correct understanding and that the complexity for the userspace is necessary.

I am disappointed this conversation continues to be revisited. Configfs
is an established ABI mechanism that requires well behaved userspace.
Configfs is not alone in this requirement which is why mechanisms like
D-Bus exist to broker a service for multiple clients. Configfs at least
allows each container to have its own broker which was a concession in
this effort to balance cross-container management complexity.

Yes, userspace care is necessary for configfs. On balance, I would
choose to spend my time building a userspace broker before entertaining
an idea to onboard more complication to the kernel.
