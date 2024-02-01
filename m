Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C033BB3C
	for <linux-coco@lists.linux.dev>; Thu,  1 Feb 2024 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706763360; cv=fail; b=ivSzmOjcNeI/7AXi2Xld9GdU/StCoa3yJ7MXhbrfOEKXZoF4fBa2R7LzKnykbYsw+lrpG8uZBiHhgtcR9xYB2cxM9vAEVnrmSQry7AOsj+1oaM6oaUhH57brsCrt5eIjtMtLcTUQJ9PS5ylqMCmN8E6TW6hwwfahnihgb2i+6bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706763360; c=relaxed/simple;
	bh=4Gp5AHVx56lqosLgwkD23KQlOr6FwOKYAy+GYvCCEcw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=acXRv5iSqD7ZH6LgnOTNjDOPvcpIp2fA+mr2YR4U8uRfiGCXCd+dYk+B9t1PuFezeTVmY7B5JdLOxbYtouIeENBq6C5nTRURiDc4Uy0zuoKKmBDRX4VYu+DkeWW+Ic3CaKeHNaywd/oayqDWywfkwtIlkgw/YIkAFrE7mPLogkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8gasZM5; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8gasZM5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706763358; x=1738299358;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4Gp5AHVx56lqosLgwkD23KQlOr6FwOKYAy+GYvCCEcw=;
  b=U8gasZM5ao0jGfZMST+Pdl0jzmxZR85SAD346HbsinbooMX+NhxVdS3F
   E/6aBvymPRN2kANgoKMNJ8xufE5RXyII43jA1GPyTBC5cxuD9ltEV+Qk/
   aZWjT3qJj1Hd2sdyJebZSWzLygArZO/aYa5jBkjQBjsZScoDAfqtBI5Ma
   dmTacrae3FJaiPfCCww2mPE49yX9K0JzCYhIC58dIvyfiYDztOw24CuPt
   M2DX4cqeZAOUb9xvwWKeS/WPSbqn67uW49hsTidyB+CPPLTyiwLSgaJFS
   KKLAa09KuCFyPolDUSOcea+csqbgpslhQW29x2BH1gqgIxZFIIdrAmlvU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3644720"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="3644720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 20:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="30476519"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2024 20:55:57 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 20:55:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 20:55:56 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 20:55:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k/y3PWHdCYAJzAlhk+ZWx4myDs7jIyI8IjGkStofH9cwBq7kYZGcDwrBUKpCtoeL+JrIycDe7Knmroki5tcjhELQ0txpz80kjeuWRSF92Hj4POSmYT/YUYVVZZEt/4MIzrB90LoeP6NjqXZuwXs1QV4hJrbrtpYDV7NhbmMrUE9WCdtFsXuwsCsX5/L5ilRSpEw6P3SWsDjHNO1Phn0q9KbUavLJ1x8UgGWz7mnlN+0SAcLcMVdZpGFAdHdreS55RMpapPjvJNKje3CMAfFOkMsbB2reDz19JKgXZyjs5C+pwEu/fOFPn1pg2vJ1x/nytDWPxIr2WTERsH7OP73l0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op4P/pa6hvVNYfCa0xmShOKMwp8IpCb5bFQB55mD5oo=;
 b=SSI6PiQuqjievx3oO56+RlxIci+nI687TDkfLFdeuqdys9PdGKwRpcu9ubUO9UhewF9hzEDXIBOxe9ctz/hUzBkHaeNXGCxPRZBWPYUCsib5q2M/4j9X8HZzRY7uMwJvAq6hNeQqlZFJ5fwVSMpVcEqKrab6IgDB2aY/jGICWdyIP8pLEWHZ+Cu4AHQtElrRbtWGt+qZrK6wFpxOY1zmPKubMLocfvWw37et4K9dBvy2OHim889sBKPZc4VXR+gkq35eslc5zIe9Mg3qioT7y3YJPwmQmu1w3s/9f5sXUh0nNswElQWPim9npyH1p1MkWpx8NkmlE0wlOZSoxZOYTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Thu, 1 Feb
 2024 04:55:54 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 04:55:53 +0000
Date: Wed, 31 Jan 2024 20:55:51 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Haitao Huang <haitao.huang@linux.intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, <linux-coco@lists.linux.dev>, Dave Hansen
	<dave.hansen@intel.com>
CC: <x86@kernel.org>, <dave.hansen@linux.intel.com>,
	<dan.j.williams@intel.com>, <dionnaglaze@google.com>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <65bb2457681ce_65b26294db@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e3078be1-397a-4927-966a-acea5561eec8@suse.com>
 <464ff551-5909-42e4-b544-5c68ff86c76c@intel.com>
 <8655c3b5-84a7-42c7-8f2d-8ea32308fe5d@suse.com>
 <43ba2334-12ae-4311-8be9-e8eac631e0b9@intel.com>
 <op.2if3efmtwjvjmi@hhuan26-mobl.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <op.2if3efmtwjvjmi@hhuan26-mobl.amr.corp.intel.com>
X-ClientProxiedBy: MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::35) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: afcffcf3-49e4-4eaa-fbfd-08dc22e211d9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXtgVNbyCcr/62NwivUJqmZmS2SJRz2qJ3cwkiylNOCN7ZZ+rus7RsRi5A/eaQdQj0+9YP1bEUO+1Xtl1Vj3QxrfGUeEyb5gcy0XgOSc6cu3Ltq54H9tLZLQ0JThuw1Y/2NDehCqicYD63rX3s6FQ6vmp/6bQzGkQLhlGgvlRUCnFhND9GBePgNdBEWC4tNSt0M9ggYTymO0e6mon+6k+ciYZZg4WIk/Ys3UeQiDPHs1oBuUzkNnBKKNx/ezd9FDQrYh90q/8KlMxpPlBQ3ljOtjdozw10W+NJ6cDFC9S6Z0e2S4qeLq4VhNLI6MqXzlmXJBlUH5yEq6ewuydPbi2FO+JoFaxjdH3mVqgkQfdVOUTq+80YHj348EQ598ll/kJdtIx+Vsf0jt2gflALe1K/Fp8Maz7W0W8JjStveqP92m8Mdf9pAN88jCMggEIqSPX7sWqsXxu7m4+yujIKakdih5lyoSCJSMALedYPOFVbb3ZG43wKDmyBgY34uWss1C3kkIlnUH5NX+KMeze7kDOGpWqDw8gr2O0RFeP1+1D7bqG4fzeLNdzTGwUK76Sam2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(66556008)(110136005)(66946007)(6486002)(66476007)(83380400001)(2906002)(38100700002)(6506007)(53546011)(478600001)(9686003)(6512007)(4326008)(8936002)(8676002)(316002)(26005)(5660300002)(6636002)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BcksFNJTUjWGEm2PUQq1DqieIbl0Ve8cq2VCKkz686ngMS/xbYGwksNleqB2?=
 =?us-ascii?Q?sBX2DOPx4c26CIOhwAkP3AddBE/aaKTCujO36KQNzxrt2Y8Bnxjrjf2ypTEw?=
 =?us-ascii?Q?4aeJcef0gAubI6fA3nbyHE/lrzHRhhaNVNhDsEapuFz6LZZ99R7hcb/mjhhx?=
 =?us-ascii?Q?+Z7fRG/+N04qGuCpzszjlcjwpk4pq/ZXD8rXoORn+P8IVldvl003gIbUF/2G?=
 =?us-ascii?Q?Ga7Yjb7oy5O0NYcgOWiKIGClEkXGuwoy7HQ6ZGf9Q8v5bEweadswsDwszm/M?=
 =?us-ascii?Q?Q6E75XYW0lusMULxAPOlYlmV+ooaPjfAMtsX9Ewmn97vdhG9iwbt5d5haQfS?=
 =?us-ascii?Q?U+ojj8/xYAA5KTByYNDt6UWl4NeltE4yXvZhTB+S/NCw8/LG3JZlGqFRSOrz?=
 =?us-ascii?Q?4990eATE64oZ7icDwuunJizRU1pyeTO3qG0yOs/Dydo1HNY7ubVKyStghWfs?=
 =?us-ascii?Q?kJksCTkb1wbEsjiQxpIeekbN2VXJUbZ7hGhQcCjagQ9oL9nZlAHdVVI5+h0z?=
 =?us-ascii?Q?IxiSS7KQT36Sp3zvQrCYX1xioj1Fj9Tr5dDMqsUnP1qmQRlI3NRLDtow64IV?=
 =?us-ascii?Q?R8bsQdeQl5bKhPSk9sXrmTfrTwMWq9trxIOWOd0bIIsdUzx01JdoHTIZ6kiS?=
 =?us-ascii?Q?2zDnnbh3cDSpo8V9noI6HP9Ylx2aoPNOaAmwhSHj3um0Hb2dRUHxBA2WozrG?=
 =?us-ascii?Q?1HVyEcYiqZKDMY+bHyD9y6HqAPSRz/l/jq3egfZuQt9WZCHPLqpj3XP8vNRV?=
 =?us-ascii?Q?AInq4vG7yIKcRrvEBtWkbz3h8Fn4tz35ltp/fVXvZT42mqZiQglk8IJI8Hi3?=
 =?us-ascii?Q?Jf4aFAchGEtZgWaUr7EF/sGWiSS+DUPjA5sySuEG2lCroW/iuVBJTjtNiS+g?=
 =?us-ascii?Q?cibBNm2EwRIQOoCnTg5+lzZsd7FAaKqyfinn78o5kGjNsJHsOuCRUSa0uFYL?=
 =?us-ascii?Q?KInTbneE7zxHdPBoXNbVliHqktqjZz8yu63iy8YKUFtFlx7ixOJpDdc1hi+P?=
 =?us-ascii?Q?XiwUqJ7r5IK7Ztm8g0ediR+k3C5H1KxwD4nKWPGooB0OFoWBezl2DjDF82jU?=
 =?us-ascii?Q?3Jsl50Uy2JiJSCoVirXe2aQg1wdsCDoJQYd0C5EVS5qZxNDgL7EKRqjMrc1g?=
 =?us-ascii?Q?ZebA87s4OhQ8v1y4ijAcr0n8d1TA+iHazXv1XYEYzggGPgdu7TUhml+GUXv8?=
 =?us-ascii?Q?zhITsRVHyGv+in1yo4+dsrWVb0tcOjdGqYxyfCfvrnUnBI/l/MNqMkkQ4jXL?=
 =?us-ascii?Q?js5ce2gQgs/b4oQ7cTImqImBNqctvHER8lJAsbM9b0Ut9E8XCovyo8CfKaV0?=
 =?us-ascii?Q?DugBXZH9k5cWhvCXllVYqYFCOrqQc0k6Xn6mwa5mbOk1TBEYtzfUtsrZi65h?=
 =?us-ascii?Q?/QIpNgh2VK0U+yrb8j6EQ4eKzSqWLvjE3+XxUYS+uqAbwxYEoxjESUtS3639?=
 =?us-ascii?Q?mAQorFsAoT6DgIKIz1c3FAeGOr1G5aAqY8oeOMkfIGIoEqfVe8MIXw22x+Uq?=
 =?us-ascii?Q?TldVXS3CzUQw/FgC4pz/Uo2aWQXdxPCMBwGDonVRQXUPz1SZ8s7Ov89WNscT?=
 =?us-ascii?Q?Tr44+EaTKwsuzCZ/QqSEXvoLoO3O126t8hYn0Aqxq+dY06gbc8sp+kvrwWFH?=
 =?us-ascii?Q?tA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afcffcf3-49e4-4eaa-fbfd-08dc22e211d9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 04:55:53.8495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PJkWmMUtK6HIwNoouSzMoVQtZ+PIKwOcQsbdWRuOZEfsZ9t+ONkbZfj6rrButBKODLTSES/VK3heeyUQvZWFuxiD+Z1FIWItzNnCgivXmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
X-OriginatorOrg: intel.com

Haitao Huang wrote:
> On Wed, 31 Jan 2024 13:05:16 -0600, Dave Hansen <dave.hansen@intel.com>  
> wrote:
> 
> > On 1/31/24 10:18, Nikolay Borisov wrote:
> >>> There is no clear consensus from this changelog, nor the tags about  
> >>> this
> >>> approach.  It would be much appreciated if you could make this  
> >>> changelog
> >>> more freestanding and  make it clear that this approach is acceptable  
> >>> to
> >>> both the authors and users of the code you are modifying.
> >>
> >> So how about something along the lines of:
> >>
> >> IOCTL based interface was the natural choice for interacting with the
> >> quote generation machine at a time when there wasn't anything better. In
> >> its current form it's only usable for local attestation but that use
> >> case is also going to be switched to the config-tsm interface. In
> >> preparation for this introduce a Kconfig option which allows the user to
> >> choose to disable the legacy code.
> >
> > That's an interesting theory.  Do the users and authors of the TDX code
> > you're Kconfig'ing away agree with you?
> >
> 
> As DanM pointed out [1], this ioctl() is not a duplicate of the current  
> configfs-tsm ABI. And Local Attestation is a use case mentioned. Can we  
> wait until there are two platforms requiring this interface and we have a  
> clear idea what the configfs-tsm interface replacement of it is before  
> deprecating? A Kconfig to deprecate without alternative implemented also  
> does not make sense to me.

Exactly, that's why I asked for the migration path to be made clear in
the changelog for the deprecation patch.

As far as configfs-tsm is concerned it is just a blob transport, whether
the blob is a "quote" or a "report" does not rely matter, but what
matters is users, clearly identifying the blob formats that might be
returned, and limiting backwards incompatible blob format changes.
