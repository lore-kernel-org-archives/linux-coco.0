Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473339846
	for <linux-coco@lists.linux.dev>; Wed, 31 Jan 2024 21:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.55.52.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706735351; cv=fail; b=fdPK3r6Dl0O2d67hlxb7tDrSfnkdSOr+zRIfXOOaA+ar7csb5oxPr0mvX0c8LCBt9j8Y6ufgeUTPOMelLEhc9Io8pqMmobDPB2YMP1oYehPqJBGCwZgKHWNwvchY9Y88dV8FFGQaAVJ3Qa4rXZ6XOUGjaYluxwrF5u2PHirtCkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706735351; c=relaxed/simple;
	bh=tD8cKx6d73Ibz+nAVLFVHxzl3v3E8wc2Y6408l/auxU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cqYt5/zepf3Np5C/LNx0pRiymXbwOSufQRwXZAltBZqCGpqnCP2naeLJhl7pKanMpgIYD+Nni4hrIvXIXMc9IkkTnQD1gkIv9jjgrOAx8ZhhJPbbUgtdHIpoHLvKtUzR/kU2MncD8VXBUtBpG2dadGw9AlRj5S8G0DO0CX5+6Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sq4w+oTb; arc=fail smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sq4w+oTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706735349; x=1738271349;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tD8cKx6d73Ibz+nAVLFVHxzl3v3E8wc2Y6408l/auxU=;
  b=Sq4w+oTbM2zivRhaf0zlxj5cFjgLkBq4KEeoaAZzs2zYtFMtVFinVihf
   HXECxSG5z4+FAAJP6yUvnt802e4fZ/0J7rf5vLsZwZEG3guCGlGRTeVxc
   F1mIb+7K9j2eZ6IVH+QHnRvdBX24YLx4Oq/qjpy3SeGKnM7k+QjTwwLCJ
   ADfRG/t1LjkkTAZI8CfjSCRUL5xMQXEUVnRR3wHauOKTfff8LGwWi5Y+g
   3ku1i217hzbBsNoL24ciFKsWnbeNmul3+r/u3+6eb9p/FjrW0L+0xw/Q4
   g/+UCpPJeMAU30lO7qE2B9zv8+gMvfkWdOROk03AN9PB0tsbWU5JXWm1U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402571592"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="402571592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 13:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="4174512"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Jan 2024 13:09:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 13:09:08 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 13:09:08 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 13:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MMBild29OzvNfPqCvHErdlYXMDHUtqaeycOmXJivzj1bmCEI9I1H5aUK2RtblkuhUvTQ3VlUKDaWWEsRN4bF9OL+UyBKgJNcDMtI0teYE/rSEm6RFZE4P0+TAidHjsC4VMVX9h5Jqo4S/jgzj3zVnXLEqPn8gHPe/v0UH4QzU5Zj0GzskXEtzq/Ups5uXSKLvFiongF/C3YoEo4mwS+guhUpGWOEw0VkCroYZ0DIhJEQFlJTxmTilWO3QEe162+WtS5ceRfqhU/rz/bEDyn+42bH1CFIoYmkeSueSa0PSMyf+Nlii3OKukrptzv6pVVud0M50gHTF/chEoigWHvuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQlVhY6zGIUEPja4Vbd9vSBUgKPFrxxoNz1W7OlpCLU=;
 b=hu8TTnA3lltB8vOwFwcEh1sANU9if/MSaSt3j6ZWDfjXOYdDv61JuaO6dtrh71vnLG9czif4bj6zAUGVxILM5Ax7mX/I6MaNLbKTSViGuu3KH7PNMhjqwHae4Bb5BPKqIxsSQeYYaEzl/LFDWxIlQWVWNf4Rmri1yI9O+NETWi+2EG6eHYO86ulKu3Tw9gEsRqK5bQhSYHEwniASpXizE5+tTDi1JGhhKucib42/Pw1h9XtC3ckp3stCxrPwyuNijmEUUgQiM8tG+fqvwXlPPs9SxBHZyBaeQuSFpk2DNpJJhdOIsW2xsmpFT6fpNiifTnAHRwmIDwtpRDIhqDwOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 21:09:05 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 21:09:05 +0000
Date: Wed, 31 Jan 2024 13:09:03 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Dan Williams <dan.j.williams@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>, <linux-coco@lists.linux.dev>
CC: <x86@kernel.org>, <dave.hansen@linux.intel.com>, <dionnaglaze@google.com>,
	<dan.middleton@linux.intel.com>
Subject: Re: [PATCH] virt: tdx-guest: Deprecate legacy IOCTL-based interface
 for quote generation
Message-ID: <65bab6ef2a198_37ad2948b@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240124093858.1818497-1-nik.borisov@suse.com>
 <e8c2043a-a872-43ff-b079-ebbbfa6cb743@linux.intel.com>
 <65baa477b8da8_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
 <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <59f268c4-8491-4256-8766-664a8ee0ffd8@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:303:8e::20) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9042084c-f995-488e-30e6-08dc22a0db7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YwXeEklz7XbkNi9kiCMVNK8/RZJlbFEGHf9G1SEloRQmWRDFNnXL40A/fy6cZHRC7XS6/7PPkL0abfz1IW3SGfgOlKjgGBihNeDSg3QnshXEmJ6QpA9Qkaid/ju1JCdSKwqGccW5tJA7b9IBoTQABMouhkFXGQ51xd3VWUdl2jMHZ4WjsmHjcRZNHkQD+IJsQZAbVOFj8j43V9xcrWurQN7bhyAYBPJIBywdZ2ahvcJIUu9SBLGcnrzBIjFQL7KK+dl/D7VdRCwLD+ONIwzg6z+cjWJzlM4zRBX2rFLJbR5HZlTnKImF3N480PLgwkR5z6E+nYhHa8ebeJmeUl5gN2LKR4M6MEaEK9hHIwcf8eZcnt7+L3Kil84ttxdlFGUtKNxrFaXjFf8Mq4kFYRpbI8NtmOM1/ygreDa9ddxAhZng3fqIgx7DPfWrnxvze4tLhPAyAA1V+6FeQV71IVo2yGWfmXpbEPVPKQSLCFz/8qp2L/EhaBoZQNb+dCn4BgeNvN00SEUtsMdyonxkHWTkwz6APmt6BSGVGRqPXd2WH5oblBuIus68gXVRqMWWUzU2Jh7Grv3/2c16aeHPdvCVYCz5y6y+lIZiAlowxG1zRL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(39860400002)(376002)(136003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(1800799012)(451199024)(186009)(66476007)(966005)(110136005)(66556008)(6486002)(66946007)(6512007)(9686003)(316002)(478600001)(8936002)(8676002)(6506007)(4326008)(53546011)(83380400001)(2906002)(38100700002)(26005)(5660300002)(41300700001)(82960400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M3g5eYreTONpGj7hKTQpWOQ5AoPwU6KF3shLacuRJzaI0h+Rjg0j8TGk/Zva?=
 =?us-ascii?Q?T3VDa0UES2iUnmrgOO08zNEDa35fvW0DBW2sz+ZaLUTKsgG7hujFgkkH9HmZ?=
 =?us-ascii?Q?Z9uRvJaZXL/ef/b1/aFLovEhcXKBcPqrx9s9nmlPSzOxMtmPhBslwYUSwR2i?=
 =?us-ascii?Q?nlU99t1l4TcbJCcn3Ph8ZwzBoihuQ9F9DTT5zTu9/RnE5hTDWIAVIimSGaq8?=
 =?us-ascii?Q?exK6m5X7QIfxJyV2avJy3PGBhz3zAEuwJSiNKajMJl6celvSTAA40pbp69dc?=
 =?us-ascii?Q?+9UzsYtF/n7o4np96A5yad1R7vRVcTfc5j23D5c/GVgpd3qZfs+qnaKwBHp3?=
 =?us-ascii?Q?AGvXoiAZiiR0OXcV0RLjW0DHxywu2TAFcDv0v2Xt9pS+RWlJ2+6rylQYW9Cm?=
 =?us-ascii?Q?W2qPcZf+ImQ0ylYN4A/THgDRLh9qHq2AtpikwjGFIxQvV9tLgSuEfvXbhl1e?=
 =?us-ascii?Q?Y+Dus7x8MprGq31YE/qPV3DO+n30iu3tKI92xBlfY439ygFfnD6uNGB7LmeY?=
 =?us-ascii?Q?e/pNQCWCEODXnxWS2AQ9vzbl/hs5leSEOICahORIqDugESBWZFlEQ2x9kYtH?=
 =?us-ascii?Q?GGNWzosSrKCa+7Fb5SAf8bP6wDkqSwaXkpKg/UYyHi2QkKl7XfVlX+jAbHKR?=
 =?us-ascii?Q?HbICIsrCeL/fbBpLtD2fkB/44RknvuLDAzZcPIG1XhlJsnY5xlFWGOlh4/Ec?=
 =?us-ascii?Q?Y2TrolfqgFIX9VaMze9DGVNQRoXKLWKSArvHiwMdPNs1PZBYJIl9XZXgAUTg?=
 =?us-ascii?Q?alGrKq+YPiHHeHm2mIms67fDfgwY+lFLC7k7KA8hwxr/ytvy722zOMcN5m+r?=
 =?us-ascii?Q?b2+3nxhulPTk0hcIOT4f6jWcEB/yCOiMrJCoutHgUO0eyoIV7q+0GZWTqfvl?=
 =?us-ascii?Q?Z1FLGjgFB6a4TrlQ0BWdZfaefwuTnukqrbirkPz5WjE5XDoR+4uMP3QDSGBJ?=
 =?us-ascii?Q?VjldVVx0yzOERjUCfQZBvM9Z9pFiwNg27y4Wd4WbJsYaNUADGtPT3ZyjVHIJ?=
 =?us-ascii?Q?xX/1prpQzOeJXPqlHHE0WVYd1EIMBJx3bajXsZuF8WKrfk99ZhNg4jWiwptm?=
 =?us-ascii?Q?+KVnAGT4hqxF35pv7LTFgFEqVRGD/sah1Kj6rn/T/xHQn8YnZTNdmKlPFgxS?=
 =?us-ascii?Q?lcDBAj+bTojTjLHnQCSBmS6AwQ4WfxxVwqS9MvpMwaqPQn5pooitKmYMAomh?=
 =?us-ascii?Q?/YI+UjRrbquxqt+TC87FrQN2Vpt62ripFZ9jO2xx3zSzAiUCaRUPtZQd1hoZ?=
 =?us-ascii?Q?lrv7cul6pRyQzZuyNkT1pfL29a6bDx/VJ8rDZ18x2HRKpo5jY1PXHnOgylDO?=
 =?us-ascii?Q?w4sDhEuBuvtEYZjUpq9/Y2PhAxciV4i4bt9pu6XB9RfOaG1MwyRQr/oFAleG?=
 =?us-ascii?Q?+iizUMvhSNZ7N2xGq2hSqF1hE2bW7ZX4IX+91Vn/soLyC9x6dLdBTDyUCF4/?=
 =?us-ascii?Q?DrmonRV7vS+wuoJFATOYJqbyCZj8bbJ8Enn0AB6cR2vm/LCRn8VKMO0AE5wI?=
 =?us-ascii?Q?5ykYhWs53NRkvNnJ6zakKOAEWUE2I2T5bSMM8svlIdDZbnPTDtdcHLbzrfuN?=
 =?us-ascii?Q?yjicUq8w1D3sV0AEAsBCTQQ9AvTFKz6BwAa2s2xVd+0QuGYF2EduExNcjjUj?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9042084c-f995-488e-30e6-08dc22a0db7d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 21:09:05.3493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aerPG66ngdB/mHph2O0ln6dSKexB1+EXHdWc+LZVBmJy16PgaFiB0Lu9zS5iGpxcN3pAKWxGqmrFpL8F2h2OWtImWheWeGoxYDny6FBISN4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-OriginatorOrg: intel.com

Kuppuswamy Sathyanarayanan wrote:
> 
> On 1/31/24 11:50 AM, Dan Williams wrote:
> > Kuppuswamy Sathyanarayanan wrote:
> >> + Dan Middleton
> >>
> >> Hi Boris,
> >>
> >> On 1/24/24 1:38 AM, Nikolay Borisov wrote:
> >>> IOCTL based interface was the natural choice for interacting with the
> >>> quote generation machine at a time when there wasn't anything better.
> >>> Fortunately, now we have a vendor-agnostic, configfs-based one which
> >>> obviates the need to have the IOCTL-based interface.
> >>>
> >>> Gate the relevant code behind a Kconfig option, clearly marking it as
> >>> deprecated as well as introduce a runtime warning.
> >>>
> >>> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> >>> ---
> >> In the following thread, Dan Middleton raised a point about this interface
> >> being used for local attestation use cases.
> >>
> >> https://lore.kernel.org/all/ZbAaKAh-230Hj4BF@redhat.com/T/#m691dae9a7833a35552cafb597c838df9c2ed5f3a
> >>
> >> Currently, the configfs-based ABI does not support the local attestation use cases.
> > What are local attestation use cases, and what happens if Linux does not
> > provide a local attestation interface and standardizes on remotely
> > attestable as the standard?
> 
> 
> Local attestation is used by one TD on the same platform to prove to another TD
> in the same platform about its identity. It is mainly used in cases where a TD provides
> some special services required by other TDs. Since they are all in the same platform,
> there is no need for a 3rd party verifier or Quoting service. It can use the verifiable MAC
> to check the correctness of the TD.
> 
> I am not sure about actual local attestation users. May be Dan can share that info.
> 
> Regarding your question about using "remotely attestable as the standard", I think
> remote attestation can handle all local attestation use cases. But, does it make sense to
> force users to run a Quoting service if they don't need to communicate with 3rd party
> servers?

SEV-SNP seems to get by without a local attestation flow, if I am not
mistaken, so the question is why should the kernel support cross-vendor
divergence here? Remember, the kernel ends up being the "standardization
body of last resort", it does not need to onboard all the complexity it
can find.

> SGX also seems to have local attestation concept
> 
> https://sgx101.gitbook.io/sgx101/sgx-bootstrap/attestation/inter-process-local-attestation

I am less concerned with concepts, and more concerned with use cases.
For example it could be the case that configfs-tsm needs to grow to
support local attestation for multiple vendors, but that should be due
to concrete use cases to be deployed, not theoretical observations.
