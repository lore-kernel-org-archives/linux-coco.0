Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFA4F885
	for <linux-coco@lists.linux.dev>; Mon, 12 Feb 2024 23:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707779547; cv=fail; b=VcbO0dFhZ026sogWsKkCN4fidqQjDXlIqTYy6HH0SvitVBlP2QA5rZzeTvUCWWJ8qC1pua4QFJnL+9KyQHJN0yF5r5KFjh3XrQvWHl3IstVfk8wb6jBWUQVp/6zWSUSKycU2ptIBEfXV9wMN+hqp+SIhvO4gYfBuxCK7/moJHYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707779547; c=relaxed/simple;
	bh=DHRh8I/ZbrMkFErpr0pUYFbWvhNAz8wSI8I7+oaJWN4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s/69oPIdJYGOpcxobyHCJiPfyONv/xOVq1cmpXCfVqxW3en5AW1+gnRk6XqMoEBC25prfZjYGMY/5HVsr4keoLF4mnaxBfaEySbeO79000rNGtur1N9iRrKvXvm9uwgsDbHXfVe872OOLD5ORvp/Rm7J2osrVgbTrcvN4oxfkUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VUsDL3z0; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUsDL3z0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707779546; x=1739315546;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=DHRh8I/ZbrMkFErpr0pUYFbWvhNAz8wSI8I7+oaJWN4=;
  b=VUsDL3z06q4MZi2b+quv3Q18vfsv0ISCXoDs3uxuCQco1KwSzzECOwnX
   ABs8AlnWcNuQgd6CTpjHf+K99LKYnwsz90V99rxxMQnG7dTpOuSJnRH3V
   3/VS2O1G0EYzokRF34kNt1igjsvmTpje1CsqUg6KwSLUQ1VNOvUeYm8aP
   OrCoSfAR3f5rBJJsfxmS8PXTveeohlR5AyZ4XRGz5bkm3bfUi4g7tQpWv
   Peq3RSiPFfAW9I/M+WrYd+qw53OsiH37E5EzzEsKtCJfcCvnOALwN8t1k
   GqpCdiPbxCmuEd5Cy1M/dyW+I+DlQik4+2fKnqLAKImgudbdSoftOmFux
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1901449"
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="1901449"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 15:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,155,1705392000"; 
   d="scan'208";a="7350488"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2024 15:12:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 12 Feb 2024 15:12:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 12 Feb 2024 15:12:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 12 Feb 2024 15:12:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSM68JA0TBW76eSgpqYGr0SeP5WzTN/5lCRZLjhYME4x0aShwJkA1KdHIOWnQJa3KBixCWLJ8bZt1f4U3OVCrIDiUv3cKzKMaxfMsm6pB3NPuFXxZFhes1aB98j71dZbyl/XLHQj0ZdYqv+zvAD+lh2UEzgUZNFb1C7EzebHYxedqjrL4hLBYZg4yMEkL3tC0dXI2e13bJmExRpdxVPipAyvHrJ/Lkw9IflX+z90opHJAgE8Bt7D6XzAxwVaIrQVIF60QbaOTnsfTRhTNMt2m9kkuXEViG7zW03jUXBRTBIfQcWULLmqaeuhWTqP/hDAjmRyn6WZKgZp/Nlfib4v3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FaqGzDKsSfa3EJ/MYOime1zRGP4uIjz06A9Q1H7DZ8Y=;
 b=MejlnNt3pi3TI1vfHlxEwe9bIpUsLwkKOU3n2MZ+hPqCi6mXJke977S7oFQtbEcODod7WTSuasjnskROEWA0/RYaBQMHyZ6j9iJu5K2ELe1LFH74A9wtWJJ2rFqqCkupHLfFLem8rjoD++/NzSpSQ9bPeupzar86Pv9kBn7z6hssUja4HcAonEWOUosv+MuVB3ak6AtOmWJErMcVeRF9H9K2f+xbSDLsk2DovYNYrmJPWHUq2Ym87srR5nxVMVa8h+nuHkGVFsSQhyUR/WM0HlBtjNxComYziHpN6CzYN2CmCGKuiXSgbl9IpeB24O86apowpwFIn909Ph+IvD1Z1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB7446.namprd11.prod.outlook.com (2603:10b6:510:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Mon, 12 Feb
 2024 23:12:12 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7270.036; Mon, 12 Feb 2024
 23:12:12 +0000
Date: Mon, 12 Feb 2024 15:12:09 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Middleton <dan.middleton@linux.intel.com>, Mikko Ylinen
	<mikko.ylinen@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Nikolay Borisov <nik.borisov@suse.com>, <linux-coco@lists.linux.dev>,
	<x86@kernel.org>, <dave.hansen@linux.intel.com>, <dionnaglaze@google.com>
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <65caa5c94f06b_5a7f294ed@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
 <65bab6ef2a198_37ad2948b@dwillia2-xfh.jf.intel.com.notmuch>
 <ZcTaW3gKIWWF1fKS@himmelriiki>
 <bb5543c8-b14e-42cb-a13b-9467fa87622f@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bb5543c8-b14e-42cb-a13b-9467fa87622f@linux.intel.com>
X-ClientProxiedBy: MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::12) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f8a0f8-c82a-49fd-7b44-08dc2c200b33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gKRfKGZzcODC/bAZHzrLTx8lW3JY6l9L+GskdZ+eGoqSYITaLRbFFoLeEwuEtpDdDUXpzW1j3AIEbyfqVFWbqrzHFdOCr8qDhix8FPnCptA/cztBzARn+FRuPHMK377tvUejhsMtVJRL3ukI+Pf2zVszx6G7d97bzFWIsSVqommeZE+aLKKpbDQqxmPPTH4WCpZL3tyvJkzO04jSSroHPyMs6MI0GEWDWWCadlGg89rdPe7HWaJSCcgOl24UN5xm6VL3frYvYHd0KCpyzZj2eyhr2rVCHnqL67VJXENounKZm4SAWz4KS8MM96bsWE5yFUg0GKjLio4YBI40R5BnIzYpRIVXlCLS6mDB00LIXAZlK2gVS7QfsMxohXK1eUWMYiVlEszUg7kwpdghO/CTNnFQ5eDbb5J31S3FFDHkVe9pe8y+ytV46opr9wIYoRo9kZTAWV7gpMxAhtQrQ16vyApQF0K0wuxWtyTV0UHBIR3gB06RVlyaD4Rm/sN9DmyuMR9PxxuctAx6fkwjJQK1VgD6uYPGQJlGSWHawX5c5to=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(41300700001)(4744005)(82960400001)(38100700002)(6506007)(6666004)(66476007)(316002)(110136005)(4326008)(8676002)(2906002)(8936002)(66946007)(54906003)(5660300002)(66556008)(66899024)(86362001)(83380400001)(966005)(26005)(6512007)(9686003)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c+4mxIch9PzqDnvqLc8SCIqxIh9J32DFYL9/lWftpl4qBa1wp8cesK46vw2g?=
 =?us-ascii?Q?OEFHpUz/CSX63nm08xQj6plViNm4HqMRA1rq9z5PWuBE2BPcXHb5keQJfCET?=
 =?us-ascii?Q?fydfkcuX31vHti3ROEoOUwLmbVdsH5Dig+uaNKyYkhIIpsTFFVXx9WTXfJox?=
 =?us-ascii?Q?33uX+0lCmTbda3XUR+mjVABLyeh6q7L0XToSsZhvmXAs3CdLcGIkxS6068dc?=
 =?us-ascii?Q?8wKaMvQYh7Ut3Rjemy92sK8Mwwn+lVHnAZXQXGXujwEsmTCED3y7CCFW3LYg?=
 =?us-ascii?Q?tspnQc5AJFBYSEQrJLdQ0QWEXZZf2gyey1bO2pUqtYXXvwMWNX2GX7zCfkFc?=
 =?us-ascii?Q?cAJ+GyP7nxFOP7Wv4qHhkse0N+CkI2pP4/34qD7V2j5xZcrz0Wa8J/DVOUps?=
 =?us-ascii?Q?t3ON/FXu9LGpIp1xMjVDJKP0sUufEOgnTYjX2IHuzlcNuRz9NpFjFljmQCEp?=
 =?us-ascii?Q?g2VOS7C1cbQn/9DBn8tIzK/ZWlkICH00CbIhpIvGYNSgK2mR3svGT3M41SKz?=
 =?us-ascii?Q?w4nzLE8i2+MmYsDq30zgPae/4S1k7aRmL/rkDQtLDw+8jXcACg267oh6fvxc?=
 =?us-ascii?Q?aJ8mE5zDVPzfCjNAeHCZAE0lALs6zEKy1Mm1jtuHqS9wyODQZdYwXxOLeIzy?=
 =?us-ascii?Q?yHBOPAIQlzExvcXsZK3uSQi5e4W1sjOj5LXmxLa5owKZOkgDt9fTZ76x9u/i?=
 =?us-ascii?Q?bLbsbgTYERCTEwPv83tu7lj+KOoVkoPnmFtowSkwddOOxdKtSUVuXMJv+Sg3?=
 =?us-ascii?Q?v3g8lDfx+lRgZcz79Evim678jIdslT/Qtr1cd0K70Wr3SrZkJbyrrCPAPsra?=
 =?us-ascii?Q?XZGZXRteBtrfhMa9wCX7D4dcy6B20ixfx0tcbcMxegRP78cbN1GXowzY7CPj?=
 =?us-ascii?Q?zEH/eCSRt6qPndaL2bxqr6xgTfT+FfLDfl1eQ7f57IuuEmW4zzoNedkZO5sP?=
 =?us-ascii?Q?w7cwJsQXpsoa4i/tvNKaYtKOUPk10rEHxtlyWv11+obIzuLKwyd20PK9r6q0?=
 =?us-ascii?Q?ujui9bgU+wKhjbgb0YoxgMYx1fkSHNG1q4mVTbLiwKnOzeokHC2k/oguugEr?=
 =?us-ascii?Q?kU9rRTnssN1tZsBP2nXYgPwRi5QkxuG/UE9+RuZULjy4RSCOzh5ysdzDkLA/?=
 =?us-ascii?Q?let3AmQHhBgbuS/BKn5Aj+VSZstKNyyIICHPT91TlkFCTPVqcWSoM+mlVtGY?=
 =?us-ascii?Q?CfH776bXUryNWSleta07IoN/6mY2YnXP3Au9rDN0JX5FAL9/RdYBDg8lds8Y?=
 =?us-ascii?Q?dgyTSVCAEV5cUnd9/u7BrdMMaC3uRLFaOSoarLKQlMlD4kaZNCqHjRDfeiFc?=
 =?us-ascii?Q?lHeCzHO9/GfPYixbEMpJSvlayuNBSRHiEh6kskPMEvPZ8gNYXb10xt01pDCN?=
 =?us-ascii?Q?R4i9qBOV3QbDIZ0ljPmJs1bWqwQlmsPf98tJ8SH246LNIFQFaeC39Q3hbWVM?=
 =?us-ascii?Q?b8ZkKxJaH6URObThVYFZuEUbJfyOLJnaVDQfqPN00iHf7RdWGkC6yQw1XCvM?=
 =?us-ascii?Q?ZJqOQo9UXA7BfXl6gRWa7aFHT4mkt+ChUWMmH4hMRG93wtwdmUa1yP2ggIha?=
 =?us-ascii?Q?dX/nEndkDkvdPBVbJnbjnRFF974OAMFq4nP9hsW2pFtRKLFv0zYcoiMHzGWG?=
 =?us-ascii?Q?6Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f8a0f8-c82a-49fd-7b44-08dc2c200b33
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 23:12:11.9457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DKJz0IESDES92/dQCypBlnaR0VnILg4e2dfIkZETv71hxEL5xWe2kbqJ8zaLkKd2OodsblBmGvE1+7KVOK3a0tV3oE25AXtoSiPyvniNFw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7446
X-OriginatorOrg: intel.com

Dan Middleton wrote:
[..]
> I would suspect that other vendors will offer local attestations based
> on local appearing in SGX and TDX, but that's speculation. If so their
> APIs would better inform a new common configfs-tsm feature.
> Maybe people with knowledge of AMD, Arm, and RISC-V disclosed plans can
> comment.

FWIW, I am looking at resolution of this proposal [1] as providing the
configfs-tsm infrastructure to trigger the deprecation of the tdx-guest
report ioctl().  I.e. once configfs-tsm generically supports local
attestation flows then software has a migration path.

Comments from folks on this thread welcome over there [1].

[1]: http://lore.kernel.org/r/cover.1706307364.git.thomas.lendacky@amd.com
