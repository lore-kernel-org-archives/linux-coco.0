Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D816346AC6
	for <linux-coco@lists.linux.dev>; Mon, 19 Jan 2026 09:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768814710; cv=fail; b=K11FZCR6DyM270F7iuidCUd9tAUuQABAR18N6+ReNPLoI3ecRWNdsK9s/Vd8ycVqxagggRMpwd7uEvu6kECLqUmPidsK2gbHve0o9w05lzAMXsG9bPcULf0ExzuHY3qNsjyIloHWUNgauG1KZHB3A8S1lNK/MHChDVI1ckFH6IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768814710; c=relaxed/simple;
	bh=N0SbG67ntAdNNLWv390kYG1tvN+eENKKhQaxeDIygrU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OA1ZfFwtrSaRfJKodPI2w0kOV7UrCCZAImS8bGYgCz7gc0BNR2WYNWBxiwPuMFox6aYq1kce+egF6ekNcvAZ3rC2Vvr9h0sUgXCqHhZzns25D/QFyuuZLMt0jjSoBGbl1RwIGhuU9ZlJpQvf/go/165fEcsCWi2mceVFje6wMpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ze23ps+v; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ze23ps+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768814709; x=1800350709;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=N0SbG67ntAdNNLWv390kYG1tvN+eENKKhQaxeDIygrU=;
  b=Ze23ps+vnTZAQBvEDTPwTR2bM28IGhC2DHQWKhUFk7xu2OyrupG52iWe
   pXu8IrJa9Igz4BXiLj4s/qU+hl0cHX0ipb22lCjNeaBwh7n/fPvkjx6+B
   d856O9hW6KXWohS/kvRNxBcHKmbZZbSZ0ipGKxzdsIb8Iito5TYwIGAGs
   v7SN26gsU3gkkawM+iaVr+1aqnNC2BJkbzKA0GAs/7hKLrmjTT7ZNJGId
   LdgHEmVK5m4Mr3KQKVCiZXvIpcp30kLpePEvG2rpQap+W3iTb60LmIL51
   kit3fiUXysUhu99FZDLVrQVXr8qkn8Dw/RcLe0Jpkt8eRwgXHbOQbOlyt
   Q==;
X-CSE-ConnectionGUID: n+UDzPMhS8+mwOdwPUFr/Q==
X-CSE-MsgGUID: zrmPJUBpRkmGYNFifW0eBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69926572"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="69926572"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:25:08 -0800
X-CSE-ConnectionGUID: A/2iNMFjS5GGmVEc2vnc5A==
X-CSE-MsgGUID: DcDRiinORxG45/ed8uzGpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="205850323"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 01:25:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 01:25:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 01:25:07 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 01:25:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xi2RPTWzkuY0AHo2QilLDXPiLnL9h3pGu8coBSSNQDFYUm9vBqFZecNb0JfbjnMjTBEpUKhlE6F9vlunMyt+ovfP3hVZueNr7wOeponT1TLuaC3MxkmcDNbuKiIAQSolOJRb5HlwGLTiFLqs8gImU0VA8/NILAGLDm5cqwPQRGElrrkM+li/7iNW6ysmZZJZXW7fAJcTLQMqkYdHzyvFwtx87UPZVzegBR679//jCTx0/1EIGh/pPbRz2ee1HAWJKtrhQMLnAf/8ln09DHk6tH1ib1aYsUIrEeYfsohSfNMi0ZLN6GlN6fwSKRUceCWJ8ytijl8N8NVNsqsHweQzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvBEU5RjW2gMpqoSQHrGGQaKKv6R1jf9h0aPwdyCs9E=;
 b=r88dnpg+jC22MaYxAApkBij1uT+RsHb7fj83hf4s8Q7VkueEvfNhooP2TMFQTOd0bFFB+RNIqZbpaXijN4Ev1ZKQ53K5DGzsrfTdlU1rlwG55+fR9qp0lBkZJvwxE50qsY6ivr8FxK5EC9KTPwcN/nd4UuNQMxvi4mOMMcf00l7fB26UrL+FCDGP8MG/4wle0sAyhx8kP+8NhB8ImsusGpWEta28hhQsK9vyPojVA1dLNsVSRW4kG06uoxxya1sQ5q9ciZ0FgEosdw6VTZGPY7THK7TD0LwwWcWAHAUiZ1/8/H4zBhldkIuyIDYVl52A1TzBKE9NNN53CWJL82ziSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) by
 SA0PR11MB4672.namprd11.prod.outlook.com (2603:10b6:806:96::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Mon, 19 Jan 2026 09:25:05 +0000
Received: from DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::fde4:21d1:4d61:92eb]) by DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::fde4:21d1:4d61:92eb%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:25:05 +0000
Date: Mon, 19 Jan 2026 17:24:55 +0800
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
Subject: Re: [PATCH v2 20/21] x86/virt/tdx: Update tdx_sysinfo and check
 features post-update
Message-ID: <aW34Z7CfQORSFZLh@intel.com>
References: <20251001025442.427697-1-chao.gao@intel.com>
 <20251001025442.427697-21-chao.gao@intel.com>
 <a648b7bc-11aa-41f0-bf42-ca9b66afe6dc@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a648b7bc-11aa-41f0-bf42-ca9b66afe6dc@linux.intel.com>
X-ClientProxiedBy: TP0P295CA0042.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::10) To DS0PR11MB8665.namprd11.prod.outlook.com
 (2603:10b6:8:1b8::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8665:EE_|SA0PR11MB4672:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a4a2782-28e4-4a84-c7a7-08de573ca146
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dQ6JpIZ/KAnILDFdGMbeRWnUeoX5X2eXVkI7hrMYo0TjETEAeqTE0McL3bk4?=
 =?us-ascii?Q?4IinFf1tGs6BrxL6eXJKfskg2pMWhzvSEIsV+QttJUV+a5bk37JAo00UnQcf?=
 =?us-ascii?Q?qqzJY/Euc0UUyjv/t2B2L1JSNjAkMQXyF1kl03iKZzuJTYLDN2N+QA0bVjeA?=
 =?us-ascii?Q?DANfIFH5vbNdZ4RIG33+aXT4mmT1KRILJ0QazvRguR0CvQXc+eo1WqHL6kf1?=
 =?us-ascii?Q?K+qDgPNmFGw2uPZPBXJQDNvr6QZ+Jh8RemSPpew5Ytan+tKtMJLBNaTKcpx7?=
 =?us-ascii?Q?QAnIVtcFFN/c9BzBn9IprdWIwF56fIDXfEYRlv5npa1c1fesdt+pq8dyq+51?=
 =?us-ascii?Q?1Q1TGJsa4H4XEyLXKx0M5rE+Aa4VfeGxKexnEAagK7K3xc7iKF5oNw13EtYq?=
 =?us-ascii?Q?OsipXXY5XBx34i3uGVPyceaynYGx44wGpLW0sn44WD08NqZjfO7iq1lFXAuE?=
 =?us-ascii?Q?iK2wPXh5TP7jirkg0OtUMdbiKrsorwVgVcyQuX0NrXuQIILhVRImv+STCn9G?=
 =?us-ascii?Q?WAYAY7fZaGxugT5yWPKBCBU5XwxCHHOZ+GGzazHqV18V7du+9HwYpZ1nMoKF?=
 =?us-ascii?Q?bk9KclcKytvH53bPrEKa3f4tNzCm1ohbJQiwVOBsQFFw2nsGX4WD7mjk2iAJ?=
 =?us-ascii?Q?c4FE517y7JTHEVfg4WrzFbdmmwUVuvajtJmzBb05tjxWR3QPWJn2L/9rRmMM?=
 =?us-ascii?Q?X9nPtjZzXAR6iK9jCie7cKN6HSD7ac8bw8yobqK4Ss05jD5R3hlktIPMmnsw?=
 =?us-ascii?Q?KimLoDjRp+eJ2m/7KYv0gwlVH1O9NmBu5XI/W5peyte9eGfPI3rjyI/++77I?=
 =?us-ascii?Q?aqtAbvcPSEfxPFwjNM1k6ZDjoog/vmDTNUrPaP8rTK7y74mVbGz/joed2qrg?=
 =?us-ascii?Q?SAl70dHWoetHpEhbv77bWMKApiTh+jxoIZZm0lPblklxHrbwVAvEyb4bBQhD?=
 =?us-ascii?Q?hZSKK8aklJrPWE8LQVnya0v/Hy5HvM1AaERobm/bXociAJvjIhn2Nk1rq/HS?=
 =?us-ascii?Q?mFfgKaCCVQp9j9oxjbfhoF90rNlVvCP4dOORYtcANUeVf+Z5nm/vgAiF437F?=
 =?us-ascii?Q?xNjdJyk5JqBwgI1T26UGaxIsW2OS6X0SY/K8SBxiTtmoN34meSbQmbfIvY2m?=
 =?us-ascii?Q?lFwMxS9XLNiHzEcO6iMSrafGv+dFB5hsTE+y/Iq3wS69zF1hNmJ3wc3yoSSt?=
 =?us-ascii?Q?UjbIE0aGM8UbjHw0/4LMVh6Zyg0TXENQHXVLYUdkOfcV2e1+He4s7rBpz8mE?=
 =?us-ascii?Q?+pFAIzaJpe2qHgnTkCzDtzpS32/PBBlv+kn6fsi5lixeY1c7ngDPTfphCiWY?=
 =?us-ascii?Q?6auY88RtsEvY/s7mucurD1r5URkoidK76gwIFumbdc3siWTn6+R1tghd9odE?=
 =?us-ascii?Q?xBlSe1HPDtBMG3zC00KnXWs5sxUli/K63E1aTmt12aA7u6PZNUJslR1CexHg?=
 =?us-ascii?Q?VH6DXLhryrC5/yAK1a9KqzXRw70fyS8FcVpkzm/YVr6IC24Af77VwWnLPNql?=
 =?us-ascii?Q?jHLVJTeO4A4l733IRfEb6026LdaG+415hMiwkOtuqezcbY8EIliLFIJUZr+K?=
 =?us-ascii?Q?tRgVmuo5gkPvUF7GShg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8665.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8fepeb6p09RKN+CinAbcIE83CGOXLfjRgnWsSyAta0L84RhAGHugNdD2qLH3?=
 =?us-ascii?Q?UoQZmIe6H7AJ0L+Tj10a51KI1oXhRxal3H31IFeMfxAM66q+M17M6sr1v0xS?=
 =?us-ascii?Q?briJ1OEXQfvJa7IOVCpUJg5+jBxg3c/6WA/lPRoX0KSDIcgKearrk7z5HhOT?=
 =?us-ascii?Q?BJWtAXZUiUmqn//cHyrx5LOrhKm84qFrLKppL/yupuGM5RZNo1q3ZmgdR8KE?=
 =?us-ascii?Q?IdYpI6t0AnrjpmUa9T5sOUincd05WQgEtW1PECRUBk9qNOrKv7HGnNyzjewR?=
 =?us-ascii?Q?2issZrfzIwgvhVQLYPreuKNZZo3pYkH5JFFEZOO/uF7TxEK3hV/4VjokLZno?=
 =?us-ascii?Q?8QQ08KKglcKVOFlDThOS2WV04OtNtgEH6glHm4mZAej3LD6cJy2k+ew5H1kP?=
 =?us-ascii?Q?lcBtz5UaAOqM5h8pc8bgAkHQWep9qaaLysbbMN4xCi6z/RCc12mRCppjVNC9?=
 =?us-ascii?Q?gXz41x5SEYvLbHkRfawJxYINmPdEcbZC0NBw+LLs6JO8wiO2KmXxmdca2Nxe?=
 =?us-ascii?Q?N9+yDcmSnn5pBSEkcACxdW4oRoiX9YeJWGcBjJfL1ofAgP1tPJwHfu4W1p6C?=
 =?us-ascii?Q?LlsWKzDEk/5d50eB37ke3w0yCYpLUZp3SwoT2RapR1PXO7V+DAmj5jGKvBQr?=
 =?us-ascii?Q?KOvLiDPOYbBzaaFj11VzWLcRWNGgiPWMtkyo5vcoEgFBvxqqFbNmcbK+dTPB?=
 =?us-ascii?Q?LRDRFoKkrSBH7Y29wnOaiylN/c6gW8mKwDg8WXzS3PzyKn9EpjZbn/R9AQW3?=
 =?us-ascii?Q?gykWMk9+og0fPrTeOWfMtytYCv2CTG7JXMJzM+ZjG+a1AZWhqLl48O5JqJjX?=
 =?us-ascii?Q?1GzYWs4yenoDV8QT96Yo1VGg7nI5qWvHpu26X1BhK3Ax6KDmewqB6Rh0enMO?=
 =?us-ascii?Q?YC6FxS4RWaURZUw9fIVRuAxJdliPmRqqUOXPWVuH8YSUvq0P0TS5WhLsmWhL?=
 =?us-ascii?Q?eA8uwB94LnApV9Q8KsovtdgHvnWMb2iXWTO+ckYigtWfmH6TGbAv+kH0LIWn?=
 =?us-ascii?Q?Mo47NR9mVcTGJddGUJ89ijXcQ3jKtzlK60CvTQyeEYK+eOqZSA51wYFFNJiY?=
 =?us-ascii?Q?TrMOOpCvj7a4Y9xg7o2iZ+qvPHsmg/KqLiTDwOScfhg/qJn7NNTNPo3QQ5ci?=
 =?us-ascii?Q?WPOWHd8pKZ2l5+lqCkRnhtES8Y3LBATbJOP5mH5MoyQes+nv5Rgum2IPEYoC?=
 =?us-ascii?Q?71stb27FC6byj7r/d7xMs13wBYoDrRuIYGNBcOSiJi0XD/vIPafBe39hILln?=
 =?us-ascii?Q?NBa0zlYRF7xh4xzlQwQrxnLqaNpHAXpdFK64Pu/rkRPX6NfkfVFw9e/f1lal?=
 =?us-ascii?Q?ubjGeChh/oR6tZ+JBL2jhia+rarIf8XAAUbjKMQMeCDJQewPMl4hF+yRl3oj?=
 =?us-ascii?Q?4I7A7g1V7FFu2OaLn7UwFYw542tS8qNNm4cjDKDrEb07tmprA4Jy1RjoOmFp?=
 =?us-ascii?Q?mp19w+GNR66ZzS28AnldnjDjepqXWczOLuu0pu3C9j806t6R6j1ApxRWD7/J?=
 =?us-ascii?Q?UfbrIQwqzBu3XF0pwDRtReUzCxcJoEqnjA6YC2i7pFNhcB9CU7ZusLEtvzOW?=
 =?us-ascii?Q?okz5DW1cebRutzVW79/XcAlOq7AsKab5B+hy/W4C/IW1WaxWEL6PSzjGxfHI?=
 =?us-ascii?Q?2fdZOzSgMWuVmvwO3Dexvi4rLzMi2WiWtbn70klldgMJl7VByepPOcyTKxW+?=
 =?us-ascii?Q?svggo6ICcqA1Vt5YKZWR8/ZZmsZvV+jmJtAn67Fj9WGw+2kLTg0KzwSYUD6o?=
 =?us-ascii?Q?ptR7anKezQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a4a2782-28e4-4a84-c7a7-08de573ca146
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:25:05.0546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6DdWHGbv7/w+cF8eWNBh26bQ1DODQkXlUG1Do4Erg0VYKbg2riJObLy8TpzF6d28K0fzol5p3VO5PhA0JpaNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4672
X-OriginatorOrg: intel.com

On Wed, Dec 03, 2025 at 03:41:50PM +0800, Binbin Wu wrote:
>
>
>On 10/1/2025 10:53 AM, Chao Gao wrote:
>
>[...]
>>  
>> +/*
>> + * Update tdx_sysinfo and check if any TDX module features changed after
>> + * updates
>> + */
>> +int tdx_module_post_update(struct tdx_sys_info *info)
>> +{
>> +	struct tdx_sys_info_version *cur, *new;
>> +	int ret;
>> +
>> +	/* Shouldn't fail as the update has succeeded */
>> +	ret = get_tdx_sys_info(info);
>> +	if (ret) {
>> +		WARN_ONCE(1, "version retrieval failed after update, replace TDX Module\n");
>
>Nit:
>Could be if (WARN_ONCE(ret, "..."))

ack.

>
>> +		return ret;
>> +	}
>> +
>> +	guard(mutex)(&tdx_module_lock);
>> +
>> +	cur = &tdx_sysinfo.version;
>
>Nit:
>After update, the current TDX module is the new TDX module already, may be
>better to use old instead of cur.

Indeed.

>
>> +	new = &info->version;
>> +	pr_info("version %u.%u.%02u -> %u.%u.%02u\n", cur->major_version,
>> +						      cur->minor_version,
>> +						      cur->update_version,
>> +						      new->major_version,
>> +						      new->minor_version,
>> +						      new->update_version);
>> +
>> +	/*
>> +	 * Blindly refreshing the entire tdx_sysinfo could disrupt running
>> +	 * software, as it may subtly rely on the previous state unless
>> +	 * proven otherwise.
>> +	 *
>> +	 * Only refresh version information (including handoff version)
>> +	 * that does not affect functionality, and ignore all other
>> +	 * changes.
>> +	 */
>> +	tdx_sysinfo.version	= info->version;
>> +	tdx_sysinfo.handoff	= info->handoff;
>> +
>> +	if (!memcmp(&tdx_sysinfo, info, sizeof(*info)))
>> +		return 0;
>> +
>> +	pr_info("TDX module features have changed after updates, but might not take effect.\n");
>> +	pr_info("Please consider a potential BIOS update.\n");
>
>
>BIOS update?
>I guess it's "TDX module update via BIOS"?

ok. I will update the log message.

>
>Does it mean after a system reboot, the change done by TD preserving update will
>be gone?

Yes. After reboot, the update will be gone. The (old) TDX module will be
reloaded by the BIOS.

>If we want the TDX module upgrade to be permanent, it needs to replace
>the TDX module binary the BIOS will load, right?

Yes.

>
>So the scenario of TD preserving update seems to be limited to security fixes?
>(I guess the security fixes will take effect directly after TD preserving
>update?)

Yes. Fixes (whether security, performance, or functional) will take effect. New
features won't. This series takes a minimalist approach, updating only the
module version and handoff-version while leaving all other TDX metadata
unchanged.

I think this conservative approach is appropriate for initial support. New
features can be gradually enabled later as we prove that other components
(e.g., KVM) are ready for new features introduced via runtime updates.

This enabling approach is aligned with current microcode updates.
