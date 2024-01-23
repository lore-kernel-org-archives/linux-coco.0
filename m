Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1726A005
	for <linux-coco@lists.linux.dev>; Tue, 23 Jan 2024 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706036771; cv=fail; b=TWbeQJZnF38j27Fy064Z/EVq1iwLvfWWZVC8u7HBDmK4Hl+3p79TcBJ4JGhkZW1Go+McOUOvVmHMQAVrtg98pkmfzgVq+tWsrDagdzjrYJpF+RRJFhG/tjpT0TNKgQfaBD5rCrkjC/YzLeAyNiJ6WFbD0494KAfdJoZRrUA0FoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706036771; c=relaxed/simple;
	bh=4k7d/HGvd+SxtT/ZWepc23jZAKN9p74fJcn48SXVQv4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bOm/6EFAEwvk41BIuYmrC2sbQLpGg1OSqYhW4Or3ZNriuJYyHrrBm4WHSJm1n7yqaa04lP41jbgk9MDY0nbVAuC7w1c+Oc+sUEGn616ryT7qCLaHh3Bu5dkXJSG6uikjDJrHz/GWofwbFLBW4T6XaeKx/t+sfH2YNKAxU0s57Es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyCUJWtJ; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyCUJWtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706036770; x=1737572770;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4k7d/HGvd+SxtT/ZWepc23jZAKN9p74fJcn48SXVQv4=;
  b=CyCUJWtJT07uAD53e4w1du50PvpWGc73FwnF9P+GfyAtgWmSz+3Jy1OT
   zcN0Hijd7ojuqeDooENdc0fl82cqZxVH4wn+xhVRj3kuf6KzcP5P16Rzu
   cgcMaeJDxFXMiAyCuG/1zxp3HFZMpVNyi8JSKIaGtixaZIFcmLpVzgsGZ
   MUP4nUNhP4A/000goUp5bCCG3CVussyXDHUo8c/Hwh2+XIMXIKtTWvWcc
   DH6hUnhDaRnBh7glRoooX91HN6exEVweoO/lmBl0GH99+bbWv/73NEn8B
   k/vLKcSp76YrD12NrAS3DXe+ZBze4F9lvUgMxo3c3NEYwDGwkrv2ikWQG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9013607"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="9013607"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 11:06:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="20457777"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 11:06:09 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 11:06:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 11:06:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 11:06:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaOc9KGPJBcDb1dZYeDXqgUoY8eNn44l5gqIDBEYA30HAZ3Ok8BTuf0tBdDqxI7IKANeqCf71hli1KlocIloBqWyChbaHIS1YP1akOhy19TdD4PNPl1DTfLhoVdw5MrPpASmWs4xs/+simkl7YTEhZ8l663QnQZ48T7nfUrSCJgBJ9xKbUoZdExPLTM1/K7FlYScfU7LKN6JlmII0Fm8M110uJsoFBzmsNIRn6gEXLoiSloPbDSqAExpZY5aNtsy+7yInrL/HesvlqzM5BhwjwQ0/Sbxtlt6OieNB5yTEgh4+0pdavxrsPcIixsWBErL+nNqaOPFmU1VWjNaPNJeCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QG4Nwn12Tig7v80wQVBPbAaEeEf/gmPt7/KkRVMPGGU=;
 b=GPTRkZAHeNyVOR3ckwwmOs++xNAhOc32MmmP+I9GToZirX+b16n2q4LzntyolrzPwDOIKA6AiQRIQxwgOG9+vffkwujpQFwgtrpb1lLL1AZ/yJiFdAXVKt1mNs2PWph8HDD0d2o5fAFFB6fSt7bIKwwRUbFzcWjwdTkNGOkwfKdObJFjEc0NFu3z/JhbQ07U20JgoiQYUutMCaYMh881hIsLHqHohM2Bc2LYqM0dkhhhFgZyJi7ShAehlb3jNBcvLUNVmKBPI4t/reM3k14XOtVo/QLWRSQiPYvZWPT8WM/ovAIiWWoLyjbcm/sdcHgCCiinG/e9r1gD0YMns5eBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA2PR11MB5147.namprd11.prod.outlook.com (2603:10b6:806:118::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 19:06:03 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 19:06:03 +0000
Date: Tue, 23 Jan 2024 11:06:01 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <linux-coco@lists.linux.dev>
CC: <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH] virt: tdx-guest: Remove quote generation via ioctl
Message-ID: <65b00e191087c_37ad29436@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240123160704.1270147-1-nik.borisov@suse.com>
 <d3230869-e07f-41c8-b613-ccfc2eaa83a2@linux.intel.com>
 <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea5dc4b4-6aed-4672-bbe6-e2f477528f36@suse.com>
X-ClientProxiedBy: MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36)
 To PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA2PR11MB5147:EE_
X-MS-Office365-Filtering-Correlation-Id: be45fc11-8a43-4d41-9790-08dc1c46582d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tDKisiX/XU/h5su4EONtpBX7DEh9LGgTECudX+c8a5hLhUE0tBcGok9yBCZQYo3cnqGWRmgL2q0YBs9mGPbupa3XEUz3J17gs7FVMouUhZ5JghfyWSpg+1Kp6jt2Y5U/Xd7+0vjefjl31zGfpuFM7GgzZcA/3tlUPHyBcStyMNE/BnzyjbXVcO2PPLBPINlj1MGxAU4c9y+FK955267OWA0YkQAl1wtZEZjW3JOZgU0e8E10HtTglW1eiK3cWIxrdm6HIgRH8jroQpT2tDBh+ts/1o2JDqEVPeDlt52eDsu1+lSmRM1ED/tss+QNILddQqMmimKSVQdIkLWM5a4/Vu8WyT8ncn8ZQJGxpXykQ0LroNyBA3TDdrZ0WG3yEdI2wJyMQe5Uhltd97bXNjIxgECreWULGy+ipJCIri/e4dcl75RIcRnKmwjs6YDs+3TH+o/BM1PZVhoPvF7rZmgVFJ/sAOs81hZMzxqO6QUwtq9rXvkHhZc6bchBMsQZcHXbgzOfgwRXe0bNCTcWnQl/nJQTgHu4DMlxoKNmW5QxXYsI08xNTvgxtLqvJ+X5GjKwLYjzfUu26MKpTz53e+oHsP+J1H86H5ZNKOpEgY4/aiPH0moz8rUvi+hY5ElivC7y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(39860400002)(346002)(396003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(9686003)(6512007)(41300700001)(26005)(38100700002)(2906002)(4326008)(8676002)(8936002)(5660300002)(478600001)(6486002)(6506007)(66946007)(53546011)(66476007)(66556008)(316002)(110136005)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkRjdHM2K2taZm1JMlZPNVBEMUR2UCtjdUtFcldjdGhPRWdpU1pvaGVycWJt?=
 =?utf-8?B?M1o5RVhmN0x5YU1lblNwV09idGJIbW9WV21KdTE1TWJPVURNU3FoRFlGS0Vv?=
 =?utf-8?B?U1Y3UlhKdjZiN0crUW5pUmNmdG1lYkd2TXpTK0RuMVZZVktpbW95cHdCZWt0?=
 =?utf-8?B?Ym1ocDZkRHJZWWxTT0UzT1kxNCs4Q0V2MmZBUktNM2RFKzJsQ0hCcGRhRU85?=
 =?utf-8?B?blBnNCtmRlc4ZStUUWVwdnFxbW44WnlkYWRQaHc2RkoyUklLTXYyTGVuKzZ6?=
 =?utf-8?B?bWZFd3pSUEV1cWRNVUtCVHZQZCtwWlZQVDFVZiszbS82Nlh5TVlHd1B6OUFu?=
 =?utf-8?B?c2lXY1pqakpUY1lFMXRFZlBGcUJkaE5LUjdFSnNUR2RmRG1aMnlSZTRIUlp2?=
 =?utf-8?B?ZGp6WjZaMzdjcmVxTHU2ZDVVL1EvZDJMREYzYjF3UHNlV3dJK1FoekZNclpY?=
 =?utf-8?B?THU0cERKNTAxdTFGVU53V0xzTzBoNElYNFFSTE9BWXFXQlJNa00rVkZLTkZF?=
 =?utf-8?B?OXZ2TVhnY05Fb2x3OC9jaVNBUHo3TlBwRlBKeDFTa1FOcTZqc1d1c21Qbk5o?=
 =?utf-8?B?eklMY0hGaWZmWXJ3eG5IOERkTHUyb1ZXU1BtU2dFOHdydEZtQU1pRG43TC80?=
 =?utf-8?B?N1l3TUpKdnpxTHA5RHcrMk9Oa3htTzBlZzhIR2drM0FYeHRGMEV2SEMzRTlV?=
 =?utf-8?B?Q1ZSQ1RvRVZVQWZOckk5WkRRT25zMVowR2ErZFovSmlRcmlDUzFBVVYwakFx?=
 =?utf-8?B?cVMwYmtMRXFSTElTNWl5cklDQjAzVW5NYS9HbGZYTGxPckk3NGtWOEpRdlZp?=
 =?utf-8?B?STR1a3ZCVHRaWlpseUxPKzVvdVRPemUzN1lHR1VweTlVejZOWVkxK3lTTVhU?=
 =?utf-8?B?UWJwbkY3b1lQVkJTdWRKNWNvVzg1WVB5UkZGZm9wd2xkdTR6VXoyaTRzdzJp?=
 =?utf-8?B?cTdUTnpWM2xoYzhHdDRnYys5bVJGUHIxYjFYeFBsaG0zbkplRWp3eXVkeXhu?=
 =?utf-8?B?SENvMjdGMGdTNHAycmxPUVI3OFl2dE0rNXlMNlB2L0R6TmRJVFZtVnJiN3Bt?=
 =?utf-8?B?OC9aUjUzVCtoaGlrdk9oV3ovTmR3bHRZbU02QjF4ZHlITmowd3dsSkVoMkpj?=
 =?utf-8?B?dUYyQW9ENTJYOE9BY3RYc2VLcitoVWlOSzhLSlhDdmJuSitIVVRoT0pmWHFF?=
 =?utf-8?B?ajBLVDNCWkE1U1BWWVJpejhMUWVlZVI0UWFJRXl0S21oeW55amRKUEZwZ0o0?=
 =?utf-8?B?OHowTTVkSlVyVm9MKzhJZnNkbk9uYXRpSm5PQmhIeE1Vc201dW12V1NnejJP?=
 =?utf-8?B?TlVGSFVnUXdRZTlzZ052RSsxeXFMQ1FrZS92Nkc2dURjN0NYRHpDNFFpVzRq?=
 =?utf-8?B?L2hJb01ycmNYTkVCTE05RkN3VmpkVTlzN0c0T0p3ZkZSdDM3OUc0K2xlMEtE?=
 =?utf-8?B?SVFqNFdnekRGNmNDRWNSRVdVbGNUZ1REdWFUOFRzU0pIYjFYWnduSUQ1Z2V6?=
 =?utf-8?B?UXREbVl2aWcxYzBiS004TFhmWDhpODZkdXhqSGJEV1FrYTdKd1phS29LZU9K?=
 =?utf-8?B?UFNyQjNDVE1zVDNnRmtMa0huZjZURjV5ZEdMTHU1SmZFRzdlMmw0bEVIc1Zl?=
 =?utf-8?B?MEhVQWk5dlNuVTVnM1h5UjRBQUhBZEI0UU14dEkxR011aWhvaTdXcU9BRFY5?=
 =?utf-8?B?aDZNWXZEME9pTFJwL09CelRNMzVBMHhyS3h6cGVnb3I3SjAxOW1DVm1uMjVH?=
 =?utf-8?B?MWpKK1ZZT1MzSGszVU1vSm5UckljVWFZYUVIY1ZlK1Z5MVZhbEJCMXBVS1dN?=
 =?utf-8?B?Rm1hMmJ0bSs1QlY2c0ZudStUeVRnMkN3NjF1TkFrMDV6dUNsOThQTjRyZUJ1?=
 =?utf-8?B?YWk2T3ZLaytOanh1NmpsVGZBQ20ySGlLVnNHK1dxNDhBWkhjRTh5cTBpTjhn?=
 =?utf-8?B?SnVKenVEUE1YQ21KQitFNTNybnhRdGxpMEJvVk0wbTEzUDFPeVZ2SUxxYWxG?=
 =?utf-8?B?c2JsRllKUkVKNFNJL25OTEZxa1FJN1hHbkxLRm9nb2xhUUVuRDF6UXVpbDM2?=
 =?utf-8?B?STZPTDcrZkdUM3ZVeEJrZFdBS0lQMVBZenQ3cXFiZkowcjJmNWdPcVJ4Zmkv?=
 =?utf-8?B?Mmphbmw4NVVjbmZhbTg2eEtSQ2dOMkwya3hHS1JuOU5jUkh2WWxBU1I1VVF3?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be45fc11-8a43-4d41-9790-08dc1c46582d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 19:06:03.3709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZnmKpPpQXNrwz5nwKA3SQN3b7HO4/S4ky//DUfzS2BLR/oNeA5LW7pLiDA9fM/wFD9JMy78BbB9v9FBhmXO64YvP9LCNb2jQh5BU2wP06U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5147
X-OriginatorOrg: intel.com

Nikolay Borisov wrote:
> 
> 
> On 23.01.24 г. 19:51 ч., Kuppuswamy Sathyanarayanan wrote:
> > 
> > On 1/23/24 8:07 AM, Nikolay Borisov wrote:
> >> When this driver got merged initially there was no widely agreed upon
> >> interface how the quote generation interface will work so having an
> >> ioctl made sense. However, there's now a vendor-neutral interface via
> >> configfs. Just remove the old ioctl interface and leave only the the
> >> configfs one.
> >>
> >> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> >> ---
> > 
> > This ABI allows the user to get the raw report which is further used
> > for Quote generation via vsock. AFAIK, some vendors (TDX users) and
> > DCAP user libraries are still using this ABI to support attestation over
> > vsock model.
> > 
> > Don't you think we should wait till there are no users before considering
> > removing it?
> 
> Given that hw with TDX was just released I'd be surprised if there are 
> any users? But then again, this is an RFC so let's get opinions :)
> 

The assumption is that this tdx_guest_ioctl() ABI has never appeared in
an enterprise distro kernel. If that assumption is valid, it
significantly reduces the long term support exposure.

At a minimum, a build time option to disable the ioctl() path and a
runtime deprecation warning would be suitable. Certainly just removing a
never-been-enterprise-shipped ABI and see who screams is one way to
start the negotiation of the deprecation period. The current status of
no deprecation notification is difficult to justify.
