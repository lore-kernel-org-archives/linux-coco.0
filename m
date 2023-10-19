Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581D217C2
	for <linux-coco@lists.linux.dev>; Thu, 19 Oct 2023 04:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDvva9Bi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697690634; x=1729226634;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9o3qXKcaDukoVCfBhBS+VtIBhtn9hnotNlBXy6dmnhA=;
  b=oDvva9Bih+Izh9Xznq5QaNF+iCFkmkb1TMpa0uwivntEF0foifZniDIP
   CCz8Kn67dsWLCZJmp37DMbgkrPXt2WN7IAQ9ToZh2WSRRtt87O6xoQXJp
   Y7/o0+1egA6P70nscQ4sMhw2MpDXMbyp6HmjiQ1vAi7XK+AJnlG7C/rvn
   SuFGAgwIMwVEgrZfGXF7lXTmQM0qEXlZos/O2IykiRgoaW5iWY2Tnodh0
   02ZNOj2mh5UtVBiBk4mf8ZRnZeySakycvhjC/QNmAKA5YG42wld8jvxmK
   3YLnq8BrL+CG8GgD/X3X4vToQvQSXOm7p8Uu1hh9ZBvB8QxZ5Qu69dnkd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="472402997"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="472402997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 21:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706721234"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="706721234"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 18 Oct 2023 21:43:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 18 Oct 2023 21:43:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 18 Oct 2023 21:43:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 18 Oct 2023 21:43:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZTc7OzKGyd0MxV2wkS0yklgwkjwXe2wBzhh7N2ThP+zYZJSdS0PejuGIpv63oafDqKOajnecYnLTTvft5jub9YUmiZYAMZ/UfFm+H0jd1bgvkC8rCfkIjfzhoua04iu3/0w4K563mhiV3TrH3wS91FTNW6sy4VJmomFrHG2p1qngSuy0EUYqh9hKxWnlxK1XGzydtnEboi1+7WS/H+vQuQqV1AosY2Xgb3YT0JBPsbqwPLWOrVUXXwETGlXnOgFewBA46AqmPJkJnJ9HHs+iJmRQRlpNx0pMweXV8jI17dgRrp0dvZG/7Vjjxay/ma65qo6uGEB3oH1T0YKNPMByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxZJCYgyV+TiritK4STpx9ximqr12bzHCvEAyY+1HQ0=;
 b=M8MFl+z9/7iItUbV5P2SLMRTItLa9jmT5eaiu7pBIYmxjKN75m4g21IvvDrdUCck43vgcwQSSHUyBDpvCnyYG1nwr3zKsJp6BY6lvF5CWeq8SFNKJq/iM5ByVa1m8pyECBoXmqsKP9HF7A6TtjZxlS8DXKsL5eT9RDbaOZBmaEmxJG5+JkTThK72zsk7EZeOnkiC1h6BrcKG3DAoIf+aKHOUuWTfD0GTBIKH81ubuo9RcUfwm9Z1kJ3/I2n6Ou4cSXQkJXBfJwQLlpyrsqA6kDZH3TUDjqIuaNUIhBvRMi+5TMHlLX4TdpV0Dyo+3VMd8nG0m+tX+srtbZJ1R7D8hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB6424.namprd11.prod.outlook.com (2603:10b6:8:c4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21; Thu, 19 Oct 2023 04:43:44 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::7978:1ba5:6ed0:717d%4]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 04:43:44 +0000
Date: Wed, 18 Oct 2023 21:43:41 -0700
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
Message-ID: <6530b3fda1e2d_5c0d29451@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <169716323436.984874.9170967990536970455.stgit@dwillia2-xfh.jf.intel.com>
 <169716326994.984874.4170603294020542086.stgit@dwillia2-xfh.jf.intel.com>
 <3e8aae49-010c-43be-888b-b3ed9ad85610@amd.com>
 <652e086f8de7_f879294b0@dwillia2-mobl3.amr.corp.intel.com.notmuch>
 <d52fedac-c1a1-43e4-abce-f6bca273f352@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d52fedac-c1a1-43e4-abce-f6bca273f352@amd.com>
X-ClientProxiedBy: MW4PR04CA0300.namprd04.prod.outlook.com
 (2603:10b6:303:89::35) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-coco@lists.linux.dev
List-Id: <linux-coco.lists.linux.dev>
List-Subscribe: <mailto:linux-coco+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-coco+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB6424:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2e4eb8-ce21-4268-4f79-08dbd05df96b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pi8rSTNPn1iRuOIdE2DEVtPYGcrbnnDSjNMGHw0cYkL3qw0nLrN5Na4tSS6gL1eJZdKGx7BN2b9XFnhcbzVBBQhv+m7vE5cpnIQ7CObLD3juDz71bprgrWiuLVcMIzMeVEiGufEwY6KYBRk++h8OCefrmfpT5KOY3cD0/zAUCxTCuqgo+mj+8Ys1TcXKUQaGsiXQmrYprY5Yk5cEx+htKT9y8cE8Vl50rU9eiAlcNjgBgYLTn3ML5HVmofCoECQzLYTYizXQboqWdtSNfRFwP3TGNBmmDoBzsrBc1WP6UkHLqaLERJooI2ldvhYuxGgGKnMPS5n5yVoRo3YejN8P135R4tgW6ZfU2g+bR6k+5+2GHqtrAcIkbHxc2nGGmNv67LgpRh0AuB7O0RLLm8m2xVusMrly9K0XSYV0wYta6T91DxD/2y3J1xH30/FlvcOKjjnbAS8NKGwhWKPdU7jy70x+Ec1Iw4jAgslgIiMf1UbjafMmMhBfWO9R28rMbl2E2FJcy+F4fAja7A9qFxLJ0IVmx2FsHD6pxXzvAVQleuaJBwreDWkPbTVZMr8gLwoPDRzFn4ZgqGNB3dSQncTqSQqx3I+HsArrWauzTFl+5bs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(396003)(346002)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6486002)(66556008)(66476007)(316002)(110136005)(478600001)(66946007)(26005)(83380400001)(82960400001)(86362001)(38100700002)(6506007)(54906003)(6666004)(9686003)(6512007)(7416002)(2906002)(41300700001)(5660300002)(8936002)(8676002)(4326008)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3XwdLqNZWCEo7icpQ8PQftz84sN/QKnSvRbploMfp3accZIDWcpVw3EEsVaZ?=
 =?us-ascii?Q?+rpGMp4TGac3Hmhr2rAGNKmp55hpCtWHSRlc+bF4/8MO4UdybXEu9P+5sUnc?=
 =?us-ascii?Q?CG3sn/m+xY4EXXmjFom5ode1M6NhCJNVfCfJrdzYoYYTvn0fDWw6OmrSYKOt?=
 =?us-ascii?Q?arL/nZ1rb/mh6sDJn/z9d3VqhbQLBRS/ERjl10nfs0Fom2lH/G8pwja80UDl?=
 =?us-ascii?Q?EBhDWZm7INppjGYqbI1rsOV7xV9QUpQvTVr6YOHyBSaJSJKa2kqdRykuf7gW?=
 =?us-ascii?Q?Xk/yA0lZsPzjG4hJoue6WiXoWzsMM9m431XTpjZxfmFK0N/lKHuKSF72vUU1?=
 =?us-ascii?Q?pTQZME1f1sTnYAFObxRwi/AAij0I4mlJExMDUPwAKEqRRI08M83NLp6J6wtE?=
 =?us-ascii?Q?vztiykdpSE2B+51//4DBBK8FmX6s1HEpiRLlwDTuDXv3XKt2NNT3UFSIyfUn?=
 =?us-ascii?Q?y4qqro2Uqh3lcNffuYdq2q1N5CAQcYic7s2d/51L0SC+q1WG/x1Kcs832M5b?=
 =?us-ascii?Q?Z/gTGfllJvTVCoYKkj8miaPEbzI/eQcW2eAfHr9UXFOcQW5DZSXCxQDM7hA9?=
 =?us-ascii?Q?yfnxm3ouP8MQYkzQR1s9zEkUNOXlF4lxBCU7doHhIw5h0b+lLgexhxM7DhC/?=
 =?us-ascii?Q?l36ulv8W8aGWjC+n2B50iGnIXOcP5seTZlOvieKK8aZW7O1A+IKSFc7cZf5f?=
 =?us-ascii?Q?bgRkKhpJwQ4fP6QQEDLVw9Qbl6ryJ8LdLxz2Qmq8Ke3VK3Bk6dWLCYggUnml?=
 =?us-ascii?Q?jiW9zc9a+0+Z+0UZyZqGi2pDd5kW1/qaX1dGv0OXHdsmKuc/PO0uMbRtwaG9?=
 =?us-ascii?Q?wyVN1Hd0Dy3P54Sn379NS5p8Vqe/3Mw+/5NvSvePZCmB/J5wztk1lQZ09C1O?=
 =?us-ascii?Q?yfe5YTrLL301x90N754O0SVS9ffmVwMr1niFRd6Uw19xOfr2x7bZB4k55ZUi?=
 =?us-ascii?Q?qx0e/vRxCkypv424yGE5hNCv+y5y4DlFIZvbrlAgL+etx6Ym6igHaBcEB+Og?=
 =?us-ascii?Q?nWP4vuE3iDEoi8jsynT8RKpNU/S38NUiTb+QalO9VhTnNMkM50CTJNiBE+rP?=
 =?us-ascii?Q?3EnBmHy+14zBicy6qU0Vc0HqL++O4hnr5q5YjbuHqKtVGWoX+hLIA7GJ7TYP?=
 =?us-ascii?Q?Xc0ckqUO1KCKfUMlEJYExDFuQaYZeAXJji7eSEkKEWV1/uZpGJX2poqlIHUj?=
 =?us-ascii?Q?37OYaUNEqydSKaPezYc4wi8akS+DKZ/Or/VFPj4EFxuCiPem9UnDgJiGr+nR?=
 =?us-ascii?Q?SYBWKVOnsX/9/RLDbok9VF4mRctWIH4JJxi2Vv9t6XascmGZKsp0X9YOlQua?=
 =?us-ascii?Q?wYribK/PRGAQdOlaU4GSdlccOGcRedBpl8TnrdwYjELiS8schLtGU2Gt7lbb?=
 =?us-ascii?Q?mrr8xtteWhf51hwS6Fqy7v0yAiTPig+rtNUS5jjeE6xC6wtO3ClgagFlhkV1?=
 =?us-ascii?Q?Q+z6hWOqHJM6+WvzSjgu9TvjvE19M94AxluBr+vr/ITBiI1WC8dvge+N/qb/?=
 =?us-ascii?Q?2prGMjfeTscNOO8wYhKjHvS9bMeLw2sHTZ+iu2mxChYXSHcRq2AgHNRKJkVB?=
 =?us-ascii?Q?wwdVHcskMN8lfVmqOEhcYjcaUHgV1uB9ZJgQqcgkKt56kpOovaGTqEZJxs7n?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2e4eb8-ce21-4268-4f79-08dbd05df96b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 04:43:43.9321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOaX5oXAC8b3tlmalM60HQO56JhJFYchx5LeOXCMIKw5OkjDSkzEKNkNPlwxdzv5RecoWe4waJzQVUYamlfngpd6PI8DlMl8MldBA0HiBxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6424
X-OriginatorOrg: intel.com

Alexey Kardashevskiy wrote:
[..]
> > Yes, it's been allowed in loop declaration for a few kernels now and the
> > new __free() helper in cleanup.h will make this model more prominent. My
> > sense is that it is still not open season on mid-function declarations,
> > but __attribute__((__cleanup__())) usage needs it.
> > 
> >> Since you are doing this, move zero_ent below. Or, better, use
> >> guid_is_null().
> > 
> > guid_is_null() is not techinically enough given the specification
> > mandates that the entire entry is zero.
> 
> Well technically it says that guid, offset and length must be zeroes. 
> So, (guid_is_null() && !offset && !length) and no yet another static 
> declaration of a bunch of zeroes far away. I even wonder if there is a 
> helper to check if some memory is all zeroes :) Up to you.

Ok, I switched to comparing each field to zero.

[..]
> >>> +	if (ret)
> >>> +		return ret;
> >>> +
> >>> +	memcpy(&hdr, buf, sizeof(hdr));
> >>> +	if (hdr.status == SNP_REPORT_INVALID_PARAM)
> >>> +		return -EINVAL;
> >>> +	if (hdr.status == SNP_REPORT_INVALID_KEY_SEL)
> >>> +		return -EINVAL;
> >>> +	if (hdr.status)
> >>> +		return -ENXIO;
> >>> +	if ((hdr.report_size + sizeof(hdr)) > report_size)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	void *rbuf __free(kvfree) = kvzalloc(hdr.report_size, GFP_KERNEL);
> >>> +	if (!rbuf)
> >>> +		return -ENOMEM;
> >>> +
> >>> +	memcpy(rbuf, buf + sizeof(hdr), hdr.report_size);
> >>> +	report->outblob = no_free_ptr(rbuf);
> >>> +	report->outblob_len = hdr.report_size;
> >>> +
> >>> +	certs_size = 0;
> >>> +	for (i = 0; i < ext_size / sizeof(struct snp_msg_cert_entry); i++) {
> >>> +		if (memcmp(&cert_table[i], &zero_ent, sizeof(zero_ent)) == 0)
> >>> +			break;
> >>> +		certs_size = max(certs_size, cert_table[i].offset + cert_table[i].length);
> >>> +	}
> >>> +
> >>> +	/* No certs to report */
> >>> +	if (!certs_size)
> >>
> >> Nit: WARN_ON_ONCE(i) here?
> > 
> > Seems harsh for what could only be a firmware bug, panic_on_warn users
> > would not appreciate crashing the kernel over something recoverable like
> > this.
> 
> This would a HV bug as certificates come from the KVM. And it is 
> (slightly) more likely that the HV is trying to trigger buffer overrun 
> in the guest.

Added a dev_warn_ratelimited(). WARN_ON_ONCE() is too heavy as I expect
panic_on_warn policy has more reason to be deployed in a confidential VM
than other places.

> 
> >>
> >>> +		return 0;
> >>> +
> >>> +	/*
> >>> +	 * cert_table reports more data than fits in ext_size the
> >>> +	 * userspace cert_table walker can decide what happens next,
> >>> +	 * truncate the output
> >>> +	 */
> >>> +	if (certs_size > ext_size)
> >>> +		certs_size = ext_size;
> >>
> >> This sounds more like the HV provided a broken table with offset(s)
> >> ouside of the certs buffer. The HV is expected instead return
> >> SW_EXITINFO2=0x0000000100000000 and RBX=requred_pages_number, and the
> >> guest to retry.
> > 
> > The existence of SEV_FW_BLOB_MAX_SIZE suggests the driver is not
> > prepared to retry. Retry support would be a follow-on new capability.
> 
> My point is that you should not get into the situation when this 
> calculated certs_size is greater than ext_size. If this is the case 
> because someone sent too many certificaties via /dev/sev or kvmfd on the 
> host, the GHCB call won't return any certs and will ask for a retry instead.

I understand, but given this needs to walk the entries anyway to size
the buffer correctly this sanity check is "free".

> >>> +
> >>> +	void *cbuf __free(kvfree) = kvzalloc(certs_size, GFP_KERNEL);
> >>> +	if (!cbuf)
> >>> +		return -ENOMEM;
> >>
> >> In a such (unlikely) event the function returns an error but does not
> >> free report->outblob which is going to leak if consequent call succeded.
> >> This new no_free_ptr business is confusing at times :(
> > 
> > If this fails it results in the attribute read failing and
> > read_generation does not advance. The next read attempt will free the
> > partially completed report and retry,
> 
> Ah ok. In general, it just feels like every use of no_free_ptr() defeats 
> the whole purpose of __free(xxx).

no_free_ptr() is there to say "we correctly populated this buffer,
there are no more error returns in this function, transition the
responsibility of freeing this buffer to the object it was assigned".
